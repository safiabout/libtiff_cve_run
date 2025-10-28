# Demo Notes

* [CVE-2018-7456](http://bugzilla.maptools.org/show_bug.cgi?id=2778)
* [Patch Commit](https://gitlab.com/libtiff/libtiff/-/commit/be4c85b16e8801a16eec25e80eb9f3dd6a96731b)
```
docker run --rm -it --name afl_libtiff_example -v /Users/safiaboutaleb/Developer/tiff-4.0.9:/src 86d63d1d43

This is to generate a valid TIFF file so the fuzzer can actually run:

apt-get update && apt-get install -y imagemagick
mkdir seeds
convert -size 1x1 xc:white seeds/seed_valid.tif

set up fuzzer:

cd build
export CC=/AFLplusplus/afl-clang-fast
export CXX=/AFLplusplus/afl-clang-fast++
cmake -DCMAKE_C_COMPILER="$CC" -DCMAKE_CXX_COMPILER="$CXX" \
      -DCMAKE_C_FLAGS="-g -O0" -DCMAKE_CXX_FLAGS="-g -O0" ..

make -j$(nproc)

run fuzzer:

mkdir -p ~/fuzz_runs/libtiff_{in,out}
cp /src/seeds/seed_valid.tif ~/fuzz_runs/libtiff_in/simple_seed_valid.tif

cd /src/build

/AFLplusplus/afl-fuzz -i ~/fuzz_runs/libtiff_in -o ~/fuzz_runs/libtiff_out -m none -d -- ./tools/tiffinfo -c @@

gdb:
gdb --args /src/build/tools/tiffinfo -c /root/fuzz_runs/libtiff_out/default/crashes/[example crash] [id:000001,sig:11,src:001033,time:829345,execs:1375582,op:havoc,rep:6]
```

* [CVE-2017-18013](http://bugzilla.maptools.org/show_bug.cgi?id=2770)
* [Patch Commit](https://gitlab.com/libtiff/libtiff/-/commit/c6f41df7b581402dfba3c19a1e3df4454c551a01)
```
This is to generate a valid TIFF file so the fuzzer can actually run:

apt-get update && apt-get install -y imagemagick
mkdir seeds
convert -size 1x1 xc:white seeds/seed_valid.tif

set up fuzzer:

cd build
export CC=/AFLplusplus/afl-clang-fast
export CXX=/AFLplusplus/afl-clang-fast++
cmake -DCMAKE_C_COMPILER="$CC" -DCMAKE_CXX_COMPILER="$CXX" \
      -DCMAKE_C_FLAGS="-g -O0" -DCMAKE_CXX_FLAGS="-g -O0" ..

make -j$(nproc)

run fuzzer:

mkdir -p ~/fuzz_runs/libtiff_{in,out}
cp /src/seeds/seed_valid.tif ~/fuzz_runs/libtiff_in/simple_seed_valid.tif

cd /src/build

/AFLplusplus/afl-fuzz -i ~/fuzz_runs/libtiff_in -o ~/fuzz_runs/libtiff_out -m none -d -- ./tools/tiffinfo -s @@

gdb:
gdb --args ./tiffinfo -s ~/fuzz_runs/libtiff_out/default/crashes/id:000001,sig:11,src:000314,time:28268,execs:68088,op:havoc,rep:3

bt

to download tiff file:
docker ps -a
docker cp <container>:"/root/fuzz_runs/libtiff_out/default/crashes/id:000000,sig:11,src:000314,time:28265,execs:68083,op:havoc,rep:3" ./crash.tif

```

```
TIFF Directory at offset 0xa (10)
  Image Width: 1 Image Length: 1
  Bits/Sample: 16
  Compression Scheme: Old-style JPEG
  Photometric Interpretation: min-is-black
  FillOrder: msb-to-lsb
  Samples/Pixel: 1
  Planar Configuration: single image plane
  1 Strips:

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff7f71d65 in TIFFPrintDirectory (tif=0x5555557672a0, fd=0x7ffff7c045c0 <_IO_2_1_stdout_>, flags=1) at /src/libtiff/tif_print.c:676
676                                 (unsigned long long) td->td_stripbytecount[s]);
(gdb) bt
#0  0x00007ffff7f71d65 in TIFFPrintDirectory (tif=0x5555557672a0, fd=0x7ffff7c045c0 <_IO_2_1_stdout_>, flags=1) at /src/libtiff/tif_print.c:676
#1  0x00005555555594d6 in tiffinfo (tif=0x5555557672a0, order=0, flags=1, is_image=1) at /src/tools/tiffinfo.c:463
#2  0x000055555555905a in main (argc=3, argv=0x7fffffffe398) at /src/tools/tiffinfo.c:152
(gdb) 
```

[crash_1_cve_2017](/Users/safiaboutaleb/Developer/tiff-4.0.9/my_crashes/crash_1_cve_2017.tif)