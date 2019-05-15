;
;======================================
;  Wish You Good Luck.
;
;  file name: quick_sort.asm
;  author: Bolun Wu
;  email: bowenwu@sjtu.edu.cn
;  created date: 2018/05/12
;  description: quick sort in 8086
;
;=======================================

data_seg segment

    ;-----------------------------------------
    ; array of 50 integers
    arr dw 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15, -16, -17, -18, -19, -20, -21, -22, -23, -24, -25
    ; arr dw 3, 2, 1, 0, -1, -2, -3
    ;-----------------------------------------

    i   dw  ?                           ; for loop
    j   dw  ?                           ; for loop
    p   dw  0                           ; start of the array (0)
    r   dw  49                          ; end of the array (length - 1)
    q   dw  ?                           ; store the partition return
    x   dw  ?                           ; x is used in partition

data_seg ends

stack_seg segment

    stk db  100  dup(0)
    top equ 100

stack_seg ends

code_seg segment

    assume cs: code_seg, ds: data_seg, ss:stack_seg

    start:

        ; initialize data segment
        mov  ax, data_seg
        mov  ds, ax
        mov  ax, stack_seg
        mov  ss, ax
        mov  sp, top

        ; quicksort(array, 0, size-1);
        call quicksort

        ; quit();
        mov  ax, 4c00h
        int  21h
                  
                                  
        quicksort proc
            
        ;---------------C language--------------- 
        ;
        ; void quicksort(int a[], int p, int r)
        ; {
        ;    if (p>=r) return;    
        ;
        ;    int q = partition(a, p, r);
        ;    quicksort(a, p, q-1);
        ;    quicksort(a, q+1, r);
        ; }                
        ;
        ;-----------------------------------------
        
            ; compare p with r
            mov  ax, p 
            cmp  ax, r                  ; compare p with r
            jge  finished               ; if p>=r, done!

            ; call partition(a, p, r), return value is in AX.
            call partition

            ; get q = partition(a, p, r)
            mov  q, ax

            ; push q+1, r to stack
            inc  ax                     ; ++ ax
            push ax                     ; ax = q + 1
            push r

            ; call quicksort(a, p, q-1)
            mov  ax, q
            mov  r, ax
            dec  r                      ; r = q - 1
            call quicksort

            ; call quicksort(a, p+1, r)
            pop  r                      ; r = r
            pop  p                      ; p = q + 1
            call quicksort 

            ; sort is finished.
            finished:
                ret

        quicksort endp    
        
        
        partition proc   
                                        
        ;-----------------C language--------------   
        ;
        ; int partition(int a[], int p, int r) 
        ; {
        ;     int x = a[r];
        ;     int i = p - 1;  
        ;
        ;     for (j=p; j<=r-1; j++)
        ;     {
        ;         if(a[j] <= x)
        ;         {
        ;             i = i + 1;
        ;             // exchange a[i] with a[j]
        ;             int tmp = a[i];
        ;             a[i] = a[j];
        ;             a[j] = tmp; 
        ;         }
        ;     }
        ;
        ;     // exchange A[i+1] with A[r]
        ;     int tmp = a[i+1];
        ;     a[i+1] = a[r];
        ;     a[r] = tmp;
        ;
        ;     return i+1;
        ; }       
        ;
        ;------------------------------------------

        

            ; x = arr[r]
            mov  si, offset arr
            mov  ax, r
            shl  ax, 1                  ; r *= 2, since every number occupies 2 bytes
            add  si, ax
            mov  ax, [ si ]             ; AX = arr[r]
            mov  x,  ax                 ; x = arr[r]

            ; i = p - 1
            mov  ax, p                  ; AX = p
            mov  i,  ax                 ; i = p
            dec  i                      ; i = p-1

            ; initialize j = p
            mov  ax, p
            mov  j,  ax

            ; loop j in (p:r-1)
            for_j:

                ; get arr[j]
                mov  si, offset arr
                mov  ax, j
                shl  ax, 1              ; j *= 2, every number occupies 2 bytes
                add  si, ax             ; SI = &arr[j]
                mov  ax, [ si ]         ; AX = arr[j]

                ; compare a[j] with x
                cmp  ax, x
                jg   nextloop            ; if a[j] > x, no exchange
                                        ; else, exchange a[i] with a[j]
                inc  i                  ; i += 1
                
                ; get arr[i]
                mov  di, offset arr
                mov  cx, i
                shl  cx, 1              ; i *= 2, every number occupies 2 bytes
                add  di, cx             ; DI = &arr[i]
                mov  cx, [ di ]         ; CX = arr[i]

                ; exchange
                mov  [ di ], ax
                mov  [ si ], cx
            
                ; to next loop ( operate j++ and j<r )
                nextloop:

                    inc  j              ; j += 1
                    mov  ax, r
                    cmp  j,  ax         ; compare
                    jl   for_j          ; if j < r, to next loop

            ; get arr[i+1]
            inc  i
            mov  si, offset arr
            mov  ax, i
            shl  ax, 1                  ; (i+1) *= 2, every number occupies 2 bytes
            add  si, ax                 ; SI = &arr[i+1]
            mov  ax, [ si ]             ; AX = arr[i+1]

            ; get arr[r]
            mov  di, offset arr
            mov  cx, r
            shl  cx, 1                  ; r *= 2, every number occupies 2 bytes
            add  di, cx                 ; DI = &arr[r]
            mov  cx, [ di ]             ; CX = arr[r]

            ; exchange a[i+1] with a[r]
            mov  [ di ], ax
            mov  [ si ], cx  

            ; return i+1 (stored in AX)
            mov  ax, i
            ret

        partition endp
    
code_seg ends

    end start