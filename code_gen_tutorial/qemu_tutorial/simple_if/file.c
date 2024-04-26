#include<stdio.h>
#include<stdbool.h>
#include<stdlib.h>

bool x;

int main(){
	x = true;
	if(x){
		x = false;
	}
	else{
		x = true;
	}
	printf("%d \n", x);
}



