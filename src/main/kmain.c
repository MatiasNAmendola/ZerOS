#include "multiboot.h"

int kmain(struct multiboot_info *mbt)
{
	struct memory_map *mmap = (struct memory_map*)mbt->mmap_addr;
	while(mmap < mbt->mmap_addr + mbt->mmap_length)
		mmap = (struct memory_map*)((unsigned int)mmap + mmap->size + sizeof(unsigned int));
	return 0xDEADBABE;
}
