// klee_tiff_crash_harness.c
#include <klee/klee.h>
#include "tiffiop.h"

// prototype of the internal function inside libtiff 4.0.9
extern void _TIFFPrintField(TIFF *tif, TIFFPrintMethod print, FILE *fd, uint32 tag, uint16 count, void *value);

int main() {
    TIFF tif;               
    TIFFDirectory td;       
    tif.tif_dir = td;        

    klee_make_symbolic(&td, sizeof(td), "td");

    // symbolic strips
    uint64 stripbytecount[8];
    uint64 stripoffset[8];

    klee_make_symbolic(stripbytecount, sizeof(stripbytecount), "stripbytecount");
    klee_make_symbolic(stripoffset, sizeof(stripoffset), "stripoffset");

    // symbolic arrays into the TIFFDirectory
    td.td_stripbytecount = stripbytecount;
    td.td_stripoffset = stripoffset;

    // number of strips is small and symbolic
    klee_make_symbolic(&td.td_nstrips, sizeof(td.td_nstrips), "nstrips");
    klee_assume(td.td_nstrips <= 8);

    // flags for TIFFPrintDirectory
    tif.tif_name = "symbolic.tif";
    tif.tif_flags = 0;

    // call vulnerable function
    FILE *dummy = fopen("/dev/null", "w");
    TIFFPrintDirectory(&tif, dummy, TIFFPRINT_STRIPS);

    return 0;
}
