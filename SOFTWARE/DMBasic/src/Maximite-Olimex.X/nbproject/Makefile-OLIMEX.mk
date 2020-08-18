#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-OLIMEX.mk)" "nbproject/Makefile-local-OLIMEX.mk"
include nbproject/Makefile-local-OLIMEX.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=OLIMEX
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Maximite-Olimex.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Maximite-Olimex.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../Source/MMBasic/Commands.c ../Source/MMBasic/Custom.c ../Source/MMBasic/External.c ../Source/MMBasic/Files.c ../Source/MMBasic/Functions.c ../Source/MMBasic/Graphics.c ../Source/MMBasic/Help.c ../Source/MMBasic/I2C.c ../Source/MMBasic/MMBasic.c ../Source/MMBasic/Misc.c ../Source/MMBasic/Operators.c ../Source/MMBasic/XModem.c ../Source/MMBasic/Editor.C "../Source/SDCard/Microchip/MDD File System/FSIO.c" "../Source/SDCard/Microchip/MDD File System/SD-SPI.c" ../Source/USB/usb_descriptors.c ../Source/USB/Microchip/USB/usb_device.c "../Source/USB/Microchip/USB/CDC Device Driver/usb_function_cdc.c" "../Source/USB/Microchip/USB/MSD Device Driver/usb_function_msd.c" ../Source/Video/DrawChar.c ../Source/Video/VT100.c ../Source/Video/Video.c ../Source/DuinoMite/GameDuino.c ../Source/Keyboard/Keyboard.c ../Source/Main.c ../Source/DuinoMite/RTC.c ../Source/Setup.c ../Source/Term.c ../Source/Timers/Timers.c ../Source/Serial/serial.c ../Source/DuinoMite/CAN.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/2012694729/Commands.o ${OBJECTDIR}/_ext/2012694729/Custom.o ${OBJECTDIR}/_ext/2012694729/External.o ${OBJECTDIR}/_ext/2012694729/Files.o ${OBJECTDIR}/_ext/2012694729/Functions.o ${OBJECTDIR}/_ext/2012694729/Graphics.o ${OBJECTDIR}/_ext/2012694729/Help.o ${OBJECTDIR}/_ext/2012694729/I2C.o ${OBJECTDIR}/_ext/2012694729/MMBasic.o ${OBJECTDIR}/_ext/2012694729/Misc.o ${OBJECTDIR}/_ext/2012694729/Operators.o ${OBJECTDIR}/_ext/2012694729/XModem.o ${OBJECTDIR}/_ext/2012694729/Editor.o ${OBJECTDIR}/_ext/779736424/FSIO.o ${OBJECTDIR}/_ext/779736424/SD-SPI.o ${OBJECTDIR}/_ext/940238529/usb_descriptors.o ${OBJECTDIR}/_ext/678306549/usb_device.o ${OBJECTDIR}/_ext/488640762/usb_function_cdc.o ${OBJECTDIR}/_ext/718657706/usb_function_msd.o ${OBJECTDIR}/_ext/1624479370/DrawChar.o ${OBJECTDIR}/_ext/1624479370/VT100.o ${OBJECTDIR}/_ext/1624479370/Video.o ${OBJECTDIR}/_ext/2129892895/GameDuino.o ${OBJECTDIR}/_ext/179026188/Keyboard.o ${OBJECTDIR}/_ext/1728301206/Main.o ${OBJECTDIR}/_ext/2129892895/RTC.o ${OBJECTDIR}/_ext/1728301206/Setup.o ${OBJECTDIR}/_ext/1728301206/Term.o ${OBJECTDIR}/_ext/1123757107/Timers.o ${OBJECTDIR}/_ext/1091586137/serial.o ${OBJECTDIR}/_ext/2129892895/CAN.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/2012694729/Commands.o.d ${OBJECTDIR}/_ext/2012694729/Custom.o.d ${OBJECTDIR}/_ext/2012694729/External.o.d ${OBJECTDIR}/_ext/2012694729/Files.o.d ${OBJECTDIR}/_ext/2012694729/Functions.o.d ${OBJECTDIR}/_ext/2012694729/Graphics.o.d ${OBJECTDIR}/_ext/2012694729/Help.o.d ${OBJECTDIR}/_ext/2012694729/I2C.o.d ${OBJECTDIR}/_ext/2012694729/MMBasic.o.d ${OBJECTDIR}/_ext/2012694729/Misc.o.d ${OBJECTDIR}/_ext/2012694729/Operators.o.d ${OBJECTDIR}/_ext/2012694729/XModem.o.d ${OBJECTDIR}/_ext/2012694729/Editor.o.d ${OBJECTDIR}/_ext/779736424/FSIO.o.d ${OBJECTDIR}/_ext/779736424/SD-SPI.o.d ${OBJECTDIR}/_ext/940238529/usb_descriptors.o.d ${OBJECTDIR}/_ext/678306549/usb_device.o.d ${OBJECTDIR}/_ext/488640762/usb_function_cdc.o.d ${OBJECTDIR}/_ext/718657706/usb_function_msd.o.d ${OBJECTDIR}/_ext/1624479370/DrawChar.o.d ${OBJECTDIR}/_ext/1624479370/VT100.o.d ${OBJECTDIR}/_ext/1624479370/Video.o.d ${OBJECTDIR}/_ext/2129892895/GameDuino.o.d ${OBJECTDIR}/_ext/179026188/Keyboard.o.d ${OBJECTDIR}/_ext/1728301206/Main.o.d ${OBJECTDIR}/_ext/2129892895/RTC.o.d ${OBJECTDIR}/_ext/1728301206/Setup.o.d ${OBJECTDIR}/_ext/1728301206/Term.o.d ${OBJECTDIR}/_ext/1123757107/Timers.o.d ${OBJECTDIR}/_ext/1091586137/serial.o.d ${OBJECTDIR}/_ext/2129892895/CAN.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/2012694729/Commands.o ${OBJECTDIR}/_ext/2012694729/Custom.o ${OBJECTDIR}/_ext/2012694729/External.o ${OBJECTDIR}/_ext/2012694729/Files.o ${OBJECTDIR}/_ext/2012694729/Functions.o ${OBJECTDIR}/_ext/2012694729/Graphics.o ${OBJECTDIR}/_ext/2012694729/Help.o ${OBJECTDIR}/_ext/2012694729/I2C.o ${OBJECTDIR}/_ext/2012694729/MMBasic.o ${OBJECTDIR}/_ext/2012694729/Misc.o ${OBJECTDIR}/_ext/2012694729/Operators.o ${OBJECTDIR}/_ext/2012694729/XModem.o ${OBJECTDIR}/_ext/2012694729/Editor.o ${OBJECTDIR}/_ext/779736424/FSIO.o ${OBJECTDIR}/_ext/779736424/SD-SPI.o ${OBJECTDIR}/_ext/940238529/usb_descriptors.o ${OBJECTDIR}/_ext/678306549/usb_device.o ${OBJECTDIR}/_ext/488640762/usb_function_cdc.o ${OBJECTDIR}/_ext/718657706/usb_function_msd.o ${OBJECTDIR}/_ext/1624479370/DrawChar.o ${OBJECTDIR}/_ext/1624479370/VT100.o ${OBJECTDIR}/_ext/1624479370/Video.o ${OBJECTDIR}/_ext/2129892895/GameDuino.o ${OBJECTDIR}/_ext/179026188/Keyboard.o ${OBJECTDIR}/_ext/1728301206/Main.o ${OBJECTDIR}/_ext/2129892895/RTC.o ${OBJECTDIR}/_ext/1728301206/Setup.o ${OBJECTDIR}/_ext/1728301206/Term.o ${OBJECTDIR}/_ext/1123757107/Timers.o ${OBJECTDIR}/_ext/1091586137/serial.o ${OBJECTDIR}/_ext/2129892895/CAN.o

