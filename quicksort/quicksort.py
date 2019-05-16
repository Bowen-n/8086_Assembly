#!/usr/bin/env python
# -*- coding: utf-8 -*-
#==========================================
#  Wish You Good Luck.
#
#  file name: quicksort.py
#  author: Bolun Wu
#  email: bowenwu@sjtu.edu.cn
#  created date: 2018/05/16
#  description: quick sort in python
#
#==========================================


def partition(a, low, high):
    k = a[low]

    while low != high:
        while low<high and a[high] >= k:
            high -= 1
        if low<high:
            a[low] = a[high]
            low += 1
        while low<high and a[low] <=k:
            low += 1
        if low<high:
            a[high] = a[low]
            high -= 1
    
    a[low] = k
    return low


def quickSort(a, low, high):
    if low >= high:
        return
    mid = partition(a, low, high)
    quickSort(a, low, mid-1)
    quickSort(a, mid+1, high)



def main():
    a = [4, 3, 10, 8, 6, 1, 0]
    size = len(a)
    print('unsort:{}'.format(a))
    quickSort(a, 0, size-1)
    print('sortted:{}'.format(a))


if __name__ == '__main__':
    main()
    