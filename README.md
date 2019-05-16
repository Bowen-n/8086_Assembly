# 8086 Assembly 
This is my assignment of IS224 in SJTU.

## 1. Quick Sort
Implementation is shown in *quick_sort.asm* with detailed annotation.
I also implemented this algorithm in C and Python. See *quicksort.cpp* and *quicksort.py* for details.

### Description
The heart of quickSort is the **partition** algorithm. And I offered two ways to implement **partition** in C, which are in function <code>divide()</code> and <code>partition()</code>. <code>divide()</code> is faster but harder to implement in Assembly because there are many loops. <code>partition()</code> is easier to implement in Assembly, which is used in my *quick_sort.asm*.

### Hot to Use
Download **EMU8086** [here](https://emu8086-microprocessor-emulator.en.softonic.com/). And *quick_sort.asm* can be run in **EMU8086**. It may take a while if you sort an array of length 50. You can change numbers to sort in the following part. Don't forget to change the value of r, which is *the length of array - 1*.

<code>;-----------------------------------------</code><br>
<code>; array of N integers</code><br>
<code>arr dw ;N integers</code><br>
<code>;-----------------------------------------</code><br>
<code>i   dw  ?                           ; for loop</code><br>
<code>j   dw  ?                           ; for loop</code><br>
<code>p   dw  0                           ; start of the array (0)</code><br>
<code>r   dw  N-1                         ; end of the array (length - 1)</code><br>
<code>q   dw  ?                           ; store the partition return</code><br>
<code>x   dw  ?                           ; x is used in partition</code><br>


## TODO :triangular_flag_on_post:
* [ ] implement <code>divide()</code> in assembly.





