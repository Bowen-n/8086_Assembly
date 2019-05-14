/***********************************
  Wish You Good Luck.

  file name: quicksort.cpp
  author: Bolun Wu
  email: bowenwu@sjtu.edu.cn
  created date: 2018/05/12
  description: quick sort in C++

***********************************/



# include <iostream>
using namespace std;

int divide(int*, int, int);      // divide
void quickSort(int*, int, int);  // package
void quickSort(int*, int);       // API

void quickSort(int a[], int low, int high)
{
	if (low >= high)return;
	int mid;
	mid = divide(a, low, high);
	quickSort(a, low, mid - 1);
	quickSort(a, mid + 1, high);
}

int divide(int a[], int low, int high)
{
	int k = a[low];

	do {
		while (low < high && a[high] >= k) --high;
		if (low < high) { a[low] = a[high]; ++low; }
		while (low < high && a[low] <= k) ++low;
		if (low < high) { a[high] = a[low]; --high; }
	} while (low != high);

	a[low] = k;
	return low;
}

// same function as divide()
// easier to implement in 8086 assembly language.
// but slower than divide()
/* 
int partition(int a[], int low, int high )    {
    int x = a[high];
    int i = low - 1;

    for (int j=low; j<high; j++) {
        if (a[j] <= x)  {
            i += 1;

            int tmp = a[i];
            a[i] = a[j];
            a[j] = tmp;
        }
    }

    int tmp = a[i+1];
    a[i+1] = a[high];
    a[high] = tmp;

    return (i+1);
}
*/

void quickSort(int a[], int size)
{
	quickSort(a, 0, size - 1);
}

// test
int main()
{
	int a[7] = { 4, 3, 10, 8, 6, 1, 0 };
	quickSort(a, 7);
	for (int i = 0; i < 7; i++)
		cout << a[i] << ",";
	return 0;
}