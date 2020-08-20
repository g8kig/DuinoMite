/*








 */
#include <stdio.h>
#include <plib.h>

#define INCLUDE_FUNCTION_DEFINES
#include "Maximite.h"
#include "MMBasic.h"
#include "Operators.h"
#include "Commands.h"
#include "External.h"
#include "Misc.h"
#include "Files.h"
#include "I2C.h"

#include "../Video/Video.h"
#include "../SDCard/SDCard.h"
#include "../Timers/Timers.h"
#include "../Serial/Serial.h"
#include "Setup.h"
#include "RTC.h"
#include "../IOPorts.h"

void WriteRTC(void);

static const char *DayOfWeek[] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
static const char *Months[] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};

volatile int SleepMMVal;

static int dayofweek(void);

#define waiti2cIdle() while( (I2C1CON & 0x0000001F) || (I2C1STAT & 0x00004000) );

static int bcd2int(int val) {
    return ((((val & 0xf0) >> 4) * 10) + (val & 0xf));
}

static int int2bcd(int val) {
    return (((val / 10) << 4) + (val % 10));
}

static int dayofweek(void) /* 0 = Sunday */ {
    unsigned int d = day, y = year, m = month;
    //==============================================================================================
    //d, m, y used only to preserve day, year & month vars
    //day, month & year cannot be used as they may be modified returning the wrong date values.
    //==============================================================================================

    d = (d += m < 3 ? y-- : y - 2, 23 * m / 9 + d + 4 + y / 4 - y / 100 + y / 400) % 7;

    return d;
}

// some temp commands for testing

void cmd_SDEnable(void) {
    TRISDbits.TRISD5 = 0;
    TRISDbits.TRISD1 = 0; // The TRIS bit for the SCK pin
    TRISDbits.TRISD2 = 1; // The TRIS bit for the SDI pin
    TRISDbits.TRISD3 = 0; // The TRIS bit for the SDO pin
    S.SDEnable = true;
    SDCardRemoved = true;
}

void cmd_SDDisable(void) {
    SD_CS_SET_HI; // SD_CS = 1; 
    SPISTAT &= 0x7FFF;
    CloseSPI();
    S.SDEnable = false;
}

void cmd_mmss(void) {
    unsigned int val;
    val = getinteger(cmdline);
    if (val && !ScreenSaveTime)
        mT3IntEnable(1); // turn on video int

    ScreenSaveTime = val;
}

void fun_mmss(void) {
    fret = (float) ScreenSaveTime;
}

void WriteRTCC(void) {
    rtccTime tm;
    rtccDate dt;
    tm.l = 0;
    tm.sec = int2bcd(second);
    tm.min = int2bcd(minute);
    tm.hour = int2bcd(hour);

    dt.wday = int2bcd(dayofweek());
    dt.mday = int2bcd(day);
    dt.mon = int2bcd(month);
    year -= 2000;
    dt.year = int2bcd(year);
    RtccSetTimeDate(tm.l, dt.l);
    WriteRTC();
}

void ReadRTCC(void) {
    rtccTime tm1;
    rtccDate dt1;
    RtccGetTimeDate(&tm1, &dt1);
    second = bcd2int(tm1.sec);
    minute = bcd2int(tm1.min);
    hour = bcd2int(tm1.hour);
    dow = bcd2int(dt1.wday);
    day = bcd2int(dt1.mday);
    month = bcd2int(dt1.mon);
    year = bcd2int(dt1.year);
    year += 2000;
}

unsigned char I2CRXByte(char ack) {
    unsigned char RX;
    I2CReceiverEnable(I2C1, true);
    while (!I2CReceivedDataIsAvailable(I2C1));
    RX = I2CGetByte(I2C1);
    if (ack) {
        I2C1CONbits.ACKDT = 0; // going to get more data ack byte
        I2C1CONbits.ACKEN = 1;
    } else {
        I2C1CONbits.ACKDT = 1; // done reading data nack byte
        I2C1CONbits.ACKEN = 1;
    }
    while (I2C1CON & 0x0000001F);
    I2CReceiverEnable(I2C1, false);
    return RX;
}

