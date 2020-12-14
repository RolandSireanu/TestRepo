#include <iostream>
#include <math.h>



__global__
void add(int n , float* x , float* y)
{
	for(int i = 0; i < n; i++)
	{
		y[i] = x[i] + y[i];
	}
}


int main()
{

	int nr = 1 << 24; // 1 million elements

	//float* a = new float[nr];
	//float* b = new float[nr];
	float *a , *b;

	cudaError_t err = cudaMallocManaged(&a , nr*sizeof(float));
	if(err != cudaError::cudaSuccess)
		std::cout << err <<std::endl;
	cudaMallocManaged(&b , nr*sizeof(float));

	
	
	for(int i = 0; i < nr/2; i++)
	{
		a[i] = 3.0f;
		b[i] = 2.0f;
	}
	
	
	std::cout<<"A"<<std::endl;

	add<<<1 , 1>>>(nr,a,b);

	cudaDeviceSynchronize();

	float maxErr = 0.0f;
	for(int i = 0; i<nr; i++)
	{
		maxErr = fmax(maxErr, fabs(b[i]-5.0f));		
	}
	
	std::cout << "Max error = " << maxErr << std::endl;

	//delete[] a;
	cudaFree(a);
	//delete[] b;
	cudaFree(b);


	return 0;
}
