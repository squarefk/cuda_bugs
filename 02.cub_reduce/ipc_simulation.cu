#include "ipc_simulation.h"

#include <thrust/transform.h>
#include <thrust/execution_policy.h>

#include <cstdio>
#include <vector>

void advance_ipc()
{
    double* d_in;
    double* d_out;
    cudaMalloc(&d_in, 2324*sizeof(double)); 
    cudaMalloc(&d_out, sizeof(double));

    std::vector<double> h_in(2324, 11.);
    cudaMemcpy(d_in, h_in.data(), 2324 * sizeof(double), cudaMemcpyHostToDevice);

    size_t temp_storage_bytes;
    cub::DeviceReduce::Reduce(nullptr, temp_storage_bytes, d_in, d_out, 2324, cub::Min(), 11.);

    double* temp_storage;
    cudaMalloc(&temp_storage, temp_storage_bytes*sizeof(double)); 

    double result;
    cub::DeviceReduce::Reduce(
        temp_storage, temp_storage_bytes, d_in, d_out, 2324, cub::Min(), 11.);
    cudaMemcpy(&result, d_out, sizeof(double), cudaMemcpyDeviceToHost);

    printf("!!!!!!! %.20f\n", result);
}

