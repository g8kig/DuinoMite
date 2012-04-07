/*********************************************************************************************************************************
Maximite

File: DrawChar.c

Implement a graphic font and associated functions for writing to a video device

Copyright 2011 Geoff Graham - http://geoffg.net
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation, either version 3 of the License, or (at your
option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.  You should have received a copy of the GNU General Public License along with this program.
If not, see <http://www.gnu.org/licenses/>.

*********************************************************************************************************************************/

#include <p32xxxx.h>												// device specific defines
#include <plib.h>													// peripheral libraries

#include "../Maximite.h"
#include "../MMBasic/MMBasic.h"
#include "../Timers/Timers.h"
#include "Video.h"
#include "VT100.h"

// these keep track of where the next char will be written
// these are available to the rest of MMBasic in video.h
int MMPosX, MMPosY;													// position in pixels
int MMCharPos;														// position in characters
int ListCnt;														// line count used by the LIST and FILES commands
int ScrollTop = 1;
int ScrollBottom =36;
// cursor control variables
Cursor_e Cursor = C_OFF;

// the font table and the current height and width of the font
// these are available to the rest of MMBasic in video.h
struct s_font ftbl[10];
int fontWidth;
int fontHeight;

// used to save the font drawing commands from having to constantly look up the font table
char *fontPtr8;
uint16 *fontPtr16;													// pointer to a font using 16 bit words
unsigned int *fontPtr32;											// pointer to a font using 32 bit words
int fontStart;
int fontEnd;
int fontScale;
int fontReverse;
int fontBinary;

