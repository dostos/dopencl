rm -R build

mkdir build \
    && cd build \
    && cmake CMAKE_BUILD_TYPE=Release -B ./ -S ../  \
    && make -j8 \
    && make install 

export LD_LIBRARY_PATH="/usr/local/lib/:${LD_LIBRARY_PATH}"
export LD_PRELOAD="$LD_PRELOAD libdOpenCL.so"

echo localhost >> dcl.nodes

build/daemon/dcld localhost -p "NVIDIA CUDA"