MCU         = atmega328p
TARGET_ARCH = -mmcu=$(MCU)
CC          = avr-gcc
CFLAGS      = -mmcu=$(MCU) -Os -g -Wall -I. -DF_CPU=16000000
LDFLAGS     = -g -mmcu=$(MCU) -lm -Wl,--gc-sections -Os
PGMER       = -c arduino -b 115200 -P /dev/ttyUSB0
DUDE        = /usr/bin/avrdude -V -p $(MCU)
OBJ_DIR 	= ../dev
TOOLS_DIR 	= ../tools
PYTHON 		= python3
TARGET      = $(OBJ_DIR)/main

GEN_FILES = $(patsubst $(OBJ_DIR)/%.h.gen,$(OBJ_DIR)/%.gen.h,$(wildcard $(OBJ_DIR)/*.h.gen))
OBJ_FILES = $(patsubst $(OBJ_DIR)/%.c,$(OBJ_DIR)/%.o,$(wildcard $(OBJ_DIR)/*.c))

.PHONY: all
all: $(TARGET).elf

.PHONY: clean
clean:
	rm -f $(TARGET).elf $(OBJ_DIR)/*.o $(OBJ_DIR)/*.hex $(OBJ_DIR)/*.gen.h

.PHONY: upload
upload: $(TARGET).hex
	$(DUDE) $(PGMER) -U flash:w:$(TARGET).hex

.PHONY: size
size: $(TARGET).elf
	avr-size --format=avr --mcu=$(MCU) $(TARGET).elf

.PHONY: format
format: 
	@for f in $$(find ../dev -name '*.[hc]' ); do clang-format-6.0 -style="`tr '\n' ' ' < $(TOOLS_DIR)/clang-format`" -i $$f; done


%.gen.h: %.h.gen
	$(PYTHON) $<

.PHONY: PYGEN
PYGEN: $(GEN_FILES)

%.o: %.c PYGEN
	$(CC) -c $(CFLAGS) $< -o $@

$(TARGET).elf: $(OBJ_FILES)
	$(CC) $(LDFLAGS) -o $@ $^

$(TARGET).hex: $(TARGET).elf
	avr-objcopy -j .text -j .data -O ihex $(TARGET).elf $(TARGET).hex
	avr-objcopy -j .eeprom --set-section-flags=.eeprom="alloc,load" --change-section-lma .eeprom=0 -O ihex $(TARGET).elf $(OBJ_DIR)/eeprom.hex