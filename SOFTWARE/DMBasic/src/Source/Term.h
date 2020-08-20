/*
 Terminal Header
 
 */

#ifdef INCLUDE_FUNCTION_DEFINES
void    cmd_term(void);
#endif

#ifdef INCLUDE_COMMAND_TABLE
	{ "TERM",		T_CMD,				0, cmd_term,	},
#endif

