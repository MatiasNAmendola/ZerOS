CC=gcc
CFLAGS=-nostdinc -fomit-frame-pointer -Wall -fno-stack-protector -m32 -c -O3
AS=nasm
ASMFLAGS=-felf
LD=ld
LDFLAGS=-Tetc/linker.ld -m elf_i386 -o build/kernel.bin
SOURCES=bootstrap.asm string_asm.asm

all: $(SOURCES) link
	
%.asm:
	${AS} ${ASMFLAGS} -o build/$*.o ${shell find src/ | grep $*}

link:
	${LD} ${LDFLAGS} build/*.o
