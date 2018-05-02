#include<stdio.h>

extern long long int smallerElement (long long int a, long long int b);
//long long int smallerElement (long long int a, long long int b);
int main(){
	
	long long int a=15;
	long long int b=8;
	long long int c;
	
	c=smallerElement(a,b);
	printf("Smaller Element is %lld\n",c);

}
/*
long long int smallerElement(long long int a, long long int b){
	if (a>b)
		return b;
	else
		return a;
}*/
