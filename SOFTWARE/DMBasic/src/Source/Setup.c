/*
 * Interactive Setup for DuinoMite MMBasic
 * 1) Video options
 * 2) DuinoMite Options
 * 3) Enable Internal Flash Drive and size
 * 4) Boot up splash screen txt
 * 5) Boot up splash graphic
 * 6) Allow Custom video modes
 *
 */
#include <stdlib.h>
#include <string.h>
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
#include "Setup.h"
#include "../SDCard/SDCard.h"
#include "../Keyboard/Keyboard.h"
#include "../Video/Video.h"
#include "../Source/MMBasic/I2C.h"

#define NVM_PAGE_SIZE    4096

static struct _SetupStruct SS;
struct _SetupStruct S;

const int BaudRateList[] = {
    9600,
    19200,
    38400,
    57600,
    115200
};

static char temp[80];
static char c;
static int i;
static int SETUP = 0;

volatile unsigned int ScreenSaveTime;

#ifndef __XC32__
#define NVM_ALLOCATE(name, align, bytes) volatile unsigned char name[(NVM_PAGE_SIZE)] \
        __attribute__ ((aligned(align),section(".text,\"ax\",@progbits #"))) = \
        { [0 ...NVM_PAGE_SIZE-1] = 0xFF }
#else
#define NVM_ALLOCATE(name, align, bytes) volatile unsigned char name[(NVM_PAGE_SIZE)] \
         __attribute__ ((aligned(align),space(prog),section(".nvm"))) = \
         { [0 ...NVM_PAGE_SIZE-1] = 0xFF }
#endif    

NVM_ALLOCATE(SetupInFlash, NVM_PAGE_SIZE, NVM_PAGE_SIZE);

static void MenuPrint(const char *string) {
    MMPrintCRLF();
    if (string == NULL) {
        MMPrintString(" -----------------------------------------");
    } 
    else {
        MMPrintString(string);
    }
}

char SaveSetup(void) {
    if (!SS.VideoMode && !SS.UsbEnable && !SS.SerialCon) {
        MenuPrint("!! No Consoles Enabled are you sure you want to save !! Y/N ");
        i = MMgetchar();
        if (i != 'y') {
            return 0;
        }
    }
    INTDisableInterrupts();
    NVMErasePage((void*) SetupInFlash);
    NVMWriteRow((void*) SetupInFlash, (void*) &SS);
    INTEnableInterrupts();
    return 1;
}

void SetupDefaults(void) {
    S.Magic = 0xbeef;
    S.WriteCount = 0x000;
    S.HardWare = 1;                                                             // 1 = Duinomite 0 = Maximite
    S.VideoMode = 3;
    S.RTCEnable = 0;                                                            // 1 = NXP 2 = Dallas Semi
    S.DateFormat = 0;
    S.DTimeDate = 0;                                                            // Display Date and time at boot
    S.SDEnable = 1;
    S.UsbEnable = 1;
    S.SerialCon = 0;
    S.BaudRate = 115200;
    S.ScreenSave = 0;
    S.GameDuino = 0;
    S.PS2Enabled = 1;
    S.KeyBLaout = 0;
    S.C_VRES = 216;
    S.C_HRES = 304;
    S.C_LINE_N = 312;
    S.C_LINE_T = 5120;
    S.C_VSYNC_N = 3;
    S.C_VBLANK_N = (S.C_LINE_N - S.C_VRES - S.C_VSYNC_N);
    S.C_PREEQ_N = ((S.C_VBLANK_N / 2) - 8);
    S.C_POSTEQ_N = (S.C_VBLANK_N - S.C_PREEQ_N);
    S.C_PIX_T = 11;
    S.C_HSYNC_T = 374;
    S.C_BLANKPAD = 8;
    
    INTDisableInterrupts();
    NVMErasePage((void*) SetupInFlash);
    NVMWriteRow((void*) SetupInFlash, (void*) &S);
    INTEnableInterrupts();
}

