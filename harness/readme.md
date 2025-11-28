steps to run harness on libtiff

first build libtiff:
* cd build
* export CC=/AFLplusplus/afl-clang-fast
* export CXX=/AFLplusplus/afl-clang-fast++
* cmake -DCMAKE_C_COMPILER="$CC" -DCMAKE_CXX_COMPILER="$CXX" \
      -DCMAKE_C_FLAGS="-g -O0" -DCMAKE_CXX_FLAGS="-g -O0" -DBUILD_SHARED_LIBS=OFF ..
* make

then this is for the harness:
* cd ..
* afl-clang-fast -fsanitize=fuzzer \
    -I/src/libtiff -I/src/build/libtiff \
    harness/harness.c \
    /src/build/libtiff/libtiff.a \
    -lz -lm \
    -o harness_bin

run harness:
* afl-fuzz -i seeds -o findings -- ./harness_bin @@
