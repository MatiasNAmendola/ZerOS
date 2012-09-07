CC=gcc
CFLAGS=-Wall -c -ggdb -O3 -I../include/ -DTEST
SOURCES= strspn.S strcmp.S strncmp.S strlen.S strcpy.S strncpy.S memset.S memchr.S memcpy.S memmove.S memcmp.S strcat.S strncat.S strchr.S strcspn.S strrchr.S strpbrk.S
all: ${SOURCES} bootstrap link
	
%.S:
	@echo "Compiling			\033[1m[ $* ]\033[0m"
	@${CC} ${CFLAGS} -o $*.o ../../src/string/$@

bootstrap:
	@echo "Compiling Boostrap..."
	@${CC} ${CFLAGS} -o main.o test.c

link:
	@echo "Linking..."
	@${CC} -pg -otest *.o

clean:
	@rm *.o
