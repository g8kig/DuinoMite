/*










 */
#ifdef INCLUDE_FUNCTION_DEFINES
void    cmd_fse(void);
void    cmd_testcalloc(void);
#endif

#ifdef INCLUDE_COMMAND_TABLE
	{ "FSE",		T_CMD,				0, cmd_fse,	},
    { "TESTCALLOC",	T_CMD,				0, cmd_testcalloc,	},
#endif