# Source Files
SOURCEFILES=../Source/MMBasic/Commands.c ../Source/MMBasic/Custom.c ../Source/MMBasic/External.c ../Source/MMBasic/Files.c ../Source/MMBasic/Functions.c ../Source/MMBasic/Graphics.c ../Source/MMBasic/Help.c ../Source/MMBasic/I2C.c ../Source/MMBasic/MMBasic.c ../Source/MMBasic/Misc.c ../Source/MMBasic/Operators.c ../Source/MMBasic/XModem.c ../Source/MMBasic/Editor.C ../Source/SDCard/Microchip/MDD File System/FSIO.c ../Source/SDCard/Microchip/MDD File System/SD-SPI.c ../Source/USB/usb_descriptors.c ../Source/USB/Microchip/USB/usb_device.c ../Source/USB/Microchip/USB/CDC Device Driver/usb_function_cdc.c ../Source/USB/Microchip/USB/MSD Device Driver/usb_function_msd.c ../Source/Video/DrawChar.c ../Source/Video/VT100.c ../Source/Video/Video.c ../Source/DuinoMite/GameDuino.c ../Source/Keyboard/Keyboard.c ../Source/Main.c ../Source/DuinoMite/RTC.c ../Source/Setup.c ../Source/Term.c ../Source/Timers/Timers.c ../Source/Serial/serial.c ../Source/DuinoMite/CAN.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-OLIMEX.mk dist/${CND_CONF}/${IMAGE_TYPE}/Maximite-Olimex.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=,--script="..\Source\Maximite.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/2012694729/Commands.o: ../Source/MMBasic/Commands.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Commands.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Commands.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Commands.o.d" -o ${OBJECTDIR}/_ext/2012694729/Commands.o ../Source/MMBasic/Commands.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Custom.o: ../Source/MMBasic/Custom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Custom.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Custom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Custom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Custom.o.d" -o ${OBJECTDIR}/_ext/2012694729/Custom.o ../Source/MMBasic/Custom.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/External.o: ../Source/MMBasic/External.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/External.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/External.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/External.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/External.o.d" -o ${OBJECTDIR}/_ext/2012694729/External.o ../Source/MMBasic/External.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Files.o: ../Source/MMBasic/Files.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Files.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Files.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Files.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Files.o.d" -o ${OBJECTDIR}/_ext/2012694729/Files.o ../Source/MMBasic/Files.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Functions.o: ../Source/MMBasic/Functions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Functions.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Functions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Functions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Functions.o.d" -o ${OBJECTDIR}/_ext/2012694729/Functions.o ../Source/MMBasic/Functions.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Graphics.o: ../Source/MMBasic/Graphics.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Graphics.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Graphics.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Graphics.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Graphics.o.d" -o ${OBJECTDIR}/_ext/2012694729/Graphics.o ../Source/MMBasic/Graphics.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Help.o: ../Source/MMBasic/Help.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Help.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Help.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Help.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Help.o.d" -o ${OBJECTDIR}/_ext/2012694729/Help.o ../Source/MMBasic/Help.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/I2C.o: ../Source/MMBasic/I2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/I2C.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/I2C.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/I2C.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/I2C.o.d" -o ${OBJECTDIR}/_ext/2012694729/I2C.o ../Source/MMBasic/I2C.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/MMBasic.o: ../Source/MMBasic/MMBasic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/MMBasic.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/MMBasic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/MMBasic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/MMBasic.o.d" -o ${OBJECTDIR}/_ext/2012694729/MMBasic.o ../Source/MMBasic/MMBasic.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Misc.o: ../Source/MMBasic/Misc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Misc.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Misc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Misc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Misc.o.d" -o ${OBJECTDIR}/_ext/2012694729/Misc.o ../Source/MMBasic/Misc.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Operators.o: ../Source/MMBasic/Operators.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Operators.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Operators.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Operators.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Operators.o.d" -o ${OBJECTDIR}/_ext/2012694729/Operators.o ../Source/MMBasic/Operators.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/XModem.o: ../Source/MMBasic/XModem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/XModem.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/XModem.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/XModem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/XModem.o.d" -o ${OBJECTDIR}/_ext/2012694729/XModem.o ../Source/MMBasic/XModem.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Editor.o: ../Source/MMBasic/Editor.C  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Editor.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Editor.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Editor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Editor.o.d" -o ${OBJECTDIR}/_ext/2012694729/Editor.o ../Source/MMBasic/Editor.C   -funsigned-char
	