// Dimensions of this font is 5 bits wide and 10 bits high with one blank
// line above, below and to the right.  So overall its dimensions are
// 6 bits wide x 12 bits high.
const uint16 fontZero[96][6] ={
                { 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 },     // SPACE
		{ 0x0000, 0x0000, 0x00BE, 0x0000, 0x0000, 0x0000 },     // !
		{ 0x0000, 0x0006, 0x0000, 0x0006, 0x0000, 0x0000 },     // "
		{ 0x0028, 0x007C, 0x0028, 0x007C, 0x0028, 0x0000 },     // #
		{ 0x0048, 0x0054, 0x00FE, 0x0054, 0x0024, 0x0000 },     // $
		{ 0x0086, 0x0066, 0x0010, 0x00CC, 0x00C2, 0x0000 },     // %
		{ 0x006C, 0x0092, 0x00AA, 0x0044, 0x00A0, 0x0000 },     // &
		{ 0x0000, 0x000A, 0x0006, 0x0000, 0x0000, 0x0000 },     // '
		{ 0x0000, 0x0038, 0x0044, 0x0082, 0x0000, 0x0000 },     // (
		{ 0x0000, 0x0082, 0x0044, 0x0038, 0x0000, 0x0000 },     // )
		{ 0x0028, 0x0010, 0x007C, 0x0010, 0x0028, 0x0000 },     // *
		{ 0x0010, 0x0010, 0x007C, 0x0010, 0x0010, 0x0000 },     // +
		{ 0x0000, 0x00A0, 0x0060, 0x0000, 0x0000, 0x0000 },     // ,
		{ 0x0010, 0x0010, 0x0010, 0x0010, 0x0010, 0x0000 },     // -
		{ 0x0000, 0x00C0, 0x00C0, 0x0000, 0x0000, 0x0000 },     // .
		{ 0x0040, 0x0020, 0x0010, 0x0008, 0x0004, 0x0000 },     // /
		{ 0x007C, 0x00A2, 0x0092, 0x008A, 0x007C, 0x0000 },     // 0
		{ 0x0008, 0x0004, 0x00FE, 0x0000, 0x0000, 0x0000 },     // 1
		{ 0x0084, 0x00C2, 0x00A2, 0x0092, 0x008C, 0x0000 },     // 2
		{ 0x0044, 0x0082, 0x0092, 0x0092, 0x006C, 0x0000 },     // 3
		{ 0x0030, 0x0028, 0x0024, 0x00FE, 0x0020, 0x0000 },     // 4
		{ 0x004E, 0x008A, 0x008A, 0x008A, 0x0072, 0x0000 },     // 5
		{ 0x007C, 0x0092, 0x0092, 0x0092, 0x0064, 0x0000 },     // 6
		{ 0x0002, 0x0002, 0x00E2, 0x0012, 0x000E, 0x0000 },     // 7
		{ 0x006C, 0x0092, 0x0092, 0x0092, 0x006C, 0x0000 },     // 8
		{ 0x004C, 0x0092, 0x0092, 0x0092, 0x007C, 0x0000 },     // 9
		{ 0x0000, 0x006C, 0x006C, 0x0000, 0x0000, 0x0000 },     // :
		{ 0x0000, 0x00AC, 0x006C, 0x0000, 0x0000, 0x0000 },     // ;
		{ 0x0010, 0x0028, 0x0044, 0x0082, 0x0000, 0x0000 },     // <
		{ 0x0028, 0x0028, 0x0028, 0x0028, 0x0028, 0x0000 },     // =
		{ 0x0000, 0x0082, 0x0044, 0x0028, 0x0010, 0x0000 },     // >
		{ 0x0004, 0x0002, 0x00A2, 0x0012, 0x000C, 0x0000 },     // ?
		{ 0x007C, 0x0082, 0x00B2, 0x00AA, 0x00BC, 0x0000 },     // @
		{ 0x00FC, 0x0012, 0x0012, 0x0012, 0x00FC, 0x0000 },     // A
		{ 0x00FE, 0x0092, 0x0092, 0x0092, 0x006C, 0x0000 },     // B
		{ 0x007C, 0x0082, 0x0082, 0x0082, 0x0044, 0x0000 },     // C
		{ 0x00FE, 0x0082, 0x0082, 0x0082, 0x007C, 0x0000 },     // D
		{ 0x00FE, 0x0092, 0x0092, 0x0092, 0x0082, 0x0000 },     // E
		{ 0x00FE, 0x0012, 0x0012, 0x0012, 0x0002, 0x0000 },     // F
		{ 0x007C, 0x0082, 0x0082, 0x0092, 0x0074, 0x0000 },     // G
		{ 0x00FE, 0x0010, 0x0010, 0x0010, 0x00FE, 0x0000 },     // H
		{ 0x0000, 0x0082, 0x00FE, 0x0082, 0x0000, 0x0000 },     // I
		{ 0x0060, 0x0080, 0x0080, 0x0080, 0x007E, 0x0000 },     // J
		{ 0x00FE, 0x0010, 0x0028, 0x0044, 0x0082, 0x0000 },     // K
		{ 0x00FE, 0x0080, 0x0080, 0x0080, 0x0080, 0x0000 },     // L
		{ 0x00FE, 0x0004, 0x0018, 0x0004, 0x00FE, 0x0000 },     // M
		{ 0x00FE, 0x0004, 0x0008, 0x0010, 0x00FE, 0x0000 },     // N
		{ 0x007C, 0x0082, 0x0082, 0x0082, 0x007C, 0x0000 },     // O
		{ 0x00FE, 0x0012, 0x0012, 0x0012, 0x000C, 0x0000 },     // P
		{ 0x003C, 0x0042, 0x0042, 0x0042, 0x00BC, 0x0000 },     // Q
		{ 0x00FE, 0x0012, 0x0012, 0x0012, 0x00EC, 0x0000 },     // R
		{ 0x004C, 0x0092, 0x0092, 0x0092, 0x0064, 0x0000 },     // S
		{ 0x0002, 0x0002, 0x00FE, 0x0002, 0x0002, 0x0000 },     // T
		{ 0x007E, 0x0080, 0x0080, 0x0080, 0x007E, 0x0000 },     // U
		{ 0x003E, 0x0040, 0x0080, 0x0040, 0x003E, 0x0000 },     // V
		{ 0x00FE, 0x0040, 0x0020, 0x0040, 0x00FE, 0x0000 },     // W
		{ 0x0082, 0x0044, 0x0038, 0x0044, 0x0082, 0x0000 },     // X
		{ 0x000E, 0x0010, 0x00E0, 0x0010, 0x000E, 0x0000 },     // Y
		{ 0x00C2, 0x00A2, 0x0092, 0x008A, 0x0086, 0x0000 },     // Z
		{ 0x0000, 0x00FE, 0x0082, 0x0000, 0x0000, 0x0000 },     // [
		{ 0x0004, 0x0008, 0x0010, 0x0020, 0x0040, 0x0000 },     // backslash
		{ 0x0000, 0x0000, 0x0082, 0x00FE, 0x0000, 0x0000 },     // ]
		{ 0x0008, 0x0004, 0x0002, 0x0004, 0x0008, 0x0000 },     // ^
		{ 0x0080, 0x0080, 0x0080, 0x0080, 0x0080, 0x0000 },     // _
		{ 0x0000, 0x0002, 0x0004, 0x0008, 0x0000, 0x0000 },     // `
		{ 0x0040, 0x00A8, 0x00A8, 0x00A8, 0x00F0, 0x0000 },     // a
		{ 0x00FE, 0x0088, 0x0088, 0x0088, 0x0070, 0x0000 },     // b
		{ 0x0070, 0x0088, 0x0088, 0x0088, 0x0088, 0x0000 },     // c
		{ 0x0070, 0x0088, 0x0088, 0x0088, 0x00FE, 0x0000 },     // d
		{ 0x0070, 0x00A8, 0x00A8, 0x00A8, 0x0030, 0x0000 },     // e
		{ 0x0008, 0x0008, 0x00FC, 0x000A, 0x000A, 0x0000 },     // f
		{ 0x0070, 0x0488, 0x0488, 0x0488, 0x03F0, 0x0000 },     // g
		{ 0x00FE, 0x0010, 0x0008, 0x0008, 0x00F0, 0x0000 },     // h
		{ 0x0000, 0x0088, 0x00FA, 0x0080, 0x0000, 0x0000 },     // i
		{ 0x0200, 0x0400, 0x0408, 0x03FA, 0x0000, 0x0000 },     // j
		{ 0x00FE, 0x0020, 0x0050, 0x0088, 0x0000, 0x0000 },     // k
		{ 0x0000, 0x0082, 0x00FE, 0x0080, 0x0000, 0x0000 },     // l
		{ 0x00F8, 0x0008, 0x00F0, 0x0008, 0x00F0, 0x0000 },     // m
		{ 0x00F8, 0x0010, 0x0008, 0x0008, 0x00F0, 0x0000 },     // n
		{ 0x0070, 0x0088, 0x0088, 0x0088, 0x0070, 0x0000 },     // o
		{ 0x07F0, 0x0088, 0x0088, 0x0088, 0x0070, 0x0000 },     // p
		{ 0x0070, 0x0088, 0x0088, 0x0088, 0x07F0, 0x0000 },     // q
		{ 0x0000, 0x00F8, 0x0010, 0x0008, 0x0008, 0x0000 },     // r
		{ 0x0090, 0x00A8, 0x00A8, 0x00A8, 0x0040, 0x0000 },     // s
		{ 0x0008, 0x0008, 0x007E, 0x0088, 0x0088, 0x0000 },     // t
		{ 0x0078, 0x0080, 0x0080, 0x0040, 0x00F8, 0x0000 },     // u
		{ 0x0038, 0x0040, 0x0080, 0x0040, 0x0038, 0x0000 },     // v
		{ 0x0078, 0x0080, 0x0060, 0x0080, 0x0078, 0x0000 },     // w
		{ 0x0088, 0x0050, 0x0020, 0x0050, 0x0088, 0x0000 },     // x
		{ 0x0078, 0x0480, 0x0480, 0x0480, 0x03F8, 0x0000 },     // y
		{ 0x0088, 0x00C8, 0x00A8, 0x0098, 0x0088, 0x0000 },     // z
		{ 0x0000, 0x0010, 0x006C, 0x0082, 0x0082, 0x0000 },     // {
		{ 0x0000, 0x0000, 0x00FE, 0x0000, 0x0000, 0x0000 },     // |
		{ 0x0082, 0x0082, 0x006C, 0x0010, 0x0000, 0x0000 },     // }
		{ 0x0004, 0x0002, 0x0004, 0x0008, 0x0004, 0x0000 },     // ~
		{ 0x00FE, 0x00FE, 0x00FE, 0x00FE, 0x00FE, 0x0000 }      // cursor
};


