/*




*/

/**********************************************************************************
 the C language function associated with commands, functions or operators should be
 declared here
**********************************************************************************/
#ifdef INCLUDE_FUNCTION_DEFINES
void cmd_setup(void);
void fun_setup(void);
#endif
/**********************************************************************************
 All command tokens tokens (eg, PRINT, FOR, etc) should be inserted in this table
**********************************************************************************/
#ifdef INCLUDE_COMMAND_TABLE
	{ "SETUP",		T_CMD,				0, cmd_setup,	},
#endif
/**********************************************************************************
 All other tokens (keywords, functions, operators) should be inserted in this table
**********************************************************************************/
#ifdef INCLUDE_TOKEN_TABLE
	{ "MM.SETUP",	T_FNA | T_NBR,		0, fun_setup	},
#endif

#ifndef SETUP_HEADER
#define SETUP_HEADER

#define SetupVersion "V1.5"
#define Date    __DATE__   //"12/4/2011"

extern volatile unsigned int ScreenSaveTime;
void LoadSetup(void);

struct  _SetupStruct{
    unsigned Magic      :32;
    unsigned WriteCount :16;
    unsigned HardWare   :8;
    unsigned VideoMode  :8;
    unsigned RTCEnable  :8;
    unsigned DateFormat :8;
    unsigned DTimeDate  :8;
    unsigned ScreenSave :8;
    unsigned GameDuino  :8;
    unsigned SDEnable   :8;
    unsigned UsbEnable  :8;
    unsigned SerialCon  :8;
    unsigned BaudRate   :32;

    unsigned PS2Enabled :8;
    unsigned KeyBLaout  :8;

    unsigned C_VRES     :16;
    unsigned C_HRES     :16;
    unsigned C_LINE_N   :16;
    unsigned C_LINE_T   :16;
    unsigned C_VSYNC_N  :16;
    unsigned C_VBLANK_N :16;
    unsigned C_PREEQ_N  :16;
    unsigned C_POSTEQ_N :16;
    unsigned C_PIX_T    :16;
    unsigned C_HSYNC_T  :16;
    unsigned C_BLANKPAD :16;

    unsigned CC_VRES     :16;
    unsigned CC_HRES     :16;
    unsigned CC_LINE_N   :16;
    unsigned CC_LINE_T   :16;
    unsigned CC_VSYNC_N  :16;
    unsigned CC_VBLANK_N :16;
    unsigned CC_PREEQ_N  :16;
    unsigned CC_POSTEQ_N :16;
    unsigned CC_PIX_T    :16;
    unsigned CC_HSYNC_T  :16;
    unsigned CC_BLANKPAD :16;

};

extern struct _SetupStruct S;

#endif