${OBJECTDIR}/_ext/779736424/FSIO.o: ../Source/SDCard/Microchip/MDD\ File\ System/FSIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779736424" 
	@${RM} ${OBJECTDIR}/_ext/779736424/FSIO.o.d 
	@${RM} ${OBJECTDIR}/_ext/779736424/FSIO.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779736424/FSIO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/779736424/FSIO.o.d" -o ${OBJECTDIR}/_ext/779736424/FSIO.o "../Source/SDCard/Microchip/MDD File System/FSIO.c"   -funsigned-char
	
${OBJECTDIR}/_ext/779736424/SD-SPI.o: ../Source/SDCard/Microchip/MDD\ File\ System/SD-SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779736424" 
	@${RM} ${OBJECTDIR}/_ext/779736424/SD-SPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/779736424/SD-SPI.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779736424/SD-SPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/779736424/SD-SPI.o.d" -o ${OBJECTDIR}/_ext/779736424/SD-SPI.o "../Source/SDCard/Microchip/MDD File System/SD-SPI.c"   -funsigned-char
	
${OBJECTDIR}/_ext/940238529/usb_descriptors.o: ../Source/USB/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/940238529" 
	@${RM} ${OBJECTDIR}/_ext/940238529/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/_ext/940238529/usb_descriptors.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/940238529/usb_descriptors.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/940238529/usb_descriptors.o.d" -o ${OBJECTDIR}/_ext/940238529/usb_descriptors.o ../Source/USB/usb_descriptors.c   -funsigned-char
	
