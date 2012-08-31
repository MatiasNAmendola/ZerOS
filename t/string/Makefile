CC=gcc
CFLAGS=-Wall -c -O3 -I../include/ -ggdb
SOURCES=strcmp.S strncmp.S strlen.S strcpy.S strncpy.S memcpy.S memmove.S memcmp.S strcat.S strncat.S strchr.S
all: ${SOURCES} bootstrap link clean
	
%.S:
	@echo "Compiling			\033[1m[ $* ]\033[0m"
	@${CC} ${CFLAGS} -o $*.o ../../src/string/$@

bootstrap:
	@echo "Compiling Boostrap..."
	@${CC} ${CFLAGS} -o main.o test.c

link:
	@echo "Linking..."
	@${CC} -otest *.o

clean:
	@rm *.o