void LoadSetup(void) {
    memcpy(&S, (void *) SetupInFlash, sizeof (S));
    if (S.Magic != 0xbeef)
        SetupDefaults();
    if (S.ScreenSave) ScreenSaveTime = (S.ScreenSave * 60);
}

/*
 Setup menu is max 50 chars wide to work with lowest res screen
 and 15 lines
 */
void SetupMainMenu(void) {
    MMcls();
    MMPrintString("\033[2J\033[H");
    MMPrintString(" DuinoMite Setup Menu - "SetupVersion"  "Date);
    MenuPrint(NULL);
    MenuPrint(" Hardware Platform - ");
    MMPrintString(SS.HardWare == 1 ? "DuinoMite" : "Maximite");
    MenuPrint(" V) Video Mode     - ");
    switch (SS.VideoMode) {
        case 0:
            MMPrintString("Video Disabled");
            break;
        case 1:
            MMPrintString("NTSC");
            break;
        case 2:
            MMPrintString("NTSC(480)");
            break;
        case 3:
            MMPrintString("PAL");
            break;
        case 4:
            MMPrintString("Custom");
            break;
    }
    MenuPrint(" R) RTC On Boot    - ");
    switch (SS.RTCEnable) {
        case 0:
            MMPrintString("Off");
            break;
        case 1:
            MMPrintString("PCF8563");
            break;
        case 2:
            MMPrintString("DS1307");
            break;
    }
    MenuPrint(" D) Date Format    - ");
    if (SS.DateFormat)
        MMPrintString("MM/DD/YY");
    else
        MMPrintString("DD/MM/YY");
    MenuPrint(" T) Show Time Date - ");
    if (SS.DTimeDate)
        MMPrintString("Enabled");
    else
        MMPrintString("Disabled");

    MenuPrint(" G) GameDuino Init - ");
    switch (SS.GameDuino) {
        case 0:
            MMPrintString("Disabled");
            break;
        case 1:
            MMPrintString("Enabled 60hz");
            break;
        case 2:
            MMPrintString("Enabled 72hz");
            break;

    }
    MenuPrint(" N) Screen Saver   - ");
    if (SS.ScreenSave) {
        sprintf(temp, "%d Minutes", SS.ScreenSave);
        MMPrintString(temp);
    } else
        MMPrintString("Disabled");

    MenuPrint(" S) SD Card        - ");
    if (SS.SDEnable)
        MMPrintString("Enabled");
    else
        MMPrintString("Disabled");
    MenuPrint(" U) Usb Port       - ");
    switch (SS.UsbEnable) {
        case 0:
            MMPrintString("Disabled");
            break;
        case 1:
            MMPrintString("Enabled");
            break;
    }
    MenuPrint(" L) Load Config    - ");
    MenuPrint(" C) Serial Console - ");
    switch (SS.SerialCon) {
        case 0:
            MMPrintString("Disabled");
            break;
        case 1:
            MMPrintString("Com1:");
            break;
        case 2:
            MMPrintString("Com2:");
            break;
        case 3:
            MMPrintString("Com3:");
            break;
        case 4:
            MMPrintString("Com4:");
            break;
    }
    MenuPrint(" B) Baud Rate      - ");
    sprintf(temp, "%d", SS.BaudRate);
    MMPrintString(temp);
    MenuPrint(" M) Custom Video Mode");
    MenuPrint(" P) Print Custom Video Mode");
    MenuPrint(NULL);
    MenuPrint(" Q) Quit Don't Save  X) Exit Save Settings");
}

unsigned int GetInt(void) {
    *temp = 0;
    MMgetline(0, temp);
    return atoi(temp);
}

void PrintInt(unsigned int data) {
    sprintf(temp, "%d \n\r", data);
    MMPrintString(temp);
}

