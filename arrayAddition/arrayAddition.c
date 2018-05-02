#include<stdio.h>

extern void arrayAddition(long long int a[],long long int b[], long long intc[],long long int n);

int main(){

	long long int a[] = {1,2,3,4};
	long long int b[] = {5,6,7,8};
	long long int c[] = {0,0,0,0};
	
	long long length=sizeof(a);

	arrayAddition(a,b,c,length/8);
	for(int i=0;i<length/8;i++)
	{
	printf("c [%d] = %lld ",i,c[i]);
	} 
	

	

}
