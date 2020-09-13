#Referece:
#Intel® 64 and IA-32 ArchitecturesSoftware Developer’s Manual - Volume 2 (2A, 2B, 2C & 2D):Instruction Set Reference, A-Z
#Table 3-8.  Information Returned by CPUID Instruction - p293 (3 - 191), p136
#output:
#cpuid = 0x76036301       0xf0b5ff        0x0     0xc10000
#01: ignore
#63: Data TLB: 2 MByte or 4 MByte pages, 4-way set associative, 32 entries and a separate array with 1 GByte pages, 4-way set associative, 4 entries 
#03: Data TLB: 4 KByte pages, 4-way set associative, 64 entries
#76: Instruction TLB: 2M/4M pages, fully associative, 8 entries


#build:
#as -o cpuid.o cpuid.s
#ld -o cpuid.out cpuid.o -e main -lc -dynamic-linker /lib/ld-linux.so.2
.section .rodata
    msgP1:
    .string "cpuid = 0x%x \t 0x%x \t 0x%x \t 0x%x\n"

.section .text
.globl main
.type main, @function

main:
    pushl   %ebp
    movl    %esp, %ebp


    mov     $2, %eax
    cpuid

#print:
    pushl   %edx
    pushl   %ecx
    pushl   %ebx
    pushl   %eax
    pushl   $msgP1
    call    printf
    addl    $8, %esp

    pushl   $0
    call    exit
