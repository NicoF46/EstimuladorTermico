MCU         = atmega328p
TARGET_ARCH = -mmcu=$(MCU)
TARGET      = main
CC          = avr-gcc
CPLUS       = avr-g++
CPPFLAGS    = -mmcu=$(MCU)
CFLAGS      = -Os -g -Wall -I. -DF_CPU=16000000
CPLUSFLAGS  = -Os -g -Wall -I. -DF_CPU=16000000
LDFLAGS     = -g -mmcu=$(MCU) -lm -Wl,--gc-sections -Os
PGMER       = -c arduino -b 115200 -P /dev/ttyUSB0
PGMERISP    = -c avrispv2 -P /dev/ttyUSB0
DUDE        = /usr/bin/avrdude -V -p $(MCU)
OBJ_DIR = ../dev/

OBJ_FILES   = \
	$(patsubst $(OBJ_DIR)/%.c,$(OBJ_DIR)/%.o,$(wildcard $(OBJ_DIR)/*.c)) \
	$(patsubst $(OBJ_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(wildcard $(OBJ_DIR)/*.cpp))

all: $(OBJ_DIR)/$(TARGET).hex

clean:
	rm -f $(OBJ_DIR)/$(TARGET).elf *.o *.hex

$(OBJ_DIR)/%.o: $(OBJ_DIR)/%.c
	$(CC) -c $(CPPFLAGS) $(CFLAGS) $< -o $@

$(OBJ_DIR)/%.o: $(OBJ_DIR)/%.cpp
	$(CPLUS) -c $(CPPFLAGS) $(CPLUSFLAGS) $< -o $@

$(OBJ_DIR)/$(TARGET).elf: $(OBJ_DIR)/$(OBJ_FILES)
	$(CC) $(LDFLAGS) -o $@ $(OBJ_DIR)/$(OBJ_FILES)

$(OBJ_DIR)/$(TARGET).hex: $(OBJ_DIR)/$(TARGET).elf
	avr-objcopy -j .text -j .data -O ihex $(OBJ_DIR)/$(TARGET).elf $(OBJ_DIR)/$(TARGET).hex
	avr-objcopy -j .eeprom --set-section-flags=.eeprom="alloc,load" --change-section-lma .eeprom=0 -O ihex $(TARGET).elf eeprom.hex

upload: $(OBJ_DIR)/$(TARGET).hex
	$(DUDE) $(PGMER) -U flash:w:$(OBJ_DIR)/$(TARGET).hex

size: $(OBJ_DIR)/$(TARGET).elf
	avr-size --format=avr --mcu=$(MCU) $(OBJ_DIR)/$(TARGET).elf
