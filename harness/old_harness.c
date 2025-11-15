#include <stdio.h> 
#include <stdint.h> 
#include <stdlib.h> 
#include <string.h> 
#include "tiffio.h" /*libtiff API for TIFFPrintDirectory*/
#include "tiffiop.h" /*need this to access internal fields of tiff structure (like tif->tif_dir)*/


// writing fuzz harness tutorial: https://srlabs.de/blog/guide-to-writing-fuzzing-harness

// If the target needs to be initialized once then put
// these calls in this function:
int LLVMFuzzerInitialize(int *argc, char ***argv) {
  return 0;
}

// This is the harness function, here you apply the mutated
// input in “data” with size “size” to the target function.
int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
  // 1. Check first that “size” is the necessary length we need and return otherwise
  // this gives us enough data to fill in the TIFF fields 
  if (size < 17) return 0; // one byte will be used to choose the number of strips, the rest should be at least 8 bytes for offset and 8 bytes for bytecount 

  // 2. Transform “data” of “size” to the necessary parameters of the target functions
  TIFF tif;
  memset(&tif, 0, sizeof(TIFF));

  tif.tif_flags = 0;

  TIFFDirectory* td = &tif.tif_dir;
  memset(td, 0, sizeof(*td));

  long flags = TIFFPRINT_STRIPS;

  /* 
    we need to set flags to be TIFFPRINT_STRIPS since we are fuzzing the strips functionality specifically (command line input would have been tiffinfo -s `tiff_file`)
    by doing this, in the tif_print.c file, we can bypass the if statement:
      `if ((flags & TIFFPRINT_STRIPS) && TIFFFieldSet(tif,FIELD_STRIPOFFSETS))` (line 659 in tif_print.c)

    the first check: (flags & TIFFPRINT_STRIPS)
			what this is doing is bit masking:
				lets say flags is 0001
				and TIFFPRINT_STRIPS is 0001
				when we & them together, we get 0001 which is non zero, meaning that it is asked to print the strips/tiles

    the second check: TIFFFieldSet(tif,FIELD_STRIPOFFSETS)
			this basically checks if the internal bit vector td_fieldsset[] has bits that correspond to FIELD_STRIPOFFSETS
				looks like this in the tif_dir.h file: #define TIFFFieldSet(tif, field)	(BITFIELDn(tif, field) & BITn(field))

				it also uses these two defined functions:

				#define BITn(n)				(((unsigned long)1L)<<((n)&0x1f))
				#define BITFIELDn(tif, n)		((tif)->tif_dir.td_fieldsset[(n)/32])

				td_fieldsset is a bitset where each bit represents that a TIFF field is valid.
				TIFFFieldSet just checks if a bit for a field is set.
				BITn(n):
					create a bit mask that sets the nth bit in the long (long is of size 32)
				BITFIELDn(tif, n):
					grab the correct unsigned long word from the bitset that contains the bit n
   */

  td->td_fieldsset[FIELD_STRIPOFFSETS / 32] |= ((unsigned long)1L) << ((FIELD_STRIPOFFSETS) & 0x1f);
	td->td_fieldsset[FIELD_STRIPBYTECOUNTS / 32] |= ((unsigned long)1L) << (FIELD_STRIPBYTECOUNTS & 0x1f); // we dont check for this flag but we will set it just in case
  // we use the |= (or) operator to avoid changing other bits 

  // now we should have bypassed the if statement

  // TODO: set directory fields with bytes from fuzzer
  const uint8_t *ptr = data;
  size_t remaining_size_left = size; // remaining byte we have not used

  uint32_t number_of_strips_to_make = (ptr[0] % 4) + 1;  // number of strips to make (staying withing 1 to 4 strips)
  ptr++;
  remaining_size_left--;

  uint32_t number_of_strips_possible = remaining_size_left / 16; // each strip needs 16 bytes

  if (number_of_strips_to_make > number_of_strips_possible) 
    number_of_strips_to_make = number_of_strips_possible;

  if (number_of_strips_to_make == 0)
    return 0;

  td->td_nstrips = number_of_strips_to_make;
  td->td_stripoffset = calloc(number_of_strips_to_make, sizeof(uint64_t)); // 8 bytes
  td->td_stripbytecount = calloc(number_of_strips_to_make, sizeof(uint64_t)); // 8 bytes

	// check if allocation failed or not just to be safe
	if (!td->td_stripoffset || !td->td_stripbytecount) {
		free(td->td_stripoffset);
  	free(td->td_stripbytecount);
  	td->td_stripoffset = NULL;
  	td->td_stripbytecount = NULL;
  	td->td_nstrips = 0;

		return 0;
	}

  for (uint32 s = 0; s < td->td_nstrips; s++) {
		if (remaining_size_left < 16) {
			td->td_stripoffset[s] = 0;
			td->td_stripbytecount[s] = 0;
			break;
		}
    memcpy(&td->td_stripoffset[s], ptr, 8);
    memcpy(&td->td_stripbytecount[s], ptr+8, 8);
    ptr += 16;
    remaining_size_left -= 16;
  }

  // 3. Call the initial functions necessary to set up the call you want to fuzz

  // 4. Call the target function with the mutated input

	FILE *devnull = fopen("/dev/null", "w"); // add this to prevent the fuzzer from outputing from the console 
	TIFFPrintDirectory(&tif, devnull, flags);
	fclose(devnull);

  // 5. Check return code and returned data validity

  // 6. If necessary, perform cleanup and reset the state. Avoid memory leaks by any means!
  free(td->td_stripoffset);
  free(td->td_stripbytecount);
  td->td_stripoffset = NULL;
  td->td_stripbytecount = NULL;
  td->td_nstrips = 0;

  return 0;
}