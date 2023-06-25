set(CMAKE_CUDA_COMPILER /usr/local/cuda/bin/nvcc)
set(CMAKE_CUDA_ARCHITECTURES 75)
project(houdini_plugin LANGUAGES CXX CUDA)
find_package(CUDA QUIET REQUIRED)

add_executable(ipc_gpu ipc.cu)
set_property(SOURCE ipc.cu PROPERTY LANGUAGE CUDA)