${OBJECTDIR}/_ext/678306549/usb_device.o: ../Source/USB/Microchip/USB/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/678306549" 
	@${RM} ${OBJECTDIR}/_ext/678306549/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/678306549/usb_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/678306549/usb_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/678306549/usb_device.o.d" -o ${OBJECTDIR}/_ext/678306549/usb_device.o ../Source/USB/Microchip/USB/usb_device.c   -funsigned-char
	
${OBJECTDIR}/_ext/488640762/usb_function_cdc.o: ../Source/USB/Microchip/USB/CDC\ Device\ Driver/usb_function_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/488640762" 
	@${RM} ${OBJECTDIR}/_ext/488640762/usb_function_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/488640762/usb_function_cdc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/488640762/usb_function_cdc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/488640762/usb_function_cdc.o.d" -o ${OBJECTDIR}/_ext/488640762/usb_function_cdc.o "../Source/USB/Microchip/USB/CDC Device Driver/usb_function_cdc.c"   -funsigned-char
	
${OBJECTDIR}/_ext/718657706/usb_function_msd.o: ../Source/USB/Microchip/USB/MSD\ Device\ Driver/usb_function_msd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/718657706" 
	@${RM} ${OBJECTDIR}/_ext/718657706/usb_function_msd.o.d 
	@${RM} ${OBJECTDIR}/_ext/718657706/usb_function_msd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/718657706/usb_function_msd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/718657706/usb_function_msd.o.d" -o ${OBJECTDIR}/_ext/718657706/usb_function_msd.o "../Source/USB/Microchip/USB/MSD Device Driver/usb_function_msd.c"   -funsigned-char
	
${OBJECTDIR}/_ext/1624479370/DrawChar.o: ../Source/Video/DrawChar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1624479370" 
	@${RM} ${OBJECTDIR}/_ext/1624479370/DrawChar.o.d 
	@${RM} ${OBJECTDIR}/_ext/1624479370/DrawChar.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1624479370/DrawChar.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1624479370/DrawChar.o.d" -o ${OBJECTDIR}/_ext/1624479370/DrawChar.o ../Source/Video/DrawChar.c   -funsigned-char
	
${OBJECTDIR}/_ext/1624479370/VT100.o: ../Source/Video/VT100.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1624479370" 
	@${RM} ${OBJECTDIR}/_ext/1624479370/VT100.o.d 
	@${RM} ${OBJECTDIR}/_ext/1624479370/VT100.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1624479370/VT100.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1624479370/VT100.o.d" -o ${OBJECTDIR}/_ext/1624479370/VT100.o ../Source/Video/VT100.c   -funsigned-char
	
${OBJECTDIR}/_ext/1624479370/Video.o: ../Source/Video/Video.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1624479370" 
	@${RM} ${OBJECTDIR}/_ext/1624479370/Video.o.d 
	@${RM} ${OBJECTDIR}/_ext/1624479370/Video.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1624479370/Video.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1624479370/Video.o.d" -o ${OBJECTDIR}/_ext/1624479370/Video.o ../Source/Video/Video.c   -funsigned-char
	
