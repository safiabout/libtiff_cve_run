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

CVE 2017
```
Starting program: /src/harness_bin findings_cve_2017/default/crashes/id:000000,sig:11,src:000271,time:24595,execs:69414,op:quick,pos:132,val:+2
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
Reading 260 bytes from findings_cve_2017/default/crashes/id:000000,sig:11,src:000271,time:24595,execs:69414,op:quick,pos:132,val:+2

Program received signal SIGSEGV, Segmentation fault.
0x0000555555594245 in TIFFPrintDirectory (tif=0x55555582c890, fd=0x55555582c6b0, flags=1) at /src/libtiff/tif_print.c:676
676                                 (unsigned long long) td->td_stripbytecount[s]);
(gdb) bt
#0  0x0000555555594245 in TIFFPrintDirectory (tif=0x55555582c890, fd=0x55555582c6b0, flags=1) at /src/libtiff/tif_print.c:676
#1  0x000055555555a0a6 in LLVMFuzzerTestOneInput (data=<optimized out>, size=<optimized out>) at harness/harness.c:71
#2  0x0000555555559eaa in ExecuteFilesOnyByOne (argc=2, argv=0x7fffffffe3c8, callback=callback@entry=0x555555559ef0 <LLVMFuzzerTestOneInput>)
    at aflpp_driver.c:267
#3  0x0000555555559c9a in LLVMFuzzerRunDriver (argcp=argcp@entry=0x7fffffffe28c, argvp=argvp@entry=0x7fffffffe290, 
    callback=0x555555559ef0 <LLVMFuzzerTestOneInput>) at aflpp_driver.c:381
#4  0x000055555555983c in main (argc=2, argv=0x7fffffffe3c8) at aflpp_driver.c:323
```

CVE 2018
```
Starting program: /src/harness_bin findings_cve_2018/default/crashes/id:000000,sig:11,src:001160,time:140822,execs:843541,op:havoc,rep:2
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
Reading 292 bytes from findings_cve_2018/default/crashes/id:000000,sig:11,src:001160,time:140822,execs:843541,op:havoc,rep:2

Program received signal SIGSEGV, Segmentation fault.
0x000055555557b6bb in TIFFPrintDirectory (tif=0x55555582c890, fd=0x55555582c6b0, flags=6) at /src/libtiff/tif_print.c:551
551                                                 td->td_transferfunction[i][l]);
(gdb) bt
#0  0x000055555557b6bb in TIFFPrintDirectory (tif=0x55555582c890, fd=0x55555582c6b0, flags=6) at /src/libtiff/tif_print.c:551
#1  0x000055555555a0a6 in LLVMFuzzerTestOneInput (data=<optimized out>, size=<optimized out>) at harness/harness.c:71
#2  0x0000555555559eaa in ExecuteFilesOnyByOne (argc=2, argv=0x7fffffffe3c8, callback=callback@entry=0x555555559ef0 <LLVMFuzzerTestOneInput>)
    at aflpp_driver.c:267
#3  0x0000555555559c9a in LLVMFuzzerRunDriver (argcp=argcp@entry=0x7fffffffe28c, argvp=argvp@entry=0x7fffffffe290, 
    callback=0x555555559ef0 <LLVMFuzzerTestOneInput>) at aflpp_driver.c:381
#4  0x000055555555983c in main (argc=2, argv=0x7fffffffe3c8) at aflpp_driver.c:323
```

