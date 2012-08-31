#ifndef STRING_H
#define STRING_H

typedef unsigned int size_t;

void *memset(void *ptr, int value, size_t num);

void *memcpy(void *dst, const void *src, size_t num);

void *memmove(void *dst, const void *src, size_t num);

char *strcpy(char *dst, const char *src);

char *strncpy(char *dst, char *src, size_t len);

char *strcat(char *dst, const char *src);

char *strncat(char *dst, char *src, size_t len);

int memcmp(const void *ptr, const void *ptr_, size_t num);

int strcmp(const char *str1, const char *str2);

int strncmp(const char *str, const char *str_, size_t num);

int strcoll(const char *str, const char *str_);

size_t strxfrm(char *dst, const char *src, size_t num);

#ifdef CONST_MEMCHR
const void *memchr(const void *ptr, int value, size_t num);
#else
void *memchr(void *ptr, int value, size_t num);
#endif //CONST_MEMCHR

#ifdef CONST_STRCHR
const char *strchr(const char *str, int character);
#else
char *strchr(char *str, int character);
#endif //CONST_STRCHR

size_t strcspn(const char *str, const char *str_);

#ifdef CONST_STRPBRK
const char *strpbrk(const char *str, const char *str2); 
#else
char *strpbrk(char *str, const char *str2);
#endif //CONST_STRPBRK

#ifdef CONST_STRRCHR
const char *strrchr(const char *str, int character);
#else
char *strrchr(char *str, int character);
#endif //CONST_STRRCHR

size_t strspn(const char *str, const char *str_);

#ifdef CONST_STRSTR
const char *strstr(const char *str, const char *str_);
#else
char *strstr(char *str, const char *str_);
#endif //CONST_STRSTR

char *strtok(char *str, const char *delimiters);

char *strerror(int errno);

size_t strlen(const char *str);

#ifndef NULL
#define NULL (void*)0
#endif //NULL

#endif //STRING_H
