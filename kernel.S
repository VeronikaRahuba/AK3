.syntax unified
.cpu cortex-m4
.thumb
       
#define A #1
#define B #2
#define C #3
#define cond #10

.global vtable_kernel
.global __kernel_reset__
       
.type vtable_kernel, %object
.type __kernel_reset__, %function
       
.section .interrupt_vector
vtable_kernel:
	.word __stack_start
	.word __kernel_reset__+1
	.size vtable_kernel, .-vtable_kernel
       
.section .rodata
	data: .asciz "kernel has started!\n"
	final: .asciz "result: "
.section .text
__kernel_reset__:
	ldr r0, =data
	bl dbgput_line
   
	mov r0, A
	mov r1, B
	mov r2, C
  
	sub r3, r0, r1
    	mov r8, 3
    	mul r4, r3, r8
   	mov r5, 1
    	lsl r6, r5, r2
   	add r5, r4, r6
   
	ldr r0, =final
	bl dbgput
	mov r0, r5
	bl dbgput_num
  
	end:
	b end