${OBJECTDIR}/_ext/2129892895/GameDuino.o: ../Source/DuinoMite/GameDuino.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2129892895" 
	@${RM} ${OBJECTDIR}/_ext/2129892895/GameDuino.o.d 
	@${RM} ${OBJECTDIR}/_ext/2129892895/GameDuino.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2129892895/GameDuino.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2129892895/GameDuino.o.d" -o ${OBJECTDIR}/_ext/2129892895/GameDuino.o ../Source/DuinoMite/GameDuino.c   -funsigned-char
	
${OBJECTDIR}/_ext/179026188/Keyboard.o: ../Source/Keyboard/Keyboard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/179026188" 
	@${RM} ${OBJECTDIR}/_ext/179026188/Keyboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/179026188/Keyboard.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/179026188/Keyboard.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/179026188/Keyboard.o.d" -o ${OBJECTDIR}/_ext/179026188/Keyboard.o ../Source/Keyboard/Keyboard.c   -funsigned-char
	
${OBJECTDIR}/_ext/1728301206/Main.o: ../Source/Main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1728301206" 
	@${RM} ${OBJECTDIR}/_ext/1728301206/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728301206/Main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1728301206/Main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1728301206/Main.o.d" -o ${OBJECTDIR}/_ext/1728301206/Main.o ../Source/Main.c   -funsigned-char
	
${OBJECTDIR}/_ext/2129892895/RTC.o: ../Source/DuinoMite/RTC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2129892895" 
	@${RM} ${OBJECTDIR}/_ext/2129892895/RTC.o.d 
	@${RM} ${OBJECTDIR}/_ext/2129892895/RTC.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2129892895/RTC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2129892895/RTC.o.d" -o ${OBJECTDIR}/_ext/2129892895/RTC.o ../Source/DuinoMite/RTC.c   -funsigned-char
	
${OBJECTDIR}/_ext/1728301206/Setup.o: ../Source/Setup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1728301206" 
	@${RM} ${OBJECTDIR}/_ext/1728301206/Setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728301206/Setup.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1728301206/Setup.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1728301206/Setup.o.d" -o ${OBJECTDIR}/_ext/1728301206/Setup.o ../Source/Setup.c   -funsigned-char
	
${OBJECTDIR}/_ext/1728301206/Term.o: ../Source/Term.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1728301206" 
	@${RM} ${OBJECTDIR}/_ext/1728301206/Term.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728301206/Term.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1728301206/Term.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1728301206/Term.o.d" -o ${OBJECTDIR}/_ext/1728301206/Term.o ../Source/Term.c   -funsigned-char
	
${OBJECTDIR}/_ext/1123757107/Timers.o: ../Source/Timers/Timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1123757107" 
	@${RM} ${OBJECTDIR}/_ext/1123757107/Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1123757107/Timers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1123757107/Timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1123757107/Timers.o.d" -o ${OBJECTDIR}/_ext/1123757107/Timers.o ../Source/Timers/Timers.c   -funsigned-char
	
${OBJECTDIR}/_ext/1091586137/serial.o: ../Source/Serial/serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1091586137" 
	@${RM} ${OBJECTDIR}/_ext/1091586137/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091586137/serial.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1091586137/serial.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1091586137/serial.o.d" -o ${OBJECTDIR}/_ext/1091586137/serial.o ../Source/Serial/serial.c   -funsigned-char
	
${OBJECTDIR}/_ext/2129892895/CAN.o: ../Source/DuinoMite/CAN.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2129892895" 
	@${RM} ${OBJECTDIR}/_ext/2129892895/CAN.o.d 
	@${RM} ${OBJECTDIR}/_ext/2129892895/CAN.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2129892895/CAN.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG    -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2129892895/CAN.o.d" -o ${OBJECTDIR}/_ext/2129892895/CAN.o ../Source/DuinoMite/CAN.c   -funsigned-char
	
