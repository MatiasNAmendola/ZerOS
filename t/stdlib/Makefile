CC=gcc
CFLAGS=-Wall -c -ggdb -O0 -I../include/ -DTEST
SOURCES=atoi.S atof.c strtol.S abs.S 
all: ${SOURCES} bootstrap link
	
%.S:
	@echo "Compiling			\033[1m[ $* ]\033[0m"
	@${CC} ${CFLAGS} -o $*.o ../../src/stdlib/$@

%.c:
	@echo "Compiling			\033[1m[ $* ]\033[0m"
	@${CC} ${CFLAGS} -o $*.o ../../src/stdlib/$@

bootstrap:
	@echo "Compiling Boostrap..."
	@${CC} ${CFLAGS} -o main.o test.c

link:
	@echo "Linking..."
	@${CC} -pg -otest *.o

clean:
	@rm *.o
