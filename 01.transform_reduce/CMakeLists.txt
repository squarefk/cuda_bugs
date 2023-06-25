set(CMAKE_CUDA_COMPILER /usr/local/cuda/bin/nvcc)
set(CMAKE_CUDA_ARCHITECTURES 75)
project(houdini_plugin LANGUAGES CXX CUDA)
find_package(CUDA QUIET REQUIRED)

add_compile_options(--extended-lambda)

add_library(phyverse_core_gpu SHARED ipc_simulation.cu)

add_executable(ipc_gpu ipc.cu)
target_link_libraries(ipc_gpu PUBLIC phyverse_core_gpu)
