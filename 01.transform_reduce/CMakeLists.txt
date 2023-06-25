set(CMAKE_CUDA_COMPILER /usr/local/cuda/bin/nvcc)
set(CMAKE_CUDA_ARCHITECTURES 75)
project(houdini_plugin LANGUAGES CXX CUDA)
find_package(CUDA QUIET REQUIRED)

function(set_up_gpu_compilation TARGET)
    target_compile_options(${TARGET} PUBLIC
        "$<$<COMPILE_LANGUAGE:CUDA>:SHELL:--extended-lambda>"
    )
endfunction()

add_library(phyverse_core_gpu SHARED ipc_simulation.cu)
set_up_gpu_compilation(phyverse_core_gpu)

add_executable(ipc_gpu ipc.cu)
set_property(SOURCE ipc.cu PROPERTY LANGUAGE CUDA)
target_link_libraries(ipc_gpu PUBLIC phyverse_core_gpu)
set_up_gpu_compilation(ipc_gpu)
