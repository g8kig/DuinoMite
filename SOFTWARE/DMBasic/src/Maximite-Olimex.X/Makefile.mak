
HEX  = Maximite-Olimex.X.production.hex
ELF  = Maximite-Olimex.X.production.elf
MAP  = Maximite-Olimex.X.production.map

SRCS = ./Main.c ./Setup.c ./Term.c \
./DuinoMite/CAN.c ./DuinoMite/GameDuino.c ./DuinoMite/RTC.c \
./Keyboard/Keyboard.c \
./MMBasic/Commands.c ./MMBasic/Custom.c ./MMBasic/External.c ./MMBasic/Files.c ./MMBasic/Functions.c ./MMBasic/Graphics.c \
./MMBasic/Help.c ./MMBasic/I2C.c ./MMBasic/Misc.c ./MMBasic/MMBasic.c ./MMBasic/Operators.c ./MMBasic/XModem.c \
./MMBasic/Editor.C \
./Serial/serial.c \
./Timers/Timers.c \
./Video/DrawChar.c ./Video/Video.c ./Video/VT100.c \
./USB/Microchip/USB/usb_device.c ./USB/usb_descriptors.c

SPECIAL_SRC = "./SDCard/Microchip/MDD File System/FSIO.c" \
"./SDCard/Microchip/MDD File System/SD-SPI.c" \
"./USB/Microchip/USB/CDC Device Driver/usb_function_cdc.c" \
"./USB/Microchip/USB/MSD Device Driver/usb_function_msd.c" \

BUILD_DIR ?= ./build
SOURCE_DIR ?= ../Source/

OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
OBJS := $(OBJS) $(BUILD_DIR)/FSIO.o $(BUILD_DIR)/SD-SPI.o $(BUILD_DIR)/usb_function_cdc.o $(BUILD_DIR)/usb_function_msd.o

DEPS := $(OBJS:.o=.d)

CFLAGS = -x c -c -mprocessor=32MX795F512L -DPIC32MX795F512L_PIM -DOLIMEX -DOLIMEX_DUINOMITE_EMEGA -I../Source -I../Source/SDCard/Microchip/Include -I../Source/USB -I../Source/USB/Microchip/Include -I../Source/SDCard "-I../Source/SDCard/Microchip/Include/MDD File System" -I../Source/USB/Microchip/Include/USB -I../Source/Video -I../Source/MMBasic -I../Source/Serial -I../Source/Timers -I../Source/Keyboard "-IC:/Program Files/Microchip/mplabc32/v1.1b/pic32mx/include" -O3 -Wall -MMD -funsigned-char
LFLAGS = -mprocessor=32MX795F512L -MMD -MP -O3 -Wall -Wl,--defsym=__MPLAB_BUILD=1,--script="..\Source\Maximite.ld",--defsym=_min_heap_size=42000,--defsym=_min_stack_size=6144,--gc-sections,-L"C:/Program Files/Microchip/MPLAB C32/pic32mx/lib",-Map="${MAP}"

$(BUILD_DIR)/$(ELF): $(OBJS)
	"C:\Program Files\Microchip\MPLAB C32\bin\pic32-gcc.exe" $(OBJS) -o $@ $(LFLAGS)

$(BUILD_DIR)/%.c.o: $(SOURCE_DIR)%.c
	"C:\Program Files\Microchip\MPLAB C32\bin\pic32-gcc.exe" $(CFLAGS) $< -o $@

$(BUILD_DIR)/%.C.o: $(SOURCE_DIR)%.C
	"C:\Program Files\Microchip\MPLAB C32\bin\pic32-gcc.exe" $(CFLAGS) $< -o $@

$(BUILD_DIR)/FSIO.o: $(SOURCE_DIR)./SDCard/Microchip/MDD\ File\ System/FSIO.c
	"C:\Program Files\Microchip\MPLAB C32\bin\pic32-gcc.exe" $(CFLAGS) "$(SOURCE_DIR)./SDCard/Microchip/MDD File System/FSIO.c" -o $@

$(BUILD_DIR)/SD-SPI.o: $(SOURCE_DIR)./SDCard/Microchip/MDD\ File\ System/SD-SPI.c
	"C:\Program Files\Microchip\MPLAB C32\bin\pic32-gcc.exe" $(CFLAGS) "$(SOURCE_DIR)./SDCard/Microchip/MDD File System/SD-SPI.c" -o $@

$(BUILD_DIR)/usb_function_cdc.o: $(SOURCE_DIR)./USB/Microchip/USB/CDC\ Device\ Driver/usb_function_cdc.c
	"C:\Program Files\Microchip\MPLAB C32\bin\pic32-gcc.exe" $(CFLAGS) "$(SOURCE_DIR)./USB/Microchip/USB/CDC Device Driver/usb_function_cdc.c" -o $@

$(BUILD_DIR)/usb_function_msd.o: $(SOURCE_DIR)./USB/Microchip/USB/MSD\ Device\ Driver/usb_function_msd.c
	"C:\Program Files\Microchip\MPLAB C32\bin\pic32-gcc.exe" $(CFLAGS) "$(SOURCE_DIR)./USB/Microchip/USB/MSD Device Driver/usb_function_msd.c" -o $@

$(BUILD_DIR)/$(HEX): $(BUILD_DIR)/$(ELF)   
	"C:\Program Files\Microchip\MPLAB C32\bin\pic32-bin2hex" $<  

.PHONY: clean
.PHONY: create
.PHONY: build

build:  $(BUILD_DIR)/$(HEX)

create:
	mkdir $(BUILD_DIR)
	mkdir $(BUILD_DIR)/DuinoMite
	mkdir $(BUILD_DIR)/Keyboard
	mkdir $(BUILD_DIR)/MMBasic
	mkdir $(BUILD_DIR)/SDCard
	mkdir $(BUILD_DIR)/Microchip
	mkdir "$(BUILD_DIR)/Microchip File System"
	mkdir $(BUILD_DIR)/Serial	
	mkdir $(BUILD_DIR)/Timers
	mkdir $(BUILD_DIR)/USB	
	mkdir $(BUILD_DIR)/USB/Microchip
	mkdir $(BUILD_DIR)/USB/Microchip/USB
	mkdir "$(BUILD_DIR)/USB/Microchip/USB/CDC Device Driver"
	mkdir "$(BUILD_DIR)/USB/Microchip/USB/MSD Device Driver"
	mkdir $(BUILD_DIR)/Video

clean:
	-rm -rf $(BUILD_DIR)

all: clean create build


-include $(DEPS)

	