void ReadRTC(void) {
    rtccTime tm;
    rtccDate dt;
    if (S.RTCEnable) {
        char I2CAdd = 0;
        char StartAdd = 0;
        char StartDow = 0;

        ExtCfg(5, EXT_COM_RESERVED);
        ExtCfg(6, EXT_COM_RESERVED);
        if (S.RTCEnable == 1) {
            I2CAdd = 0xa2;
            StartAdd = 2;
            StartDow = 0;
        } else if (S.RTCEnable == 2) {
            I2CAdd = 0xd0;
            StartAdd = 0;
            StartDow = 1;
        }

        if (I2CAdd != 0) {
            I2CConfigure(I2C1, I2C_ENABLE_SLAVE_CLOCK_STRETCHING | I2C_ENABLE_HIGH_SPEED);
            I2CSetFrequency(I2C1, 80000000, 100000);
            I2CEnable(I2C1, true);
            I2CStart(I2C1);
            waiti2cIdle();
            I2CSendByte(I2C1, I2CAdd);
            while (I2C1STAT & 0x00004000); //wait tx complete
            if (I2CByteWasAcknowledged(I2C1)) { //I2CByteWasAcknowledged(I2C1))
                I2CSendByte(I2C1, StartAdd);
                waiti2cIdle();
                I2CRepeatStart(I2C1);
                waiti2cIdle();
                I2CSendByte(I2C1, I2CAdd + 1);
                while (I2C1STAT & 0x00004000); //wait tx complete
                tm.l = 0;
                tm.sec = (I2CRXByte(1) & 0x7f);
                tm.min = (I2CRXByte(1) & 0x7f);
                tm.hour = (I2CRXByte(1) & 0x3f);
                if (S.RTCEnable == 1) {
                    dt.mday = (I2CRXByte(1) & 0x3f);
                    dt.wday = (I2CRXByte(1) & 0x07);
                }
                if (S.RTCEnable == 2) {
                    dt.wday = (I2CRXByte(1) & 0x07);
                    dt.mday = ((I2CRXByte(1) & 0x3f) - 1);
                }
                dt.mon = (I2CRXByte(1) & 0x1f);
                dt.year = I2CRXByte(0);
                I2CStop(I2C1);
            }

            I2CEnable(I2C1, false);
            ExtCfg(5, EXT_NOT_CONFIG);
            ExtCfg(6, EXT_NOT_CONFIG);
        }
    }

    RtccOpen(tm.l, dt.l, 0); // set time, date and calibration in a single operation
    RtccSetAlarmTimeDate(tm.l, dt.l);
}

void WriteRTC(void) {
    if (S.RTCEnable) {
        rtccTime tm1;
        rtccDate dt1;
        char I2CAdd = 0;
        char StartAdd = 0;
        if (S.RTCEnable == 1) {
            I2CAdd = 0xa2;
            StartAdd = 2;
        } else if (S.RTCEnable == 2) {
            I2CAdd = 0xd0;
            StartAdd = 0;
        }

        if (I2CAdd != 0) {
            ExtCfg(5, EXT_COM_RESERVED); // clear BASIC interrupts and disable PIN and SETPIN
            ExtCfg(6, EXT_COM_RESERVED);

            I2CConfigure(I2C1, I2C_ENABLE_SLAVE_CLOCK_STRETCHING | I2C_ENABLE_HIGH_SPEED);
            I2CSetFrequency(I2C1, 80000000, 100000);
            I2CEnable(I2C1, true);

            RtccGetTimeDate(&tm1, &dt1);

            I2CStart(I2C1);
            waiti2cIdle();
            I2CSendByte(I2C1, I2CAdd);
            while (I2C1STAT & 0x00004000); //wait tx complete
            if (I2CByteWasAcknowledged(I2C1)) { //I2CByteWasAcknowledged(I2C1))
                I2CSendByte(I2C1, StartAdd);
                while (I2C1STAT & 0x00004000); //wait tx complete
                I2CSendByte(I2C1, tm1.sec);
                while (I2C1STAT & 0x00004000); //wait tx complete
                I2CSendByte(I2C1, tm1.min);
                while (I2C1STAT & 0x00004000); //wait tx complete
                I2CSendByte(I2C1, tm1.hour);
                while (I2C1STAT & 0x00004000); //wait tx complete

                if (S.RTCEnable == 1) {
                    I2CSendByte(I2C1, dt1.mday);
                    while (I2C1STAT & 0x00004000); //wait tx complete
                    I2CSendByte(I2C1, dt1.wday);
                    while (I2C1STAT & 0x00004000); //wait tx complete
                } else if (S.RTCEnable == 2) {
                    I2CSendByte(I2C1, (dt1.wday + 1));
                    while (I2C1STAT & 0x00004000); //wait tx complete
                    I2CSendByte(I2C1, dt1.mday);
                    while (I2C1STAT & 0x00004000); //wait tx complete
                }

                I2CSendByte(I2C1, dt1.mon);
                while (I2C1STAT & 0x00004000); //wait tx complete
                I2CSendByte(I2C1, dt1.year);
                while (I2C1STAT & 0x00004000); //wait tx complete
                I2CStop(I2C1);
            }
            
            I2CEnable(I2C1, false);
            ExtCfg(5, EXT_NOT_CONFIG); // set pins to unconfigured
            ExtCfg(6, EXT_NOT_CONFIG);
        }
    }

}

