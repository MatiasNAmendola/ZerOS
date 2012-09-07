#ifndef TEST_STRING_H
#define TEST_STRING_H

extern size_t strlen_(const char *str);

extern int strcmp_(const char *str1, const char *str2);

extern int strncmp_(const char *str1, const char *str2, size_t num);

extern char *strcpy_(char *dst, char *src);

extern char *strncpy_(char *dst, char *src, size_t num);

extern void *memcpy_(void *dst, const void *src, size_t num);

extern void *memmove_(void *dst, const void *src, size_t num);

extern int memcmp_(void *s, const void *ss, size_t num);

extern char *strcat_(char *s, char *ss);

extern char *strncat_(char *s, char *ss, size_t num);

extern char *strchr_(char *s, int c);

extern char *memchr_(char *s, int d, int num);

extern int strcspn_(const char *s, const char *ss);

extern char *strrchr_(const char *s, int x);

extern void *memset_(void *ptr, int value, unsigned int num);

extern char *strpbrk_(char *c, const char *ss);

extern size_t strspn_(const char *s, const char *ss);
#endif
