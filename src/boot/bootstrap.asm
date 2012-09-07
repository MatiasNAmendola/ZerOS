BITS 32
global loader ; making entry point visible to linker
global magic ; we will use this in kmain
global mbd ; we will use this in kmain
 
extern kmain ; kmain is defined in kmain.cpp
 
; setting up the Multiboot header - see GRUB docs for details
MODULEALIGN equ 1<<0 ; align loaded modules on page boundaries
MEMINFO equ 1<<1 ; provide memory map
FLAGS equ MODULEALIGN | MEMINFO ; this is the Multiboot 'flag' field
MAGIC equ 0x1BADB002 ; 'magic number' lets bootloader find the header
CHECKSUM equ -(MAGIC + FLAGS) ; checksum required
 
section .text
 
align 4
    dd MAGIC
    dd FLAGS
    dd CHECKSUM
 
; reserve initial kernel stack space
STACKSIZE equ 0x4000 ; that's 16k.
 
loader:
    mov esp, stack + STACKSIZE ; set up the stack
    mov [magic], eax ; Multiboot magic number
    mov [mbd], ebx ; Multiboot info structure
    push ebx
 
    call kmain ; call kernel proper
 
    cli
.hang:
    hlt ; halt machine should kernel return
    jmp .hang
 
section .bss
 
align 4
magic: resd 1
mbd: resd 1
stack: resb STACKSIZE ; reserve 16k stack on a doubleword boundary