else
${OBJECTDIR}/_ext/2012694729/Commands.o: ../Source/MMBasic/Commands.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Commands.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Commands.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Commands.o.d" -o ${OBJECTDIR}/_ext/2012694729/Commands.o ../Source/MMBasic/Commands.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Custom.o: ../Source/MMBasic/Custom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Custom.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Custom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Custom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Custom.o.d" -o ${OBJECTDIR}/_ext/2012694729/Custom.o ../Source/MMBasic/Custom.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/External.o: ../Source/MMBasic/External.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/External.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/External.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/External.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/External.o.d" -o ${OBJECTDIR}/_ext/2012694729/External.o ../Source/MMBasic/External.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Files.o: ../Source/MMBasic/Files.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Files.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Files.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Files.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Files.o.d" -o ${OBJECTDIR}/_ext/2012694729/Files.o ../Source/MMBasic/Files.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Functions.o: ../Source/MMBasic/Functions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Functions.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Functions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Functions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Functions.o.d" -o ${OBJECTDIR}/_ext/2012694729/Functions.o ../Source/MMBasic/Functions.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Graphics.o: ../Source/MMBasic/Graphics.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Graphics.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Graphics.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Graphics.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Graphics.o.d" -o ${OBJECTDIR}/_ext/2012694729/Graphics.o ../Source/MMBasic/Graphics.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Help.o: ../Source/MMBasic/Help.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Help.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Help.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Help.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Help.o.d" -o ${OBJECTDIR}/_ext/2012694729/Help.o ../Source/MMBasic/Help.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/I2C.o: ../Source/MMBasic/I2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/I2C.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/I2C.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/I2C.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/I2C.o.d" -o ${OBJECTDIR}/_ext/2012694729/I2C.o ../Source/MMBasic/I2C.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/MMBasic.o: ../Source/MMBasic/MMBasic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/MMBasic.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/MMBasic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/MMBasic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/MMBasic.o.d" -o ${OBJECTDIR}/_ext/2012694729/MMBasic.o ../Source/MMBasic/MMBasic.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Misc.o: ../Source/MMBasic/Misc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Misc.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Misc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Misc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Misc.o.d" -o ${OBJECTDIR}/_ext/2012694729/Misc.o ../Source/MMBasic/Misc.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Operators.o: ../Source/MMBasic/Operators.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Operators.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Operators.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Operators.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Operators.o.d" -o ${OBJECTDIR}/_ext/2012694729/Operators.o ../Source/MMBasic/Operators.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/XModem.o: ../Source/MMBasic/XModem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/XModem.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/XModem.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/XModem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/XModem.o.d" -o ${OBJECTDIR}/_ext/2012694729/XModem.o ../Source/MMBasic/XModem.c   -funsigned-char
	
${OBJECTDIR}/_ext/2012694729/Editor.o: ../Source/MMBasic/Editor.C  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2012694729" 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Editor.o.d 
	@${RM} ${OBJECTDIR}/_ext/2012694729/Editor.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2012694729/Editor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2012694729/Editor.o.d" -o ${OBJECTDIR}/_ext/2012694729/Editor.o ../Source/MMBasic/Editor.C   -funsigned-char
	
${OBJECTDIR}/_ext/779736424/FSIO.o: ../Source/SDCard/Microchip/MDD\ File\ System/FSIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779736424" 
	@${RM} ${OBJECTDIR}/_ext/779736424/FSIO.o.d 
	@${RM} ${OBJECTDIR}/_ext/779736424/FSIO.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779736424/FSIO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/779736424/FSIO.o.d" -o ${OBJECTDIR}/_ext/779736424/FSIO.o "../Source/SDCard/Microchip/MDD File System/FSIO.c"   -funsigned-char
	
${OBJECTDIR}/_ext/779736424/SD-SPI.o: ../Source/SDCard/Microchip/MDD\ File\ System/SD-SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779736424" 
	@${RM} ${OBJECTDIR}/_ext/779736424/SD-SPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/779736424/SD-SPI.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779736424/SD-SPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/779736424/SD-SPI.o.d" -o ${OBJECTDIR}/_ext/779736424/SD-SPI.o "../Source/SDCard/Microchip/MDD File System/SD-SPI.c"   -funsigned-char
	
${OBJECTDIR}/_ext/940238529/usb_descriptors.o: ../Source/USB/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/940238529" 
	@${RM} ${OBJECTDIR}/_ext/940238529/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/_ext/940238529/usb_descriptors.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/940238529/usb_descriptors.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/940238529/usb_descriptors.o.d" -o ${OBJECTDIR}/_ext/940238529/usb_descriptors.o ../Source/USB/usb_descriptors.c   -funsigned-char
	
