#ifdef TEST
double atof_(char *s)
#else
double atof(char *s)
#endif
{
	double f = 0.0;
	int i = 0;
	while(*s >= '0' && *s <= '9')
	{
		f *= 10;
		i++;
		f += (*s++ - '0');
	}
	if(*s == '.')
		s++;
	else
		return f;
	while(*s >= '0' && *s <= '9')
	{
		f *= 10;
		f += (*s++ - '0');
	}
	while(i--)
		f *= 0.1;
	return f;
}
