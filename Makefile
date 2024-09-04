hello.txt:
	echo "hello world!" > hello.txt

CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as

main.i: main.c
	$(CPP) main.c > main.i	

clean: 
	rm -f main.i hello.txt

.PHONY: clean