${OBJECTDIR}/_ext/678306549/usb_device.o: ../Source/USB/Microchip/USB/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/678306549" 
	@${RM} ${OBJECTDIR}/_ext/678306549/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/678306549/usb_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/678306549/usb_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/678306549/usb_device.o.d" -o ${OBJECTDIR}/_ext/678306549/usb_device.o ../Source/USB/Microchip/USB/usb_device.c   -funsigned-char
	
${OBJECTDIR}/_ext/488640762/usb_function_cdc.o: ../Source/USB/Microchip/USB/CDC\ Device\ Driver/usb_function_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/488640762" 
	@${RM} ${OBJECTDIR}/_ext/488640762/usb_function_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/488640762/usb_function_cdc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/488640762/usb_function_cdc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/488640762/usb_function_cdc.o.d" -o ${OBJECTDIR}/_ext/488640762/usb_function_cdc.o "../Source/USB/Microchip/USB/CDC Device Driver/usb_function_cdc.c"   -funsigned-char
	
${OBJECTDIR}/_ext/718657706/usb_function_msd.o: ../Source/USB/Microchip/USB/MSD\ Device\ Driver/usb_function_msd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/718657706" 
	@${RM} ${OBJECTDIR}/_ext/718657706/usb_function_msd.o.d 
	@${RM} ${OBJECTDIR}/_ext/718657706/usb_function_msd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/718657706/usb_function_msd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/718657706/usb_function_msd.o.d" -o ${OBJECTDIR}/_ext/718657706/usb_function_msd.o "../Source/USB/Microchip/USB/MSD Device Driver/usb_function_msd.c"   -funsigned-char
	
${OBJECTDIR}/_ext/1624479370/DrawChar.o: ../Source/Video/DrawChar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1624479370" 
	@${RM} ${OBJECTDIR}/_ext/1624479370/DrawChar.o.d 
	@${RM} ${OBJECTDIR}/_ext/1624479370/DrawChar.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1624479370/DrawChar.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1624479370/DrawChar.o.d" -o ${OBJECTDIR}/_ext/1624479370/DrawChar.o ../Source/Video/DrawChar.c   -funsigned-char
	
${OBJECTDIR}/_ext/1624479370/VT100.o: ../Source/Video/VT100.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1624479370" 
	@${RM} ${OBJECTDIR}/_ext/1624479370/VT100.o.d 
	@${RM} ${OBJECTDIR}/_ext/1624479370/VT100.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1624479370/VT100.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1624479370/VT100.o.d" -o ${OBJECTDIR}/_ext/1624479370/VT100.o ../Source/Video/VT100.c   -funsigned-char
	
${OBJECTDIR}/_ext/1624479370/Video.o: ../Source/Video/Video.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1624479370" 
	@${RM} ${OBJECTDIR}/_ext/1624479370/Video.o.d 
	@${RM} ${OBJECTDIR}/_ext/1624479370/Video.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1624479370/Video.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1624479370/Video.o.d" -o ${OBJECTDIR}/_ext/1624479370/Video.o ../Source/Video/Video.c   -funsigned-char
	
${OBJECTDIR}/_ext/2129892895/GameDuino.o: ../Source/DuinoMite/GameDuino.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2129892895" 
	@${RM} ${OBJECTDIR}/_ext/2129892895/GameDuino.o.d 
	@${RM} ${OBJECTDIR}/_ext/2129892895/GameDuino.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2129892895/GameDuino.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2129892895/GameDuino.o.d" -o ${OBJECTDIR}/_ext/2129892895/GameDuino.o ../Source/DuinoMite/GameDuino.c   -funsigned-char
	
${OBJECTDIR}/_ext/179026188/Keyboard.o: ../Source/Keyboard/Keyboard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/179026188" 
	@${RM} ${OBJECTDIR}/_ext/179026188/Keyboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/179026188/Keyboard.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/179026188/Keyboard.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/179026188/Keyboard.o.d" -o ${OBJECTDIR}/_ext/179026188/Keyboard.o ../Source/Keyboard/Keyboard.c   -funsigned-char
	
${OBJECTDIR}/_ext/1728301206/Main.o: ../Source/Main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1728301206" 
	@${RM} ${OBJECTDIR}/_ext/1728301206/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728301206/Main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1728301206/Main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1728301206/Main.o.d" -o ${OBJECTDIR}/_ext/1728301206/Main.o ../Source/Main.c   -funsigned-char
	