void CustomVideoMode(void) {
    MMcls();
    MMPrintString("\033[2J\033[H");
    MMPrintString("Custom Video Settings\n\r");
    MMPrintString("---------------------\n\r");
    MMPrintString("C_VRES     - ");
    SS.CC_VRES = GetInt();
    MMPrintString("C_HRES     - ");
    SS.CC_HRES = GetInt();
    MMPrintString("C_LINE_N   - ");
    SS.CC_LINE_N = GetInt();
    MMPrintString("C_LINE_T   - ");
    SS.CC_LINE_T = GetInt();
    MMPrintString("C_VSYNC_N  - ");
    SS.CC_VSYNC_N = GetInt();
    MMPrintString("C_PIX_T    - ");
    SS.CC_PIX_T = GetInt();
    MMPrintString("C_HSYNC_T  - ");
    SS.CC_HSYNC_T = GetInt();
    MMPrintString("C_BLANKPAD - ");
    SS.CC_BLANKPAD = GetInt();
    SS.CC_VBLANK_N = (SS.CC_LINE_N - SS.CC_VRES - SS.CC_VSYNC_N);
    SS.CC_PREEQ_N = ((SS.CC_VBLANK_N / 2) - 8);
    SS.CC_POSTEQ_N = (SS.CC_VBLANK_N - SS.CC_PREEQ_N);
}

void PrintCustomMode(void) {
    MMcls();
    MMPrintString("\033[2J\033[H");
    MMPrintString("Custom Video Settings\n\r");
    MMPrintString("---------------------\n\r");
    MMPrintString("C_VRES     - ");
    PrintInt(SS.CC_VRES);
    MMPrintString("C_HRES     - ");
    PrintInt(SS.CC_HRES);
    MMPrintString("C_LINE_N   - ");
    PrintInt(SS.CC_LINE_N);
    MMPrintString("C_LINE_T   - ");
    PrintInt(SS.CC_LINE_T);
    MMPrintString("C_VSYNC_N  - ");
    PrintInt(SS.CC_VSYNC_N);
    MMPrintString("C_PIX_T    - ");
    PrintInt(SS.CC_PIX_T);
    MMPrintString("C_HSYNC_T  - ");
    PrintInt(SS.CC_HSYNC_T);
    MMPrintString("C_BLANKPAD - ");
    PrintInt(SS.CC_BLANKPAD);
    SS.CC_VBLANK_N = (SS.CC_LINE_N - SS.CC_VRES - SS.CC_VSYNC_N);
    MMPrintString("C_VBLANK_N - ");
    PrintInt(SS.CC_VBLANK_N);
    SS.CC_PREEQ_N = ((SS.CC_VBLANK_N / 2) - 8);
    MMPrintString("C_PREEQ_N  - ");
    PrintInt(SS.CC_PREEQ_N);
    SS.CC_POSTEQ_N = (SS.CC_VBLANK_N - SS.CC_PREEQ_N);
    MMPrintString("C_POSTEQ_N - ");
    PrintInt(SS.CC_POSTEQ_N);
    MMPrintString("Press A Key To Continue\n\r");
    MMgetchar();
}

void fun_setup(void) {
    if (!S.HardWare)
        SETUP |= 0x01;
    if (S.DateFormat)
        SETUP |= 0x02;
    if (S.SDEnable)
        SETUP |= 0x04;
    if (S.UsbEnable)
        SETUP |= 0x08;
    if (S.SerialCon)
        SETUP |= 0x10;
    fret = (float) SETUP;
}

