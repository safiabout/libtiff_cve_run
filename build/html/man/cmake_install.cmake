# Install script for directory: /src/html/man

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/share/doc/tiff/html/man/index.html;/usr/local/share/doc/tiff/html/man/libtiff.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFbuffer.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFClose.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFcodec.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFcolor.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFDataWidth.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFError.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFFieldDataType.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFFieldName.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFFieldPassCount.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFFieldReadCount.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFFieldTag.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFFieldWriteCount.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFFlush.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFGetField.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFmemory.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFOpen.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFPrintDirectory.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFquery.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFReadDirectory.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFReadEncodedStrip.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFReadEncodedTile.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFReadRawStrip.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFReadRawTile.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFReadRGBAImage.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFReadRGBAStrip.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFReadRGBATile.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFReadScanline.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFReadTile.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFRGBAImage.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFSetDirectory.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFSetField.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFsize.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFstrip.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFswab.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFtile.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFWarning.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFWriteDirectory.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFWriteEncodedStrip.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFWriteEncodedTile.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFWriteRawStrip.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFWriteRawTile.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFWriteScanline.3tiff.html;/usr/local/share/doc/tiff/html/man/TIFFWriteTile.3tiff.html;/usr/local/share/doc/tiff/html/man/fax2ps.1.html;/usr/local/share/doc/tiff/html/man/fax2tiff.1.html;/usr/local/share/doc/tiff/html/man/pal2rgb.1.html;/usr/local/share/doc/tiff/html/man/ppm2tiff.1.html;/usr/local/share/doc/tiff/html/man/raw2tiff.1.html;/usr/local/share/doc/tiff/html/man/tiff2bw.1.html;/usr/local/share/doc/tiff/html/man/tiff2pdf.1.html;/usr/local/share/doc/tiff/html/man/tiff2ps.1.html;/usr/local/share/doc/tiff/html/man/tiff2rgba.1.html;/usr/local/share/doc/tiff/html/man/tiffcmp.1.html;/usr/local/share/doc/tiff/html/man/tiffcp.1.html;/usr/local/share/doc/tiff/html/man/tiffcrop.1.html;/usr/local/share/doc/tiff/html/man/tiffdither.1.html;/usr/local/share/doc/tiff/html/man/tiffdump.1.html;/usr/local/share/doc/tiff/html/man/tiffgt.1.html;/usr/local/share/doc/tiff/html/man/tiffinfo.1.html;/usr/local/share/doc/tiff/html/man/tiffmedian.1.html;/usr/local/share/doc/tiff/html/man/tiffset.1.html;/usr/local/share/doc/tiff/html/man/tiffsplit.1.html")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/share/doc/tiff/html/man" TYPE FILE FILES
    "/src/html/man/index.html"
    "/src/html/man/libtiff.3tiff.html"
    "/src/html/man/TIFFbuffer.3tiff.html"
    "/src/html/man/TIFFClose.3tiff.html"
    "/src/html/man/TIFFcodec.3tiff.html"
    "/src/html/man/TIFFcolor.3tiff.html"
    "/src/html/man/TIFFDataWidth.3tiff.html"
    "/src/html/man/TIFFError.3tiff.html"
    "/src/html/man/TIFFFieldDataType.3tiff.html"
    "/src/html/man/TIFFFieldName.3tiff.html"
    "/src/html/man/TIFFFieldPassCount.3tiff.html"
    "/src/html/man/TIFFFieldReadCount.3tiff.html"
    "/src/html/man/TIFFFieldTag.3tiff.html"
    "/src/html/man/TIFFFieldWriteCount.3tiff.html"
    "/src/html/man/TIFFFlush.3tiff.html"
    "/src/html/man/TIFFGetField.3tiff.html"
    "/src/html/man/TIFFmemory.3tiff.html"
    "/src/html/man/TIFFOpen.3tiff.html"
    "/src/html/man/TIFFPrintDirectory.3tiff.html"
    "/src/html/man/TIFFquery.3tiff.html"
    "/src/html/man/TIFFReadDirectory.3tiff.html"
    "/src/html/man/TIFFReadEncodedStrip.3tiff.html"
    "/src/html/man/TIFFReadEncodedTile.3tiff.html"
    "/src/html/man/TIFFReadRawStrip.3tiff.html"
    "/src/html/man/TIFFReadRawTile.3tiff.html"
    "/src/html/man/TIFFReadRGBAImage.3tiff.html"
    "/src/html/man/TIFFReadRGBAStrip.3tiff.html"
    "/src/html/man/TIFFReadRGBATile.3tiff.html"
    "/src/html/man/TIFFReadScanline.3tiff.html"
    "/src/html/man/TIFFReadTile.3tiff.html"
    "/src/html/man/TIFFRGBAImage.3tiff.html"
    "/src/html/man/TIFFSetDirectory.3tiff.html"
    "/src/html/man/TIFFSetField.3tiff.html"
    "/src/html/man/TIFFsize.3tiff.html"
    "/src/html/man/TIFFstrip.3tiff.html"
    "/src/html/man/TIFFswab.3tiff.html"
    "/src/html/man/TIFFtile.3tiff.html"
    "/src/html/man/TIFFWarning.3tiff.html"
    "/src/html/man/TIFFWriteDirectory.3tiff.html"
    "/src/html/man/TIFFWriteEncodedStrip.3tiff.html"
    "/src/html/man/TIFFWriteEncodedTile.3tiff.html"
    "/src/html/man/TIFFWriteRawStrip.3tiff.html"
    "/src/html/man/TIFFWriteRawTile.3tiff.html"
    "/src/html/man/TIFFWriteScanline.3tiff.html"
    "/src/html/man/TIFFWriteTile.3tiff.html"
    "/src/html/man/fax2ps.1.html"
    "/src/html/man/fax2tiff.1.html"
    "/src/html/man/pal2rgb.1.html"
    "/src/html/man/ppm2tiff.1.html"
    "/src/html/man/raw2tiff.1.html"
    "/src/html/man/tiff2bw.1.html"
    "/src/html/man/tiff2pdf.1.html"
    "/src/html/man/tiff2ps.1.html"
    "/src/html/man/tiff2rgba.1.html"
    "/src/html/man/tiffcmp.1.html"
    "/src/html/man/tiffcp.1.html"
    "/src/html/man/tiffcrop.1.html"
    "/src/html/man/tiffdither.1.html"
    "/src/html/man/tiffdump.1.html"
    "/src/html/man/tiffgt.1.html"
    "/src/html/man/tiffinfo.1.html"
    "/src/html/man/tiffmedian.1.html"
    "/src/html/man/tiffset.1.html"
    "/src/html/man/tiffsplit.1.html"
    )
endif()