// Dimensions of this font is 8 bits wide and 16 bits high with two blank
// lines top, bottom and the left and three blank on the right side.
// So overall its dimensions are 13 bits wide x 20 bits high.
const unsigned int fontOne[95][13]={
		{ 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        //
		{ 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x000001F0, 0x0000CFFC, 0x0000CFFC, 0x000001F0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // !
		{ 0x00000000, 0x00000000, 0x00000000, 0x000000F0, 0x000000F0, 0x00000000, 0x00000000, 0x000000F0, 0x000000F0, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // "
		{ 0x00000000, 0x00000800, 0x00007840, 0x00007E40, 0x00000FC0, 0x000009F8, 0x00007878, 0x00007E40, 0x00000FC0, 0x000009F8, 0x00000078, 0x00000040, 0x00000000 },        // #
		{ 0x00000000, 0x00000000, 0x000011E0, 0x000033F0, 0x00003330, 0x0000FFFC, 0x0000FFFC, 0x00003330, 0x00003F30, 0x00001E20, 0x00000000, 0x00000000, 0x00000000 },        // $
		{ 0x00000000, 0x0000C000, 0x0000E0E0, 0x000070E0, 0x000038E0, 0x00001C00, 0x00000E00, 0x00000700, 0x0000E380, 0x0000E1C0, 0x0000E0E0, 0x00000070, 0x00000000 },        // %
		{ 0x00000000, 0x00000000, 0x00007C00, 0x0000FEE0, 0x0000C7F0, 0x00008718, 0x0000DF88, 0x000078F8, 0x00007070, 0x0000D800, 0x00008800, 0x00000000, 0x00000000 },        // &
		{ 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000009C, 0x000000FC, 0x0000007C, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // '
		{ 0x00000000, 0x00000000, 0x00000000, 0x00000FC0, 0x00003FF0, 0x00007FF8, 0x0000E01C, 0x00008004, 0x00008004, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // (
		{ 0x00000000, 0x00000000, 0x00000000, 0x00008004, 0x00008004, 0x0000E01C, 0x00007FF8, 0x00003FF0, 0x00000FC0, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // )
		{ 0x00000000, 0x00000000, 0x00003260, 0x00003AE0, 0x00000F80, 0x00003FE0, 0x00003FE0, 0x00000F80, 0x00003AE0, 0x00003260, 0x00000000, 0x00000000, 0x00000000 },        // *
		{ 0x00000000, 0x00000000, 0x00000600, 0x00000600, 0x00000600, 0x00003FC0, 0x00003FC0, 0x00000600, 0x00000600, 0x00000600, 0x00000000, 0x00000000, 0x00000000 },        // +
		{ 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0002E000, 0x0003E000, 0x0001E000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // ,
		{ 0x00000000, 0x00000000, 0x00000600, 0x00000600, 0x00000600, 0x00000600, 0x00000600, 0x00000600, 0x00000600, 0x00000600, 0x00000000, 0x00000000, 0x00000000 },        // -
		{ 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000E000, 0x0000E000, 0x0000E000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // .
		{ 0x00000000, 0x00006000, 0x00007000, 0x00003800, 0x00001C00, 0x00000E00, 0x00000700, 0x00000380, 0x000001C0, 0x000000E0, 0x00000070, 0x00000038, 0x00000000 },        // /
		{ 0x00000000, 0x00001FE0, 0x00007FF8, 0x00007818, 0x0000CC0C, 0x0000C60C, 0x0000C30C, 0x0000C18C, 0x0000C0CC, 0x00006078, 0x00007FF8, 0x00001FE0, 0x00000000 },        // 0 - with a slash
		{ 0x00000000, 0x00000000, 0x00000000, 0x0000C030, 0x0000C030, 0x0000C038, 0x0000FFFC, 0x0000FFFC, 0x0000C000, 0x0000C000, 0x0000C000, 0x00000000, 0x00000000 },        // 1
		{ 0x00000000, 0x0000C070, 0x0000E078, 0x0000F01C, 0x0000F80C, 0x0000DC0C, 0x0000CE0C, 0x0000C70C, 0x0000C38C, 0x0000C1DC, 0x0000C0F8, 0x0000C070, 0x00000000 },        // 2
		{ 0x00000000, 0x00003030, 0x00007038, 0x0000E01C, 0x0000C30C, 0x0000C30C, 0x0000C30C, 0x0000C30C, 0x0000C30C, 0x0000E79C, 0x00007DF8, 0x000038F0, 0x00000000 },        // 3
		{ 0x00000000, 0x00000F00, 0x00000F80, 0x00000DC0, 0x00000CE0, 0x00000C70, 0x00000C38, 0x00000C1C, 0x0000FFFC, 0x0000FFFC, 0x00000C00, 0x00000C00, 0x00000000 },        // 4
		{ 0x00000000, 0x000030FC, 0x000071FC, 0x0000E18C, 0x0000C18C, 0x0000C18C, 0x0000C18C, 0x0000C18C, 0x0000C18C, 0x0000E38C, 0x00007F0C, 0x00003E0C, 0x00000000 },        // 5
		{ 0x00000000, 0x00003F00, 0x00007FC0, 0x0000E7E0, 0x0000C370, 0x0000C338, 0x0000C31C, 0x0000C30C, 0x0000C30C, 0x0000E70C, 0x00007E00, 0x00003C00, 0x00000000 },        // 6
		{ 0x00000000, 0x0000000C, 0x0000000C, 0x0000000C, 0x0000C00C, 0x0000F00C, 0x00003C0C, 0x00000F0C, 0x000003CC, 0x000000FC, 0x0000003C, 0x0000000C, 0x00000000 },        // 7
		{ 0x00000000, 0x00003C00, 0x00007EF0, 0x0000E7F8, 0x0000C39C, 0x0000C30C, 0x0000C30C, 0x0000C30C, 0x0000C39C, 0x0000E7F8, 0x00007EF0, 0x00003C00, 0x00000000 },        // 8
		{ 0x00000000, 0x000000F0, 0x000001F8, 0x0000C39C, 0x0000C30C, 0x0000C30C, 0x0000E30C, 0x0000730C, 0x00003B0C, 0x00001F9C, 0x00000FF8, 0x000003F0, 0x00000000 },        // 9
		{ 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x000071C0, 0x000071C0, 0x000071C0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // :
		{ 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x000271C0, 0x0003F1C0, 0x0001F1C0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // ;
		{ 0x00000000, 0x00000000, 0x00000300, 0x00000780, 0x00000FC0, 0x00001CE0, 0x00003870, 0x00007038, 0x0000E01C, 0x0000C00C, 0x00000000, 0x00000000, 0x00000000 },        // <
		{ 0x00000000, 0x00000000, 0x00001980, 0x00001980, 0x00001980, 0x00001980, 0x00001980, 0x00001980, 0x00001980, 0x00001980, 0x00001980, 0x00000000, 0x00000000 },        // =
		{ 0x00000000, 0x00000000, 0x0000C00C, 0x0000E01C, 0x00007038, 0x00003870, 0x00001CE0, 0x00000FC0, 0x00000780, 0x00000300, 0x00000000, 0x00000000, 0x00000000 },        // >
		{ 0x00000000, 0x00000070, 0x00000078, 0x0000001C, 0x0000000C, 0x0000DE0C, 0x0000DF0C, 0x0000038C, 0x000001DC, 0x000000F8, 0x00000070, 0x00000000, 0x00000000 },        // ?
		{ 0x00000000, 0x00003FE0, 0x00007FF8, 0x0000601C, 0x0000CFCC, 0x0000DFEC, 0x0000D86C, 0x0000DFEC, 0x0000DFEC, 0x0000D81C, 0x00000FF8, 0x000007E0, 0x00000000 },        // @
		{ 0x00000000, 0x0000E000, 0x0000FC00, 0x00001F80, 0x00001BF0, 0x0000187C, 0x0000187C, 0x00001BF0, 0x00001F80, 0x0000FC00, 0x0000E000, 0x00000000, 0x00000000 },        // A
		{ 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x0000C30C, 0x0000C30C, 0x0000C30C, 0x0000C30C, 0x0000C39C, 0x0000E7F8, 0x00007EF0, 0x00003C00, 0x00000000, 0x00000000 },        // B
		{ 0x00000000, 0x00000FC0, 0x00003FF0, 0x00007038, 0x0000E01C, 0x0000C00C, 0x0000C00C, 0x0000C00C, 0x0000E01C, 0x00007038, 0x00003030, 0x00000000, 0x00000000 },        // C
		{ 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x0000C00C, 0x0000C00C, 0x0000C00C, 0x0000C00C, 0x0000E01C, 0x00007038, 0x00003FF0, 0x00000FC0, 0x00000000, 0x00000000 },        // D
		{ 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x0000C30C, 0x0000C30C, 0x0000C30C, 0x0000C30C, 0x0000C30C, 0x0000C30C, 0x0000C00C, 0x0000C00C, 0x00000000, 0x00000000 },        // E
		{ 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x0000030C, 0x0000030C, 0x0000030C, 0x0000030C, 0x0000030C, 0x0000030C, 0x0000000C, 0x0000000C, 0x00000000, 0x00000000 },        // F
		{ 0x00000000, 0x00000FC0, 0x00003FF0, 0x00007038, 0x0000E01C, 0x0000C00C, 0x0000C30C, 0x0000C30C, 0x0000C30C, 0x0000FF1C, 0x0000FF18, 0x00000000, 0x00000000 },        // G
		{ 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x00000300, 0x00000300, 0x00000300, 0x00000300, 0x00000300, 0x00000300, 0x0000FFFC, 0x0000FFFC, 0x00000000, 0x00000000 },        // H
		{ 0x00000000, 0x00000000, 0x00000000, 0x0000C00C, 0x0000C00C, 0x0000FFFC, 0x0000FFFC, 0x0000C00C, 0x0000C00C, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // I
		{ 0x00000000, 0x00003800, 0x00007800, 0x0000E000, 0x0000C000, 0x0000C000, 0x0000C000, 0x0000C000, 0x0000E000, 0x00007FFC, 0x00001FFC, 0x00000000, 0x00000000 },        // J
		{ 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x00000300, 0x00000780, 0x00000FC0, 0x00001CE0, 0x00003870, 0x00007038, 0x0000E01C, 0x0000C00C, 0x00000000, 0x00000000 },        // K
		{ 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x0000C000, 0x0000C000, 0x0000C000, 0x0000C000, 0x0000C000, 0x0000C000, 0x0000C000, 0x0000C000, 0x00000000, 0x00000000 },        // L
		{ 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x00000078, 0x000001E0, 0x00000780, 0x00000780, 0x000001E0, 0x00000078, 0x0000FFFC, 0x0000FFFC, 0x00000000, 0x00000000 },        // M
		{ 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x00000038, 0x000000E0, 0x000003C0, 0x00000F00, 0x00001C00, 0x00007000, 0x0000FFFC, 0x0000FFFC, 0x00000000, 0x00000000 },        // N
		{ 0x00000000, 0x00000FC0, 0x00003FF0, 0x00007038, 0x0000E01C, 0x0000C00C, 0x0000C00C, 0x0000E01C, 0x00007038, 0x00003FF0, 0x00000FC0, 0x00000000, 0x00000000 },        // O
		{ 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x0000060C, 0x0000060C, 0x0000060C, 0x0000060C, 0x0000060C, 0x0000071C, 0x000003F8, 0x000001F0, 0x00000000, 0x00000000 },        // P
		{ 0x00000000, 0x00000FC0, 0x00003FF0, 0x00007038, 0x0000E01C, 0x0000C00C, 0x0000D80C, 0x0000F81C, 0x00007038, 0x0000FFF0, 0x0000CFC0, 0x00000000, 0x00000000 },        // Q
		{ 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x0000060C, 0x0000060C, 0x00000E0C, 0x00001E0C, 0x00003E0C, 0x0000771C, 0x0000E3F8, 0x0000C1F0, 0x00000000, 0x00000000 },        // R
		{ 0x00000000, 0x000030F0, 0x000071F8, 0x0000E39C, 0x0000C30C, 0x0000C30C, 0x0000C30C, 0x0000C30C, 0x0000E71C, 0x00007E38, 0x00003C30, 0x00000000, 0x00000000 },        // S
		{ 0x00000000, 0x00000000, 0x0000000C, 0x0000000C, 0x0000000C, 0x0000FFFC, 0x0000FFFC, 0x0000000C, 0x0000000C, 0x0000000C, 0x00000000, 0x00000000, 0x00000000 },        // T
		{ 0x00000000, 0x00001FFC, 0x00007FFC, 0x0000E000, 0x0000C000, 0x0000C000, 0x0000C000, 0x0000C000, 0x0000E000, 0x00007FFC, 0x00001FFC, 0x00000000, 0x00000000 },        // U
		{ 0x00000000, 0x0000001C, 0x000000FC, 0x000007E0, 0x00003F00, 0x0000F800, 0x0000F800, 0x00003F00, 0x000007E0, 0x000000FC, 0x0000001C, 0x00000000, 0x00000000 },        // V
		{ 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x00007000, 0x00001800, 0x00000E00, 0x00000E00, 0x00001800, 0x00007000, 0x0000FFFC, 0x0000FFFC, 0x00000000, 0x00000000 },        // W
		{ 0x00000000, 0x0000C00C, 0x0000F03C, 0x00003870, 0x00000CC0, 0x00000780, 0x00000780, 0x00000CC0, 0x00003870, 0x0000F03C, 0x0000C00C, 0x00000000, 0x00000000 },        // X
		{ 0x00000000, 0x0000000C, 0x0000003C, 0x000000F0, 0x000003C0, 0x0000FF00, 0x0000FF00, 0x000003C0, 0x000000F0, 0x0000003C, 0x0000000C, 0x00000000, 0x00000000 },        // Y
		{ 0x00000000, 0x0000C00C, 0x0000F00C, 0x0000F80C, 0x0000CC0C, 0x0000C70C, 0x0000C38C, 0x0000C0CC, 0x0000C07C, 0x0000C03C, 0x0000C00C, 0x00000000, 0x00000000 },        // Z
		{ 0x00000000, 0x00000000, 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x0000C00C, 0x0000C00C, 0x0000C00C, 0x0000C00C, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // [
		{ 0x00000000, 0x00000038, 0x00000070, 0x000000E0, 0x000001C0, 0x00000380, 0x00000700, 0x00000E00, 0x00001C00, 0x00003800, 0x00007000, 0x00006000, 0x00000000 },        // backslash
		{ 0x00000000, 0x00000000, 0x00000000, 0x0000C00C, 0x0000C00C, 0x0000C00C, 0x0000C00C, 0x0000FFFC, 0x0000FFFC, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // ]
		{ 0x00000000, 0x00000180, 0x000001C0, 0x000000E0, 0x00000070, 0x00000038, 0x0000001C, 0x00000038, 0x00000070, 0x000000E0, 0x000001C0, 0x00000180, 0x00000000 },        // ^
		{ 0x00000000, 0x00030000, 0x00030000, 0x00030000, 0x00030000, 0x00030000, 0x00030000, 0x00030000, 0x00030000, 0x00030000, 0x00030000, 0x00030000, 0x00000000 },        // _
		{ 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x000000F8, 0x000001F8, 0x00000138, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // `
		{ 0x00000000, 0x00007000, 0x0000F900, 0x0000CD80, 0x0000CD80, 0x0000CD80, 0x0000CD80, 0x0000CD80, 0x0000CD80, 0x0000FF80, 0x0000FF00, 0x00000000, 0x00000000 },        // a
		{ 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x0000C300, 0x0000C180, 0x0000C180, 0x0000C180, 0x0000C180, 0x0000E380, 0x00007F00, 0x00003E00, 0x00000000, 0x00000000 },        // b
		{ 0x00000000, 0x00003E00, 0x00007F00, 0x0000E380, 0x0000C180, 0x0000C180, 0x0000C180, 0x0000C180, 0x0000C180, 0x00006300, 0x00002200, 0x00000000, 0x00000000 },        // c
		{ 0x00000000, 0x00003E00, 0x00007F00, 0x0000E380, 0x0000C180, 0x0000C180, 0x0000C180, 0x0000C380, 0x0000C300, 0x0000FFFC, 0x0000FFFC, 0x00000000, 0x00000000 },        // d
		{ 0x00000000, 0x00003E00, 0x00007F00, 0x0000EF80, 0x0000CD80, 0x0000CD80, 0x0000CD80, 0x0000CD80, 0x0000CD80, 0x00004F00, 0x00000600, 0x00000000, 0x00000000 },        // e
		{ 0x00000000, 0x00000300, 0x00000300, 0x0000FFF0, 0x0000FFF8, 0x0000031C, 0x0000030C, 0x0000030C, 0x0000000C, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // f
		{ 0x00000000, 0x00000E00, 0x00031F00, 0x00033B80, 0x00033180, 0x00033180, 0x00033180, 0x00033180, 0x00039980, 0x0001FF80, 0x0000FF80, 0x00000000, 0x00000000 },        // g
		{ 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x00000300, 0x00000180, 0x00000180, 0x00000180, 0x00000380, 0x0000FF00, 0x0000FE00, 0x00000000, 0x00000000, 0x00000000 },        // h
		{ 0x00000000, 0x00000000, 0x00000000, 0x0000C000, 0x0000C180, 0x0000FFB0, 0x0000FFB0, 0x0000C000, 0x0000C000, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // i
		{ 0x00000000, 0x00000000, 0x00000000, 0x00018000, 0x00038000, 0x00030000, 0x00030180, 0x0003FFB0, 0x0001FFB0, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // j
		{ 0x00000000, 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x00000C00, 0x00001E00, 0x00003F00, 0x00007380, 0x0000E180, 0x0000C000, 0x00000000, 0x00000000, 0x00000000 },        // k
		{ 0x00000000, 0x00000000, 0x00000000, 0x0000C000, 0x0000C00C, 0x0000FFFC, 0x0000FFFC, 0x0000C000, 0x0000C000, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // l
		{ 0x00000000, 0x0000FF80, 0x0000FF00, 0x00000380, 0x00000380, 0x0000FF00, 0x0000FF00, 0x00000380, 0x00000380, 0x0000FF00, 0x0000FE00, 0x00000000, 0x00000000 },        // m
		{ 0x00000000, 0x00000000, 0x0000FF80, 0x0000FF80, 0x00000180, 0x00000180, 0x00000180, 0x00000180, 0x00000380, 0x0000FF00, 0x0000FE00, 0x00000000, 0x00000000 },        // n
		{ 0x00000000, 0x00003E00, 0x00007F00, 0x0000E380, 0x0000C180, 0x0000C180, 0x0000C180, 0x0000C180, 0x0000E380, 0x00007F00, 0x00003E00, 0x00000000, 0x00000000 },        // o
		{ 0x00000000, 0x0003FF80, 0x0003FF80, 0x00003180, 0x00006180, 0x00006180, 0x00006180, 0x00006180, 0x00007380, 0x00003F00, 0x00001E00, 0x00000000, 0x00000000 },        // p
		{ 0x00000000, 0x00001E00, 0x00003F00, 0x00007380, 0x00006180, 0x00006180, 0x00006180, 0x00006180, 0x00003180, 0x0003FF80, 0x0003FF80, 0x00000000, 0x00000000 },        // q
		{ 0x00000000, 0x00000000, 0x0000FF80, 0x0000FF80, 0x00000300, 0x00000180, 0x00000180, 0x00000180, 0x00000180, 0x00000380, 0x00000300, 0x00000000, 0x00000000 },        // r
		{ 0x00000000, 0x00004700, 0x0000CF80, 0x0000CD80, 0x0000CD80, 0x0000CD80, 0x0000CD80, 0x0000FD80, 0x00007900, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // s
		{ 0x00000000, 0x00000180, 0x00000180, 0x00007FF8, 0x0000FFF8, 0x0000C180, 0x0000C180, 0x0000C180, 0x0000C000, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // t
		{ 0x00000000, 0x00003F80, 0x00007F80, 0x0000E000, 0x0000C000, 0x0000C000, 0x0000C000, 0x0000C000, 0x00006000, 0x0000FF80, 0x0000FF80, 0x00000000, 0x00000000 },        // u
		{ 0x00000000, 0x00000180, 0x00000780, 0x00001E00, 0x00007800, 0x0000E000, 0x0000E000, 0x00007800, 0x00001E00, 0x00000780, 0x00000180, 0x00000000, 0x00000000 },        // v
		{ 0x00000000, 0x00001F80, 0x00007F80, 0x0000E000, 0x00007000, 0x00003F80, 0x00003F80, 0x00007000, 0x0000E000, 0x00007F80, 0x00001F80, 0x00000000, 0x00000000 },        // w
		{ 0x00000000, 0x0000C180, 0x0000E380, 0x00007700, 0x00003E00, 0x00001C00, 0x00003E00, 0x00007700, 0x0000E380, 0x0000C180, 0x00000000, 0x00000000, 0x00000000 },        // x
		{ 0x00000000, 0x00000000, 0x00000180, 0x00020780, 0x00039E00, 0x0001F800, 0x00007800, 0x00001E00, 0x00000780, 0x00000180, 0x00000000, 0x00000000, 0x00000000 },        // y
		{ 0x00000000, 0x0000C180, 0x0000E180, 0x0000F180, 0x0000D980, 0x0000CD80, 0x0000C780, 0x0000C380, 0x0000C180, 0x0000C080, 0x00000000, 0x00000000, 0x00000000 },        // z
		{ 0x00000000, 0x00000000, 0x00000200, 0x00000700, 0x00007FF0, 0x0000FDF8, 0x0001C01C, 0x0001800C, 0x0001800C, 0x0001800C, 0x00000000, 0x00000000, 0x00000000 },        // {
		{ 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000FFFC, 0x0000FFFC, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000 },        // |
		{ 0x00000000, 0x00000000, 0x0001800C, 0x0001800C, 0x0001800C, 0x0001C01C, 0x0000FDF8, 0x00007FF0, 0x00000700, 0x00000200, 0x00000000, 0x00000000, 0x00000000 },        // }
		{ 0x00000000, 0x00000040, 0x00000060, 0x00000030, 0x00000010, 0x00000030, 0x00000060, 0x00000040, 0x00000060, 0x00000030, 0x00000010, 0x00000000, 0x00000000 }        // ~
};


// Dimensions of this font is 22 bits wide and 28 bits high with two blank
// lines top, bottom and one blank on either side side.
// So overall its dimensions are 24 bits wide x 32 bits high.
const unsigned int fontTwo[15][24]={
		{ 0x00000000, 0x00018000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x03ffffc0, 0x07ffffe0, 0x07ffffe0, 0x03ffffc0, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x00018000, 0x00000000  },	// +
		{ 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x47800000, 0x67c00000, 0x77c00000, 0x7fc00000, 0x3fc00000, 0x1f800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000  },	// ,
		{ 0x00000000, 0x00000000, 0x00018000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x0003c000, 0x00018000, 0x00000000, 0x00000000  },	// -
		{ 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x06000000, 0x1f800000, 0x3fc00000, 0x3fc00000, 0x3fc00000, 0x3fc00000, 0x1f800000, 0x06000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000  },	// .
		{ 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000  },	// space
		{ 0x00000000, 0x007FFE00, 0x01FFFF80, 0x07FFFFE0, 0x0FFFFFF0, 0x0FC003F0, 0x1F0000F8, 0x1E000078, 0x3C00007C, 0x3C00003C, 0x3C00003C, 0x3C00003C, 0x3C00003C, 0x3C00003C, 0x3C00003C, 0x3C00007C, 0x1E000078, 0x1F0000F8, 0x0FC003F0, 0x0FFFFFF0, 0x07FFFFE0, 0x01FFFF80, 0x007FFE00, 0x00000000  },    // 0
		{ 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x3C0003C0, 0x3C0003C0, 0x3C0003C0, 0x3C0003E0, 0x3C0003F0, 0x3C0003F8, 0x3FFFFFFC, 0x3FFFFFFC, 0x3FFFFFFC, 0x3FFFFFFC, 0x3C000000, 0x3C000000, 0x3C000000, 0x3C000000, 0x3C000000, 0x3C000000, 0x00000000, 0x00000000, 0x00000000  },    // 1
		{ 0x00000000, 0x3C000FC0, 0x3C000FE0, 0x3E000FF0, 0x3F0003F8, 0x3F8000FC, 0x3FC0007C, 0x3FE0003C, 0x3FF0003C, 0x3DF8003C, 0x3CFC003C, 0x3C7E003C, 0x3C3F003C, 0x3C1F803C, 0x3C0FC03C, 0x3C07E03C, 0x3C03F03C, 0x3C01F87C, 0x3C00FCFC, 0x3C007FF8, 0x3C003FF0, 0x3C001FE0, 0x3C000F80, 0x00000000  },    // 2
		{ 0x00000000, 0x03C003C0, 0x07C003E0, 0x0FC003F0, 0x1F8001F8, 0x1F0000F8, 0x3E00007C, 0x3C03C03C, 0x3C03C03C, 0x3C03C03C, 0x3C03C03C, 0x3C03C03C, 0x3C03C03C, 0x3C03C03C, 0x3C03C03C, 0x3C03C03C, 0x3E07E03C, 0x1F0FF07C, 0x1F9FF8F8, 0x0FFEFFF8, 0x07FC7FF0, 0x03F83FE0, 0x01F01FC0, 0x00000000  },    // 3
		{ 0x00000000, 0x003FC000, 0x003FE000, 0x003FF000, 0x003FF800, 0x003CFC00, 0x003C7E00, 0x003C3F00, 0x003C1F80, 0x003C0FC0, 0x003C07E0, 0x003C03F0, 0x003C01F8, 0x003C00FC, 0x003C00FC, 0x3FFFFFFC, 0x3FFFFFFC, 0x3FFFFFFC, 0x3FFFFFFC, 0x003C0000, 0x003C0000, 0x003C0000, 0x003C0000, 0x00000000  },    // 4
		{ 0x00000000, 0x03c07ff8, 0x07c0fffc, 0x0fc0fffc, 0x1f80fffc, 0x1f00f03c, 0x3e00f03c, 0x3c00f03c, 0x3c00f03c, 0x3c00f03c, 0x3c00f03c, 0x3c00f03c, 0x3c00f03c, 0x3c00f03c, 0x3c00f03c, 0x3c00f03c, 0x3c00f03c, 0x3e01f03c, 0x1f03f03c, 0x1fffe03c, 0x0fffc03c, 0x07ff803c, 0x01fe0018, 0x00000000  },    // 5
		{ 0x00000000, 0x03ffe000, 0x07fff800, 0x0ffffc00, 0x1ffffe00, 0x3f07ff00, 0x3e03ff80, 0x3c03cfc0, 0x3c03c7e0, 0x3c03c3f0, 0x3c03c1f8, 0x3c03c0f8, 0x3c03c07c, 0x3c03c03c, 0x3c03c03c, 0x3c03c03c, 0x3c03c03c, 0x3e07c03c, 0x3f0fc03c, 0x1fff8018, 0x0fff0000, 0x07fe0000, 0x01f80000, 0x00000000  },    // 6
		{ 0x00000000, 0x00000018, 0x0000003c, 0x0000003c, 0x0000003c, 0x0000003c, 0x0000003c, 0x3c00003c, 0x3f00003c, 0x3fc0003c, 0x1ff0003c, 0x07fc003c, 0x01ff003c, 0x007fc03c, 0x001ff03c, 0x0007fc3c, 0x0001ff3c, 0x00007ffc, 0x00001ffc, 0x000007fc, 0x000001fc, 0x0000007c, 0x00000018, 0x00000000  },    // 7
		{ 0x00000000, 0x01F80000, 0x07FE0000, 0x0FFF1F80, 0x1FFFBFE0, 0x3F0FFFF0, 0x3E07FFF8, 0x3C03F0FC, 0x3C03E07C, 0x3C03C03C, 0x3C03C03C, 0x3C03C03C, 0x3C03C03C, 0x3C03C03C, 0x3C03C03C, 0x3C03E07C, 0x3C03F0FC, 0x3E07FFF8, 0x3F0FFFF0, 0x1FFFBFE0, 0x0FFF1F80, 0x07FE0000, 0x01F80000, 0x00000000  },    // 8
		{ 0x00000000, 0x00003fc0, 0x00007fe0, 0x0001fff0, 0x1801fff8, 0x3c03f0fc, 0x3c03e07c, 0x3c03c03c, 0x3c03c03c, 0x3c03c03c, 0x3c03c03c, 0x3e03c03c, 0x3f03c03c, 0x1f83c03c, 0x0fc3c03c, 0x07e3c03c, 0x03f3c03c, 0x01ffe07c, 0x00fff0fc, 0x007ffff8, 0x003ffff0, 0x0003ffe0, 0x00007f80, 0x00000000  }     // 9
};




// Write a char on the video using the graphic bit font
void DrawChar(int x, int y, int c) {						// x and y are in pixels
    int j, k, h, w;                     					// Loop counters, j for horizontal, k for vertical
	unsigned int t;

        if(c < fontStart || c > fontEnd) return;
        if(fontBinary){
                    for(k = 0; k < fontHeight; k++) {         			// Loop through the bits in the word (ie, vertical pixels)
                        t =(*(fontPtr8 + (c * fontHeight) + k));
                        VA[((y+k) * (HRes/32) +x/32)] |= (t << ~((x/8)&0x03)*8);

                    }
        } else {

            if(fontHeight <= 16) {
            		for(j = 0; j < fontWidth; j++)         				// Loop through each word (ie, horizontal scan line)
                            for(k = 0; k < fontHeight; k++) {         			// Loop through the bits in the word (ie, vertical pixels)
                            t = (*(fontPtr16 + ((c - fontStart) * fontWidth) + j)) & (1<<k);
				if(fontReverse) t = !t;
				for(h = 0; h < fontScale; h++)
					for(w = 0; w < fontScale; w++)
                      	plot(x + (j * fontScale) + w, y + (k * fontScale) + h, t);	// Draw the pixel
			}
	} else if(fontHeight <= 32) {
		for(j = 0; j < fontWidth; j++)         				// Loop through each word (ie, horizontal scan line)
			for(k = 0; k < fontHeight; k++) {         		// Loop through the bits in the word (ie, vertical pixels)
				t = (*(fontPtr32 + ((c - fontStart) * fontWidth) + j)) & (1<<k);
				if(fontReverse) t = !t;
				for(h = 0; h < fontScale; h++)
					for(w = 0; w < fontScale; w++)
						plot(x + (j * fontScale) + w, y + (k * fontScale) + h, t);	// Draw the pixel
			}
	} else {
		for(j = 0; j < fontWidth; j++)         				// Loop through each word (ie, horizontal scan line)
			for(k = 0; k < fontHeight; k++) {         		// Loop through the bits in the word (ie, vertical pixels)
				if(k < 32)
					t = fontPtr32[((c - fontStart) * fontWidth * 2) + j] & (1<<k);
				else
					t = fontPtr32[((c - fontStart) * fontWidth * 2) + j + fontWidth] & (1<<(k-32));
				if(fontReverse) t = !t;
				for(h = 0; h < fontScale; h++)
					for(w = 0; w < fontScale; w++)
						plot(x + (j * fontScale) + w, y + (k * fontScale) + h, t);	// Draw the pixel
			}
	}
}
}



/*********************************************************************************************************************************
 The following functions are the only interface to the MMBasic engine
 They are defined in Video.h as extern
 *********************************************************************************************************************************/


// setup the font table
void initFont(void) {
	ftbl[0].p = fontZero;
	ftbl[0].width = 6;
	ftbl[0].height = 12;
	ftbl[0].start = ' ';
	ftbl[0].end = '~' + 1;
        ftbl[0].binary = 0;

	ftbl[1].p = fontOne;
	ftbl[1].width = 13;
	ftbl[1].height = 20;
	ftbl[1].start = ' ';
	ftbl[1].end = '~';
        ftbl[1].binary = 0;

	ftbl[2].p = fontTwo;
	ftbl[2].width = 24;
	ftbl[2].height = 32;
	ftbl[2].start = '+';
	ftbl[2].end = '9';
        ftbl[2].binary = 0;

	SetFont(0, 1, 0);
}


// used to define the current font, mostly called from the FONT command
void SetFont(int font, int scale, int reverse) {
        fontPtr8 =(char *)ftbl[font].p;
        fontPtr16 = (uint16 *)ftbl[font].p;
	fontPtr32 = (unsigned int *)ftbl[font].p;
	fontHeight = ftbl[font].height;
	fontWidth = ftbl[font].width;
	fontStart = ftbl[font].start;
	fontEnd = ftbl[font].end;
        fontBinary = ftbl[font].binary;
        fontScale = scale;
	fontReverse = reverse;
}


// unload a font - recover the memory and mark the font as empty
void UnloadFont(int font) {
	int bheight;
	if(ftbl[font].p != NULL) {
		if(fontPtr16 == (uint16 *)ftbl[font].p) error("This font is in use");
		if(ftbl[font].height > 32) bheight = 8;
		else if(ftbl[font].height > 16) bheight = 4;
		else bheight = 2;
		free(ftbl[font].p);											// free the memory
		HeapUsed -= (bheight * ftbl[font].width) * ((ftbl[font].end + 1) - ftbl[font].start);
		ftbl[font].p = NULL;										// mark the font as unused
	}	
}


// Put a char onto the video screen
void VideoPutc(char c) {
    c=VT100Filter(c);
    if(c == '\r') MMPosX = 0; 										// for a return set the horizontal position to zero
	
	if(c == '\n') {
		MMPosY += (fontHeight * fontScale); 						// for a line feed add the char height to the vert position
		ListCnt++;
	}
	
	if(c == '\t')  													// for a tab move the horiz position to the next tab spot
		MMPosX = ((MMPosX + ((fontWidth * fontScale) << 3)) >> 3) << 3;
		
	if(c == '\b') {													// for a backspace move the horiz position back by a char width
		MMPosX -= (fontWidth * fontScale);
		if(MMPosX <0) MMPosX = 0;
	}

	if(c >= ' ' ) {						// printable chars only
		if(MMPosX + (fontWidth * fontScale) > HRes) {			// if we are at the end of a line
			MMPosX = 0;						// wrap to the next
			MMPosY += (fontHeight * fontScale);
			ListCnt++;
		}
	}

//  if(MMPosY + (fontHeight * fontScale) > VRes + 1) {			// if we are beyond the bottom of the screen scroll up the previous lines
        if(MMPosY >= VRes) {			// if we are beyond the bottom of the screen scroll up the previous lines
	int *pd = VA;
       	int *ps = pd + (HBUFSIZE/32) * (fontHeight * fontScale);
       	int i;
       	for(i=0; i<(HBUFSIZE/32) * (VRes - (fontHeight * fontScale)); i++) *pd++ = *ps++;	// scroll up
       	for(i=0; i<(HBUFSIZE/32) * (fontHeight * fontScale); i++) *pd++ = 0;	// clear the new line
		MMPosY -= (fontHeight * fontScale);
	}

	if(c >= ' ' ) {						// printable chars only
		DrawChar(MMPosX, MMPosY, c);					// draw the char
		MMPosX += (fontWidth * fontScale);				// and update our position
	}

	MMCharPos = (MMPosX / (fontWidth * fontScale)) + 1;			// update the horizontal character position
}



// control the cursor
void ShowCursor(int show) {
	if(!show || CursorTimer > CURSOR_ON) {
		if(Cursor == C_STANDARD) {
			MMline(MMPosX, MMPosY + 11, MMPosX + 5, MMPosY + 11, 0);
		}	
		if(Cursor == C_INSERT) {
			MMline(MMPosX - 1, MMPosY + 11, MMPosX -1, MMPosY, 0);
			MMline(MMPosX - 4, MMPosY + 11, MMPosX + 2, MMPosY + 11, 0);
		}	
	}

	if(show && CursorTimer <= CURSOR_ON) {
		if(Cursor == C_STANDARD) {
			MMline(MMPosX, MMPosY + 11, MMPosX + 5, MMPosY + 11, 1);
		}	
		if(Cursor == C_INSERT) {
			MMline(MMPosX - 1, MMPosY + 11, MMPosX -1, MMPosY, 1);
			MMline(MMPosX - 4, MMPosY + 11, MMPosX + 2, MMPosY + 11, 1);
		}	
	}
}
	
