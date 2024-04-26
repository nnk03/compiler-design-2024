#include<stdio.h>
#include<stdbool.h>
#include<stdlib.h>

int i;
int x[10];

int main(){

	for(i = 0; i < 10; i = i + 1){
		// x[5 + 4] = i;
		// i = x[i + 2 * i + i];
		// printf("%d %d\n", i, x[i]);
		x[i] = i;
		if(i > 5){
			i = i;
			break;
		}
	}
	return 0;
}



