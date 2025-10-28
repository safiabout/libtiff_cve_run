# Install script for directory: /src/tools

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
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/fax2ps" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/fax2ps")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/fax2ps"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/fax2ps")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/fax2ps")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/fax2ps" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/fax2ps")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/fax2ps"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/fax2ps")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/fax2tiff" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/fax2tiff")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/fax2tiff"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/fax2tiff")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/fax2tiff")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/fax2tiff" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/fax2tiff")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/fax2tiff"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/fax2tiff")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/pal2rgb" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/pal2rgb")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/pal2rgb"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/pal2rgb")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/pal2rgb")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/pal2rgb" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/pal2rgb")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/pal2rgb"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/pal2rgb")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/ppm2tiff" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/ppm2tiff")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/ppm2tiff"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/ppm2tiff")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/ppm2tiff")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/ppm2tiff" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/ppm2tiff")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/ppm2tiff"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/ppm2tiff")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/raw2tiff" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/raw2tiff")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/raw2tiff"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/raw2tiff")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/raw2tiff")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/raw2tiff" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/raw2tiff")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/raw2tiff"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/raw2tiff")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiff2bw" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiff2bw")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/tiff2bw"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/tiff2bw")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/tiff2bw")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiff2bw" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiff2bw")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/tiff2bw"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/tiff2bw")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiff2pdf" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiff2pdf")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/tiff2pdf"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/tiff2pdf")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/tiff2pdf")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiff2pdf" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiff2pdf")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/tiff2pdf"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/tiff2pdf")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiff2ps" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiff2ps")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/tiff2ps"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/tiff2ps")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/tiff2ps")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiff2ps" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiff2ps")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/tiff2ps"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/tiff2ps")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiff2rgba" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiff2rgba")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/tiff2rgba"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/tiff2rgba")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/tiff2rgba")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiff2rgba" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiff2rgba")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/tiff2rgba"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/tiff2rgba")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffcmp" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffcmp")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffcmp"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/tiffcmp")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/tiffcmp")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffcmp" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffcmp")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffcmp"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/tiffcmp")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffcp" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffcp")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffcp"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/tiffcp")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/tiffcp")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffcp" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffcp")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffcp"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/tiffcp")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffcrop" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffcrop")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffcrop"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/tiffcrop")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/tiffcrop")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffcrop" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffcrop")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffcrop"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/tiffcrop")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffdither" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffdither")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffdither"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/tiffdither")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/tiffdither")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffdither" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffdither")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffdither"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/tiffdither")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffdump" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffdump")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffdump"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/tiffdump")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/tiffdump")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffdump" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffdump")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffdump"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/tiffdump")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffinfo" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffinfo")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffinfo"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/tiffinfo")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/tiffinfo")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffinfo" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffinfo")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffinfo"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/tiffinfo")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffmedian" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffmedian")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffmedian"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/tiffmedian")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/tiffmedian")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffmedian" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffmedian")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffmedian"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/tiffmedian")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffset" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffset")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffset"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/tiffset")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/tiffset")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffset" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffset")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffset"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/tiffset")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffsplit" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffsplit")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffsplit"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/bin/tiffsplit")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/bin" TYPE EXECUTABLE FILES "/src/build/tools/tiffsplit")
  if(EXISTS "$ENV{DESTDIR}/usr/local/bin/tiffsplit" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/bin/tiffsplit")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/bin/tiffsplit"
         OLD_RPATH "/src/build/libtiff:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/bin/tiffsplit")
    endif()
  endif()
endif()

