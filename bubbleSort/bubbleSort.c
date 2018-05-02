#include<stdio.h>

//void bubblesort(long long int A[],long long int n);
extern void bubblesort(long long int A[],long long int n);

int main(){
	
	long long int A[]={10,9,1,7,6,5};
	long long int n = sizeof(A)/sizeof(A[1]);
	//printf("n=%lld",n);
	bubblesort(A,n);
	
	long long int i;
	for(i=0;i<n;i++)
		{printf("A[%lld]=%lld\n",i,A[i]);}

	return 0;
}



/*void bubblesort(long long int A[],long long int n){
long long int k,i,temp;
	for (k=1;k<=n-1;k++)
		{
		long long int flag=0;
		
		for(i=0;i<=(n-k-1);i++)
			{
			
			if(A[i]>A[i+1])
				{
				temp=A[i+1];
				A[i+1]=A[i];
				A[i]=temp;
				flag=1;
				}
			
			}
			
		if(flag==0)
			break;	

		}


}*/
