#include <stdlib.h>
#include <stdio.h>
#include "string.h"

int test_(const char *name, int expr)
{
	if(expr)
	{
		printf("[\033[35m%s\033[0m]\t\t\t[\033[1;32mPass\033[0m]\n", name);
		return 1;
	}
	else
	{
		printf("[\033[35m%s\033[0m]\t\t\t[\033[1;31mFail\033[0m]\n", name);
		return 0;
	}
}
#define test(x,y) i += test_(x,y); j++;
int main()
{
	int i=0,j=0;
	test("strlen", strlen("Hello") == 5);
	test("strcmp", strcmp("Hello","Hello") == 0);
	test("strncmp", strncmp("Hello","Hello",4) == 0);
	char *str = "Hello World!";
	char *str_ = (char *)malloc(sizeof(char)*strlen(str)+1);
	strcpy(str_, str);
	test("strcpy", strcmp(str, str_) == 0);
	free(str_);
	str_ = (char*)malloc(sizeof(char)*strlen(str)+1);
	memcpy(str_, str, strlen(str)+1);
	test("memcpy", strcmp(str, str_) == 0);
	char str__[] = "memmove can be very useful......";
	memmove(str__+20,str__+15,11);
 	test("memmove", strcmp(str__, "memmove can be very very useful.") == 0);
	test("memcmp", memcmp("Hello World!", "Hello World!", strlen("Hello World!")) == 0);
	char strr[10] = "Hello";
	char strrr[10] = " World!";
	strcat(strr, strrr);
	test("strcat", strcmp(strr, "Hello World!") == 0);

	char strrrr[10] = "Hello";

	strncat(strrrr, strrr, strlen(strrr)-1);
	test("strncat", strcmp(strrrr, "Hello World") == 0);
	test("strchr", strchr("Hello World!", ' ') == 5);
	return 0;

}

