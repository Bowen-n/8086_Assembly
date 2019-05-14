# 8086 Assembly 
This is my assignment of IS224 in SJTU.

## 1. Quick Sort
Implementation is shown in *quick_sort.asm* with detailed annotation.
I also implemented this algorithm with C in *quicksort.cpp*.

#### Description
The heart of quickSort is the **partition** algorithm. And I offered two ways to implement **partition** in C, which are in function <code>divide()</code> and <code>partition()</code>. <code>divide()</code> is faster but harder to implement in Assembly because there are many loops. <code>partition()</code> is easier to implement in Assembly, which is used in my *quick_sort.asm*.

#### Hot to Use
Download **EMU8086** [here](https://emu8086-microprocessor-emulator.en.softonic.com/). And *quick_sort.asm* can be run in **EMU8086**.



## TODO :triangular_flag_on_post:
* [ ] implement <code>divide()</code> in assembly.




