#ifndef TEST_STRING_H
#define TEST_STRING_H

extern size_t strlen(const char *str);

extern int strcmp(const char *str1, const char *str2);

extern int strncmp(const char *str1, const char *str2, size_t num);

extern char *strcpy(char *dst, char *src);

extern char *strncpy(char *dst, char *src, size_t num);

extern void *memcpy(void *dst, const void *src, size_t num);

extern void *memmove(void *dst, const void *src, size_t num);

extern int memcmp(void *s, const void *ss, size_t num);

extern char *strcat(char *s, char *ss);

extern char *strncat(char *s, char *ss, size_t num);

extern char *strchr(char *s, int c);
#endif