void PrintDateTime(void) {
    char temp[32];
    ReadRTCC();
    sprintf(temp, "%s %s %d %d %d:%02d:%02d \n\r", DayOfWeek[dow], Months[month - 1], day, year, hour, minute, second);
    MMPrintString(temp);
}

/*
 * sleep minute 00              ' Seconds 0-59
                Will wakeup every minute when seconds = 0
  
 * sleep Hour   10,00           ' Minutes 0-59, Seconds 0-59
                Will wakeup every hour when Minutes = 10 Seconds = 0
  
 * sleep day    10,10,00        ' Hours 0-23, Minutes 0-59, Seconds 0-59
                Will wakeup every day at 10:10:00
 
 * sleep week   0,10,10,00      ' Day Of Week 0-6, Hours 0-23, Minutes 0-59, Seconds 0-59
                Will wakeup every sunday at 10:10:00 
 
 * sleep month  1,10,10,00      ' Day of month 1-31, Hours 0-23, Minutes 0-59, Seconds 0-59
                Will wakeup on the 1st of the month at 10:10:00
 
 * sleep year   12,1,10,10,00   ' Month 1-12, Day of month 1-31, Hours 0-23, Minutes 0-59, Seconds 0-59
                Will wakeup on Dec 1st at 10:10:00
 * 
 */
void cmd_sleep(void) {
    rtccTime tm;
    rtccDate dt;
    char *p, cmd = 0;
    p = cmdline;

    RtccGetTimeDate(&tm, &dt);

    if ((p = checkstring(p, "MINUTE")) != NULL) {
        cmd = RTCC_RPT_MIN;
    }
    p = cmdline;
    if ((p = checkstring(p, "HOUR")) != NULL) {
        cmd = RTCC_RPT_HOUR;
    }
    p = cmdline;
    if ((p = checkstring(p, "DAY")) != NULL) {
        cmd = RTCC_RPT_DAY;
    }
    p = cmdline;
    if ((p = checkstring(p, "WEEK")) != NULL) {
        cmd = RTCC_RPT_WEEK;
    }
    p = cmdline;
    if ((p = checkstring(p, "MONTH")) != NULL) {
        cmd = RTCC_RPT_MON;
    }
    p = cmdline;
    if ((p = checkstring(p, "YEAR")) != NULL) {
        cmd = RTCC_RPT_YEAR;
    }

    SleepMMVal = 0;
    mT1IntEnable(0); // turn off usb int
    mT4IntEnable(0); // turn off timer int
    mT3IntEnable(0); // turn off video int

    ConfigINT1(EXT_INT_PRI_2 | FALLING_EDGE_INT | EXT_INT_ENABLE);
    ConfigINT4(EXT_INT_PRI_2 | FALLING_EDGE_INT | EXT_INT_ENABLE);
    RTCALRM = 0x00000900;
    RtccChimeEnable(); // rollover
    RtccSetAlarmRptCount(0); // we'll get more than one alarm
    RtccSetAlarmRpt(cmd); // one alarm every second
    while (RtccGetAlrmSync());
    RtccSetAlarmTimeDate(tm.l, dt.l);
    mRtccSetIntPriority(INT_PRIORITY_LEVEL_6, INT_SUB_PRIORITY_LEVEL_1);
    mRtccEnableInt();
    RtccAlarmEnable();
    PowerSaveSleep();
    mRtccDisableInt();
    RtccAlarmDisable();
    TRISBbits.TRISB13 = 0;
    mSec(20);
    SDCardRemoved = true;
    InitSDCard();
    mCNIntEnable(1);
    if (S.UsbEnable) mT1IntEnable(1); // turn on usb int
    mT4IntEnable(1); // turn on timer int
    if (S.VideoMode) mT3IntEnable(1); // turn on video int
}

void fun_mmsleep(void) {
    fret = (float) SleepMMVal;
}

void __ISR(_RTCC_VECTOR, ipl6) RtccIsr(void) {
    // once we get in the RTCC ISR we have to clear the RTCC int flag
    SleepMMVal = 1;
    INTClearFlag(INT_RTCC);
}
