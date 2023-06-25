#include "ipc_simulation.h"

#include <thrust/transform.h>
#include <thrust/execution_policy.h>

using namespace phyverse;

int main(int argc, char* argv[])
{
    double min_y = thrust::transform_reduce(
            thrust::device, thrust::make_counting_iterator<int>(0),
            thrust::make_counting_iterator<int>(2023), [=] __device__(int idx) { return 11.0; },
            12., thrust::minimum<double>());

    advance_ipc<TestSpace>();
    return 0;
}
