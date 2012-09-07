ifdef ${ARCH}
else
ARCH=32
endif
	
CC=gcc
CFLAGS=-nostdinc -fomit-frame-pointer -Wall -Iinclude/ -fno-stack-protector -m${ARCH} -c -O3
ASM=nasm
ASMFLAGS=-felf${ARCH}
AS=gcc
ASFLAGS=${CFLAGS}
LD=ld
ifeq (${ARCH}, 32)
LDFLAGS=-Tetc/linker.ld -m elf_i386 -o build/kernel.bin
else
LDFLAGS=-Tetc/linker.ld -m elf_x86_64 -o build/kernel.bin
endif
SOURCES=bootstrap.asm string.S kmain.c 

all: $(SOURCES) link
	
%.asm:
	${ASM} ${ASMFLAGS} -o build/$*.o ${shell find -name $@ }

%.S:
	${AS} ${ASFLAGS} -o build/$*.o ${shell find -name $@}

%.c:
	${CC} ${CFLAGS} -o build/$*.o ${shell find -name $@}

clean:
	@rm -rf build/*

link:
	${LD} ${LDFLAGS} build/*.o
