# Install script for directory: /src/html

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
   "/usr/local/share/doc/tiff/html/addingtags.html;/usr/local/share/doc/tiff/html/bugs.html;/usr/local/share/doc/tiff/html/build.html;/usr/local/share/doc/tiff/html/contrib.html;/usr/local/share/doc/tiff/html/document.html;/usr/local/share/doc/tiff/html/images.html;/usr/local/share/doc/tiff/html/index.html;/usr/local/share/doc/tiff/html/internals.html;/usr/local/share/doc/tiff/html/intro.html;/usr/local/share/doc/tiff/html/libtiff.html;/usr/local/share/doc/tiff/html/misc.html;/usr/local/share/doc/tiff/html/support.html;/usr/local/share/doc/tiff/html/TIFFTechNote2.html;/usr/local/share/doc/tiff/html/tools.html;/usr/local/share/doc/tiff/html/v3.4beta007.html;/usr/local/share/doc/tiff/html/v3.4beta016.html;/usr/local/share/doc/tiff/html/v3.4beta018.html;/usr/local/share/doc/tiff/html/v3.4beta024.html;/usr/local/share/doc/tiff/html/v3.4beta028.html;/usr/local/share/doc/tiff/html/v3.4beta029.html;/usr/local/share/doc/tiff/html/v3.4beta031.html;/usr/local/share/doc/tiff/html/v3.4beta032.html;/usr/local/share/doc/tiff/html/v3.4beta033.html;/usr/local/share/doc/tiff/html/v3.4beta034.html;/usr/local/share/doc/tiff/html/v3.4beta035.html;/usr/local/share/doc/tiff/html/v3.4beta036.html;/usr/local/share/doc/tiff/html/v3.5.1.html;/usr/local/share/doc/tiff/html/v3.5.2.html;/usr/local/share/doc/tiff/html/v3.5.3.html;/usr/local/share/doc/tiff/html/v3.5.4.html;/usr/local/share/doc/tiff/html/v3.5.5.html;/usr/local/share/doc/tiff/html/v3.5.6-beta.html;/usr/local/share/doc/tiff/html/v3.5.7.html;/usr/local/share/doc/tiff/html/v3.6.0.html;/usr/local/share/doc/tiff/html/v3.6.1.html;/usr/local/share/doc/tiff/html/v3.7.0alpha.html;/usr/local/share/doc/tiff/html/v3.7.0beta.html;/usr/local/share/doc/tiff/html/v3.7.0beta2.html;/usr/local/share/doc/tiff/html/v3.7.0.html;/usr/local/share/doc/tiff/html/v3.7.1.html;/usr/local/share/doc/tiff/html/v3.7.2.html;/usr/local/share/doc/tiff/html/v3.7.3.html;/usr/local/share/doc/tiff/html/v3.7.4.html;/usr/local/share/doc/tiff/html/v3.8.0.html;/usr/local/share/doc/tiff/html/v3.8.1.html;/usr/local/share/doc/tiff/html/v3.8.2.html;/usr/local/share/doc/tiff/html/v3.9.0beta.html;/usr/local/share/doc/tiff/html/v3.9.1.html;/usr/local/share/doc/tiff/html/v3.9.2.html;/usr/local/share/doc/tiff/html/v4.0.0.html;/usr/local/share/doc/tiff/html/v4.0.1.html;/usr/local/share/doc/tiff/html/v4.0.2.html;/usr/local/share/doc/tiff/html/v4.0.3.html;/usr/local/share/doc/tiff/html/v4.0.4beta.html")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/share/doc/tiff/html" TYPE FILE FILES
    "/src/html/addingtags.html"
    "/src/html/bugs.html"
    "/src/html/build.html"
    "/src/html/contrib.html"
    "/src/html/document.html"
    "/src/html/images.html"
    "/src/html/index.html"
    "/src/html/internals.html"
    "/src/html/intro.html"
    "/src/html/libtiff.html"
    "/src/html/misc.html"
    "/src/html/support.html"
    "/src/html/TIFFTechNote2.html"
    "/src/html/tools.html"
    "/src/html/v3.4beta007.html"
    "/src/html/v3.4beta016.html"
    "/src/html/v3.4beta018.html"
    "/src/html/v3.4beta024.html"
    "/src/html/v3.4beta028.html"
    "/src/html/v3.4beta029.html"
    "/src/html/v3.4beta031.html"
    "/src/html/v3.4beta032.html"
    "/src/html/v3.4beta033.html"
    "/src/html/v3.4beta034.html"
    "/src/html/v3.4beta035.html"
    "/src/html/v3.4beta036.html"
    "/src/html/v3.5.1.html"
    "/src/html/v3.5.2.html"
    "/src/html/v3.5.3.html"
    "/src/html/v3.5.4.html"
    "/src/html/v3.5.5.html"
    "/src/html/v3.5.6-beta.html"
    "/src/html/v3.5.7.html"
    "/src/html/v3.6.0.html"
    "/src/html/v3.6.1.html"
    "/src/html/v3.7.0alpha.html"
    "/src/html/v3.7.0beta.html"
    "/src/html/v3.7.0beta2.html"
    "/src/html/v3.7.0.html"
    "/src/html/v3.7.1.html"
    "/src/html/v3.7.2.html"
    "/src/html/v3.7.3.html"
    "/src/html/v3.7.4.html"
    "/src/html/v3.8.0.html"
    "/src/html/v3.8.1.html"
    "/src/html/v3.8.2.html"
    "/src/html/v3.9.0beta.html"
    "/src/html/v3.9.1.html"
    "/src/html/v3.9.2.html"
    "/src/html/v4.0.0.html"
    "/src/html/v4.0.1.html"
    "/src/html/v4.0.2.html"
    "/src/html/v4.0.3.html"
    "/src/html/v4.0.4beta.html"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/src/build/html/images/cmake_install.cmake")
  include("/src/build/html/man/cmake_install.cmake")

endif()

