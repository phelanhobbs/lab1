hello.txt:
	echo "hello world!" > hello.txt

CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as
LD=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-ld
SRC=main.c second.c
OBJS=$(patsubst %.c,%.o,$(SRC))

all: firmware.elf

firmware.elf: $(OBJS)
	$(LD) -o $@ $^

main.i: main.c
	$(CPP) main.c > main.i

main.s: main.i
	$(CC) -S main.i

main.o: main.s
	$(AS) main.s -o main.o	

%.i: %.c
	$(CPP) $< > $@

%.s: %.i
	$(CC) $< -S $@

%.o: %.s
	$(AS) $< -o $@

clean: 
	rm -f *.i *.s *.o *.elf hello.txt

.PHONY: clean all
