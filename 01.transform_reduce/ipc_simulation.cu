#include "ipc_simulation.h"

#include <thrust/transform.h>
#include <thrust/execution_policy.h>

#include <cstdio>

template <class Space>
void advance_ipc()
{
        double min_dist2 = thrust::transform_reduce(
            thrust::device, thrust::make_counting_iterator<int>(0),
            thrust::make_counting_iterator<int>(2324), [=] __device__(int idx) { return 1.0; },
            1.0, thrust::minimum<double>());
        printf("!!!!!!! %d %.20f\n", 0, min_dist2);
}

template void advance_ipc<TestSpace>();
