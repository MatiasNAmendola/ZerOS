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
	test("strlen", strlen_("Hello") == 5);
	
	test("strcmp", strcmp_("Hello","Hello") == 0);
	test("strncmp", strncmp_("Hello","Hello",4) == 0);
	char *str = "Hello World!";
	char *str_ = (char *)malloc(sizeof(char)*strlen_(str)+1);
	strcpy_(str_, str);
	test("strcpy", strcmp_(str, str_) == 0);
	free(str_);
	str_ = (char*)malloc(sizeof(char)*strlen_(str)+1);
	memcpy_(str_, str, strlen_(str)+1);
	test("memcpy", strcmp_(str, str_) == 0);
	char str__[] = "memmove can be very useful......";
	memmove_(str__+20,str__+15,11);
 	test("memmove", strcmp_(str__, "memmove can be very very useful.") == 0);
	test("memcmp", memcmp_("Hello World!", "Hello World!", strlen_("Hello World!")) == 0);
	char strr[10] = "Hello";
	char strrr[10] = " World!";
	strcat_(strr, strrr);
	test("strcat", strcmp_(strr, "Hello World!") == 0);

	char strrrr[10] = "Hello";

	strncat_(strrrr, strrr, strlen_(strrr)-1);
	test("strncat", strcmp_(strrrr, "Hello World") == 0);
	test("strchr", strcmp_(strchr_("Hello World!", ' ')," World!") == 0);
	test("memchr", strcmp_(memchr_("Hello World!", ' ', 7), " World!") == 0);
	test("strcspn", strcspn_("Hello World!", "aeiou") == 1);
	test("strrchr", strcmp_(strrchr_("Hello World!", 'l'), "ld!") == 0);
	char *sstr_ = malloc(sizeof(char)*strlen_("almost every programmer should know memset!"));
	strcpy_(sstr_, "almost every programmer should know memset!");
	test("memset", strcmp_(memset_(sstr_,'-',6), "------ every programmer should know memset!") == 0);
	test("strpbrk", strcmp_(strpbrk_(sstr_, " "), " every programmer should know memset!") == 0);
	test("strspn", strspn_("Hiya Werld", "yaeiou") == 3);
	return 0;
}

