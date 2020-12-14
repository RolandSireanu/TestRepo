#include <iostream>
#include <math.h>




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

	float* a = new float[nr];
	float* b = new float[nr];
	
	for(int i = 0; i < nr; i++)
	{
		a[i] = 6342.1123f;
		b[i] = 321.991f;
	}


	add(nr,a,b);

	float maxErr = 0.0f;
	for(int i = 0; i<nr; i++)
	{
		maxErr = fmax(maxErr, fabs(b[i]-5.0f));		
	}
	
	std::cout << "Max error = " << maxErr << std::endl;

	delete[] a;
	delete[] b;


	return 0;
}
