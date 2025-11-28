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
      -DCMAKE_C_FLAGS="-g -O0" -DCMAKE_CXX_FLAGS="-g -O0" -DBUILD_SHARED_LIBS=OFF ..


`afl-cc -o harness_bin -fsanitize=fuzzer harness/harness.c ../build/libtiff/libtiff.a -I../libtiff -I../build/libtiff -lz -lm Ddd`

make -j$(nproc)

run fuzzer:

mkdir -p ~/fuzz_runs/libtiff_{in,out}
cp /src/seeds/seed_valid.tif ~/fuzz_runs/libtiff_in/simple_seed_valid.tif

cd /src/build

/AFLplusplus/afl-fuzz -i ~/fuzz_runs/libtiff_in -o ~/fuzz_runs/libtiff_out -m none -d -- ./tools/tiffinfo -c @@

gdb:
gdb --args /src/build/tools/tiffinfo -c /root/fuzz_runs/libtiff_out/default/crashes/[example crash] [id:000001,sig:11,src:001033,time:829345,execs:1375582,op:havoc,rep:6]
```

```
TIFF Directory at offset 0xa (10)
  Image Width: 1 Image Length: 1
  Bits/Sample: 1
  Compression Scheme: None
  Photometric Interpretation: min-is-black
  FillOrder: msb-to-lsb
  Samples/Pixel: 8
  Planar Configuration: single image plane
  Transfer Function:

Program received signal SIGSEGV, Segmentation fault.
0x0000776a37a7a01b in TIFFPrintDirectory (tif=0x619e312892a0, fd=0x776a378c15c0 <_IO_2_1_stdout_>, flags=6)
    at /src/libtiff/tif_print.c:551
551                                                 td->td_transferfunction[i][l]);
(gdb) bt
#0  0x0000776a37a7a01b in TIFFPrintDirectory (tif=0x619e312892a0, fd=0x776a378c15c0 <_IO_2_1_stdout_>, flags=6)
    at /src/libtiff/tif_print.c:551
#1  0x0000619e0ba344d6 in tiffinfo (tif=0x619e312892a0, order=0, flags=6, is_image=1) at /src/tools/tiffinfo.c:463
#2  0x0000619e0ba3405a in main (argc=3, argv=0x7ffd709e1288) at /src/tools/tiffinfo.c:152
(gdb)
```
[crash_1_cve_2018](/Users/safiaboutaleb/Developer/tiff-4.0.9/my_crashes/crash_1_cve_2018.tif)

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

## Understanding Code Notes

TIFFPrintDirectory prints a lot of information about a TIFF image. Its signature is:
`void TIFFPrintDirectory(TIFF* tif, FILE* fd, long flags)`
* tif → pointer to the TIFF struct (the core object representing an opened TIFF file)
* fd → a FILE* stream (usually stdout or a file)
* flags → long integer controlling output (like whether to print colormap, strips, curves, etc.)

Most of the function is just printing fields in the tif->tif_dir struct. So fuzzing it mainly involves creating valid or semi-valid TIFF structs in memory with varying contents.

Key points:

* It uses a lot of arrays, (td_colormap, td_sminsamplevalue, td_refblackwhite.)
* Some fields are conditionally printed based on TIFFFieldSet(), so we need to set the corresponding flags.
* It calls helper functions like _TIFFPrettyPrintField() and _TIFFPrintField() for custom tags.

## Structure for Fuzzing

Do not need a full TIFF file on disk to fuzz TIFFPrintDirectory. We just need a valid-in-memory TIFF struct with initialized fields that the function accesses.

What we minimally need to initialize:
* tif->tif_dir (TIFFDirectory) → the actual image metadata
* tif->tif_flags → some flags might be checked
* tif->tif_tagmethods.printdir → optional, can be NULL
* FILE* fd → can be stdout or a memory file (like fmemopen) if we want to capture output

Everything else can be left zeroed unless we want to explore paths like colormaps or subIFDs.

Since we want to test TIFFPrintDirectory() in isolation (unit fuzzing), then we would do the manual struct initialization approach. But for most fuzzing goals (finding real bugs), using a simple TIFF seed and libtiff’s normal loader is the preferred and robust path.

## Fuzzing Idea

fuzz harness takes arbitrary input bytes (const uint8_t* data, size_t size) and converts them into a TIFF struct to call the target function.

* Map data into fields in tif->tif_dir:
  * Width, height, bit depth, samples per pixel
  * Subfile type flags
  * Colormap (if any)
  * Any arrays like _sminsamplevalue, _smaxsamplevalue, etc.
* Call TIFFPrintDirectory(&tif, stdout, flags).
* Optionally, wrap in fmemopen to capture output instead of printing to console.