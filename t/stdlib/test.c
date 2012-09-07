#include <stdlib.h>
#include <stdio.h>
#include "stdlib.h"

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
	int i=0, j=0;
	test("atoi", atoi_("12345") == 12345);
	test("atof", atof_("12345.1") == 12345.1);
	test("strtol", strtol_("12345") == 12345);
	test("abs", abs_(-1234) == 1234);
	return 0;
}

