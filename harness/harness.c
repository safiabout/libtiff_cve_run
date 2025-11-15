#include <stdint.h>
#include <stdio.h>
#include "tiffio.h"
#include <unistd.h>
#include <stdlib.h>

/*
notes:

tiffinfo is a command-line program that opens a TIFF file, reads directories (IFDs), and prints their metadata using:
    TIFFPrintDirectory() (this is where the CVE-2017-18013 NULL pointer dereference is located)

in tiffinto.c line 118, that is where the TIFFPRINT_STRIPS bit is set in the flags 

in tiffinfo.c line 140, that is where theTIFF file is opened so libtiff can read tags and directories
    a TIFF file may contain multiple directories, it can support:
        a specific directory number (-0, -1, -2)
        a specific byte offset (-o offset)
        iterate through all directories (for the tiffprint -s we would go to this cnodition)

a TIFF file contains one or more image directories, also called IFDs (Image File Directories):
    each IFD is like a metadata block describing width, heigh, strip offsets, etc
    a TIFF file can contain multiple IFDs and each IFD is located at a byte offset inside the file


*/

int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
    if (size < 4) return 0;

    // stop the libtiff stderr before calling any functions so nothing is printed and we can see the AFL++ output
    fflush(stderr); // https://man7.org/linux/man-pages/man3/fflush.3.html (gotta do this so that the buffered data is not still being writen to the old target)
    FILE* devnull_stderr= fopen("/dev/null", "w");
    if (devnull_stderr) {
        dup2(fileno(devnull_stderr), STDERR_FILENO); // https://man7.org/linux/man-pages/man2/dup2.2.html (replace file descriptor with devnull_stderr)
        fclose(devnull_stderr);
    }

    // since the TIFFOpen function only accepts file paths, we can use
    // mkstemp (https://man7.org/linux/man-pages/man3/mkstemp.3.html) to create a
    // temporary filename from template (last six characters must be XXXXXX that are replaced
    // with a string to make the filename unique.) it must also be a character array

    char file_name[] = "/tmp/tifXXXXXX";
    int fd = mkstemp(file_name);
    if (fd < 0) return 0;

    write(fd, data, size);
    close(fd);

    TIFF *tif = TIFFOpen(file_name, "r");
    if (!tif) { // if the TIFFOpen function fails, just delete the temporary file with unlink()
        // https://man7.org/linux/man-pages/man2/unlink.2.html
        unlink(file_name);
        return 0;
    }

    // used to discard output (without this we cant see the fuzzer output) 
    // (https://superuser.com/questions/1676906/what-is-the-practical-mechanic-of-dev-null)
    FILE* devnull = fopen("/dev/null", "w");

    if (devnull) {
        do {
            TIFFPrintDirectory(tif, devnull, TIFFPRINT_STRIPS);
        } while (TIFFReadDirectory(tif));

        fclose(devnull);
    }

    TIFFClose(tif);
    unlink(file_name);
    return 0;
}