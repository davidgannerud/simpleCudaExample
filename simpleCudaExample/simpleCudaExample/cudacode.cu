#include "cudacode.h"
#include "cuda.h"
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <cstdlib>

#define NUM_BLOCKS 16
#define BLOCK_WIDTH 16

__global__ void hello()
{
	printf("Hello world! I'm a thread %d in block %d\n", threadIdx.x, blockIdx.x);
}

void runCudaCode(void)
{
	// launch the kernel
	hello <<<NUM_BLOCKS, BLOCK_WIDTH>>>();

	// force the printf()s to flush
	cudaDeviceSynchronize();

	printf("That's all!\n");
}
