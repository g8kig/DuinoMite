/***********************************************************************************************************************
MMBasic

custom.h

Include file that contains the globals and defines for custom.c in MMBasic.

Copyright 2011 Geoff Graham - http://geoffg.net
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation, either version 3 of the License, or (at your
option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.  You should have received a copy of the GNU General Public License along with this program.
If not, see <http://www.gnu.org/licenses/>.

************************************************************************************************************************/



/**********************************************************************************
 the C language function associated with commands, functions or operators should be
 declared here
**********************************************************************************/
#ifdef INCLUDE_FUNCTION_DEFINES
void cmd_xmodem(void);

extern unsigned long ymodem_receive(unsigned char *buf, unsigned long length);
extern unsigned long ymodem_send(unsigned char *buf, unsigned long size, char* filename);

#endif

/**********************************************************************************
 All command tokens tokens (eg, PRINT, FOR, etc) should be inserted in this table
**********************************************************************************/
#ifdef INCLUDE_COMMAND_TABLE
	{ "XMODEM",		T_CMD,				0, cmd_xmodem		},
#endif
