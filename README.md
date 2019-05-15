# 8086 Assembly 
This is my assignment of IS224 in SJTU.

## 1. Quick Sort
Implementation is shown in *quick_sort.asm* with detailed annotation.
I also implemented this algorithm with C in *quicksort.cpp*.

#### Description
The heart of quickSort is the **partition** algorithm. And I offered two ways to implement **partition** in C, which are in function <code>divide()</code> and <code>partition()</code>. <code>divide()</code> is faster but harder to implement in Assembly because there are many loops. <code>partition()</code> is easier to implement in Assembly, which is used in my *quick_sort.asm*.

#### Hot to Use
Download **EMU8086** [here](https://emu8086-microprocessor-emulator.en.softonic.com/). And *quick_sort.asm* can be run in **EMU8086**. It may take a while if you sort an array of length 50. You can change numbers to sort in the following part. Don't forget to change the value of r, which is *the length of array - 1*.

<code>;-----------------------------------------
; array of 50 integers
arr dw 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15, -16, -17, -18, -19, -20, -21, -22, -23, -24, -25
;-----------------------------------------
i   dw  ?                           ; for loop
j   dw  ?                           ; for loop
p   dw  0                           ; start of the array (0)
r   dw  49                          ; end of the array (length - 1)
q   dw  ?                           ; store the partition return
x   dw  ?                           ; x is used in partition
</code>


## TODO :triangular_flag_on_post:
* [ ] implement <code>divide()</code> in assembly.





