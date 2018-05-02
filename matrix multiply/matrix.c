//Matrix Multiplier


#include <stdio.h>
extern void mm(long long A[], long long B[], long long C[], 
               long long M, long long N, long long P);

int main()
{
  long long int M, N, P;

  M = 2; 
  N = 3;
  P = 2; 

  long long int A[] = {1,2,3,4,5,6};
  long long int B[] = {7,1,8,1,9,1};
  long long int Casm[] = {0,0,0,0};
 

  mm(A,B,Casm,M,N,P);

  printf("Casm[0] = %lld \n",Casm[0]);
  printf("Casm[1] = %lld \n",Casm[1]);
  printf("Casm[2] = %lld \n",Casm[2]);
  printf("Casm[3] = %lld \n",Casm[3]);
}

/*
void mm_c(long long A[][N], long long B[][P], long long C[][P], 
               long long M, long long N, long long P)
{
  long long int i, j, k;
  long long int temp;

  for(k=0;k<P;k++)
    for(i=0;i<M;i++)
    {
      temp = 0;
      for(j=0;j<N;j++)
      {
        temp = A[i][j]*B[j][k] + temp;
      }
      C[i][k] = temp;
    }

} */
