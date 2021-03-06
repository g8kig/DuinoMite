/*








 */

/**********************************************************************************
 the C language function associated with commands, functions or operators should be
 declared here
**********************************************************************************/
#ifdef INCLUDE_FUNCTION_DEFINES
void cmd_sleep(void);
void fun_mmsleep(void);
void fun_mmss(void);
void cmd_mmss(void);
void cmd_SDEnable(void);
void cmd_SDDisable(void);
#endif

/**********************************************************************************
 All command tokens tokens (eg, PRINT, FOR, etc) should be inserted in this table
**********************************************************************************/
#ifdef INCLUDE_COMMAND_TABLE
	{ "SLEEP",          T_CMD,				0, cmd_sleep	},
	{ "MM.BLANK",		T_CMD| T_FUN,		0, cmd_mmss     },
    { "SDENABLE",		T_CMD,				0, cmd_SDEnable	},
	{ "SDDISABLE",		T_CMD,				0, cmd_SDDisable},
#endif
            
/**********************************************************************************
 All other tokens (keywords, functions, operators) should be inserted in this table
**********************************************************************************/
#ifdef INCLUDE_TOKEN_TABLE
	{ "MM.SLEEP",	T_FNA | T_NBR,		0, fun_mmsleep	},
	{ "MM.BLANK",	T_FNA | T_NBR,		0, fun_mmss },
#endif

#ifdef INCLUDE_FUNCTION_DEFINES
// General definitions used by other modules
#ifndef RTC_HEADER
#define RTC_HEADER
#define SleepRtccInt      1
#define SleepExtInt       2
#define SleepButInt       4
#define SleepCNInt        8
#define Uart2Int          16
#define Uart5Int          32

extern volatile int SleepMMVal;

void StartRTCC(void);
void ReadRTCC(void);
void ReadRTC(void);
void WriteRTCC(void);
void PrintDateTime(void);

#endif
#endif
