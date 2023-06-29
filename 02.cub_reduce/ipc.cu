#include "ipc_simulation.h"

#include <thrust/transform.h>
#include <thrust/execution_policy.h>
#include <vector>

int main()
{
    double* d_in;
    double* d_out;
    cudaMalloc(&d_in, 2023*sizeof(double)); 
    cudaMalloc(&d_out, sizeof(double));

    std::vector<double> h_in(2023, 11.);
    cudaMemcpy(d_in, h_in.data(), 2023 * sizeof(double), cudaMemcpyHostToDevice);

    size_t temp_storage_bytes;
    cub::DeviceReduce::Reduce(nullptr, temp_storage_bytes, d_in, d_out, 2023, cub::Min(), 12.);

    double* temp_storage;
    cudaMalloc(&temp_storage, temp_storage_bytes*sizeof(double)); 

    double result;
    cub::DeviceReduce::Reduce(
        temp_storage, temp_storage_bytes, d_in, d_out, 2023, cub::Min(), 12.);
    cudaMemcpy(&result, d_out, sizeof(double), cudaMemcpyDeviceToHost);

    advance_ipc<TestSpace>();
    return 0;
}