${OBJECTDIR}/_ext/2129892895/RTC.o: ../Source/DuinoMite/RTC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2129892895" 
	@${RM} ${OBJECTDIR}/_ext/2129892895/RTC.o.d 
	@${RM} ${OBJECTDIR}/_ext/2129892895/RTC.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2129892895/RTC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2129892895/RTC.o.d" -o ${OBJECTDIR}/_ext/2129892895/RTC.o ../Source/DuinoMite/RTC.c   -funsigned-char
	
${OBJECTDIR}/_ext/1728301206/Setup.o: ../Source/Setup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1728301206" 
	@${RM} ${OBJECTDIR}/_ext/1728301206/Setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728301206/Setup.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1728301206/Setup.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1728301206/Setup.o.d" -o ${OBJECTDIR}/_ext/1728301206/Setup.o ../Source/Setup.c   -funsigned-char
	
${OBJECTDIR}/_ext/1728301206/Term.o: ../Source/Term.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1728301206" 
	@${RM} ${OBJECTDIR}/_ext/1728301206/Term.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728301206/Term.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1728301206/Term.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1728301206/Term.o.d" -o ${OBJECTDIR}/_ext/1728301206/Term.o ../Source/Term.c   -funsigned-char
	
${OBJECTDIR}/_ext/1123757107/Timers.o: ../Source/Timers/Timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1123757107" 
	@${RM} ${OBJECTDIR}/_ext/1123757107/Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1123757107/Timers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1123757107/Timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1123757107/Timers.o.d" -o ${OBJECTDIR}/_ext/1123757107/Timers.o ../Source/Timers/Timers.c   -funsigned-char
	
${OBJECTDIR}/_ext/1091586137/serial.o: ../Source/Serial/serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1091586137" 
	@${RM} ${OBJECTDIR}/_ext/1091586137/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1091586137/serial.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1091586137/serial.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/1091586137/serial.o.d" -o ${OBJECTDIR}/_ext/1091586137/serial.o ../Source/Serial/serial.c   -funsigned-char
	
${OBJECTDIR}/_ext/2129892895/CAN.o: ../Source/DuinoMite/CAN.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2129892895" 
	@${RM} ${OBJECTDIR}/_ext/2129892895/CAN.o.d 
	@${RM} ${OBJECTDIR}/_ext/2129892895/CAN.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2129892895/CAN.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -ffunction-sections -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I"../Source" -I"../Source/SDCard/Microchip/Include" -I"../Source/USB" -I"../Source/USB/Microchip/Include" -I"../Source/SDCard" -I"../Source/SDCard/Microchip/Include/MDD File System" -I"../Source/USB/Microchip/Include/USB" -I"../Source/Video" -I"../Source/MMBasic" -I"../Source/Serial" -I"../Source/Timers" -I"../Source/Keyboard" -I"C:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -MF "${OBJECTDIR}/_ext/2129892895/CAN.o.d" -o ${OBJECTDIR}/_ext/2129892895/CAN.o ../Source/DuinoMite/CAN.c   -funsigned-char
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Maximite-Olimex.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../Source/Maximite.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)    -mprocessor=$(MP_PROCESSOR_OPTION) -O3 -o dist/${CND_CONF}/${IMAGE_TYPE}/Maximite-Olimex.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}       -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=_min_heap_size=42000,--defsym=_min_stack_size=6144,--gc-sections,-L"../../Program Files (x86)/Microchip/MPLAB C32/pic32mx/lib",-Map="${DISTDIR}/Maximite-Olimex.X.${IMAGE_TYPE}.map" 
else
dist/${CND_CONF}/${IMAGE_TYPE}/Maximite-Olimex.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../Source/Maximite.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -O3 -o dist/${CND_CONF}/${IMAGE_TYPE}/Maximite-Olimex.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}       -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=42000,--defsym=_min_stack_size=6144,--gc-sections,-L"../../Program Files (x86)/Microchip/MPLAB C32/pic32mx/lib",-Map="${DISTDIR}/Maximite-Olimex.X.${IMAGE_TYPE}.map"
	${MP_CC_DIR}\\pic32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Maximite-Olimex.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/OLIMEX
	${RM} -r dist/OLIMEX

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
