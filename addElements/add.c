#include<stdio.h>
extern long long int sum(long long int a,long long int b);
int main()
{
	long long int a,b,c;
	a=10;
	b=5;
	c=sum(a,b);
	printf("c=%lld",c);
	return 0;
}
