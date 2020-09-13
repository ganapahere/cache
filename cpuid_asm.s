.section .text
.globl cpuid_asm
.type cpuid_asm, @function

cpuid_asm:
    pushl   %ebp
    movl    %esp, %ebp

    movl    $2, %eax
    cpuid

    movl    %eax, %esi
    movl    8(%ebp), %eax
    movl    %esi, (%eax)

    movl    12(%ebp), %eax
    movl    %ebx, (%eax)

    movl    16(%ebp), %eax
    movl    %ecx, (%eax)

    movl    20(%ebp), %eax
    movl    %edx, (%eax)

    popl    %ebp
    ret
