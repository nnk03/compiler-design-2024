#include<stdio.h>
#include<stdbool.h>
#include<stdlib.h>

int x;
int y;
int z;

int main(){
	x = 5;
	y =  7;
	z = x || y;

	printf("%d \n", z);
	return 0;
}