void cmd_setup(void) {
    c = 0;
    i = 0;
    S.BaudRate = 9600;
    LoadSetup();
    SS = S;
    SS.WriteCount++;
    while (c != 'x' && c != 'q') {
        SetupMainMenu();
        c = MMgetchar();
        switch (c) {
            case 'v':
                if (++SS.VideoMode > 4) SS.VideoMode = 0;
                switch (SS.VideoMode) {
                    case 0: //video disabled
                        break;
                    case 1: //NTSC
                        SS.C_VRES = 180;
                        SS.C_HRES = 304;
                        SS.C_LINE_N = 262;
                        SS.C_LINE_T = 5080;
                        SS.C_VSYNC_N = 3;
                        SS.C_VBLANK_N = (SS.C_LINE_N - SS.C_VRES - SS.C_VSYNC_N);
                        SS.C_PREEQ_N = ((SS.C_VBLANK_N / 2) - 8);
                        SS.C_POSTEQ_N = (SS.C_VBLANK_N - SS.C_PREEQ_N);
                        SS.C_PIX_T = 11;
                        SS.C_HSYNC_T = 374;
                        SS.C_BLANKPAD = 8;
                        break;
                    case 2: //NTSC 480
                        SS.C_VRES = 234;
                        SS.C_HRES = 480;
                        SS.C_LINE_N = 262;
                        SS.C_LINE_T = 5080;
                        SS.C_VSYNC_N = 3;
                        SS.C_VBLANK_N = (SS.C_LINE_N - SS.C_VRES - SS.C_VSYNC_N);
                        SS.C_PREEQ_N = ((SS.C_VBLANK_N / 2) - 8);
                        SS.C_POSTEQ_N = (SS.C_VBLANK_N - SS.C_PREEQ_N);
                        SS.C_PIX_T = 9;
                        SS.C_HSYNC_T = 374;
                        SS.C_BLANKPAD = 4;
                        break;
                    case 3: //PAL Default
                        SS.C_VRES = 216;
                        SS.C_HRES = 304;
                        SS.C_LINE_N = 312;
                        SS.C_LINE_T = 5120;
                        SS.C_VSYNC_N = 3;
                        SS.C_VBLANK_N = (SS.C_LINE_N - SS.C_VRES - SS.C_VSYNC_N);
                        SS.C_PREEQ_N = ((SS.C_VBLANK_N / 2) - 8);
                        SS.C_POSTEQ_N = (SS.C_VBLANK_N - SS.C_PREEQ_N);
                        SS.C_PIX_T = 11;
                        SS.C_HSYNC_T = 374;
                        SS.C_BLANKPAD = 8;
                        break;
                    case 4:
                        SS.C_VRES = SS.CC_VRES;
                        SS.C_HRES = SS.CC_HRES;
                        SS.C_LINE_N = SS.CC_LINE_N;
                        SS.C_LINE_T = SS.CC_LINE_T;
                        SS.C_VSYNC_N = SS.CC_VSYNC_N;
                        SS.C_VBLANK_N = (SS.CC_LINE_N - SS.CC_VRES - SS.CC_VSYNC_N);
                        SS.C_PREEQ_N = ((SS.CC_VBLANK_N / 2) - 8);
                        SS.C_POSTEQ_N = (SS.CC_VBLANK_N - SS.CC_PREEQ_N);
                        SS.C_PIX_T = SS.CC_PIX_T;
                        SS.C_HSYNC_T = SS.CC_HSYNC_T;
                        SS.C_BLANKPAD = SS.CC_BLANKPAD;
                        break;
                }
                break;
            case 'r':
                if (++SS.RTCEnable > 2) SS.RTCEnable = 0;
                break;
            case 'd':
                SS.DateFormat ^= 1;
                break;
            case 'g':
                if (++SS.GameDuino > 2) SS.GameDuino = 0;
                break;
            case 's':
                SS.SDEnable ^= 1;
                break;
            case 't':
                SS.DTimeDate ^= 1;
                break;
            case 'c':
                if (++SS.SerialCon > 4) SS.SerialCon = 0;
                SS.BaudRate = BaudRateList[0];
                break;
            case 'u':
                SS.UsbEnable ^= 1;
                break;
            case 'b':
                i++;
                if (SS.SerialCon == 1 || SS.SerialCon == 2) // Com1 and Com2 max baud 19200
                {
                    if (i > 1) i = 0;
                } else {
                    if (i > 4) i = 0;
                }
                SS.BaudRate = BaudRateList[i];
                break;
            case 'x':
                if (SaveSetup()) {
                    MMPrintString("\n\rSettings Saved \n\r");
                    MMPrintString("\n\rReset Board");
                } else {
                    MMPrintString("\n\rSettings Not Saved \n\r");
                }
                break;
            case 'n':
                if ((SS.ScreenSave += 5) > 60) SS.ScreenSave = 0;
                break;
            case 'm':
                CustomVideoMode();
                break;
            case 'p':
                PrintCustomMode();
                break;
        }
    }
}

