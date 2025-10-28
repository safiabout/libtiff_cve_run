# Install script for directory: /src/html/images

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
   "/usr/local/share/doc/tiff/html/images/back.gif;/usr/local/share/doc/tiff/html/images/bali.jpg;/usr/local/share/doc/tiff/html/images/cat.gif;/usr/local/share/doc/tiff/html/images/cover.jpg;/usr/local/share/doc/tiff/html/images/cramps.gif;/usr/local/share/doc/tiff/html/images/dave.gif;/usr/local/share/doc/tiff/html/images/info.gif;/usr/local/share/doc/tiff/html/images/jello.jpg;/usr/local/share/doc/tiff/html/images/jim.gif;/usr/local/share/doc/tiff/html/images/note.gif;/usr/local/share/doc/tiff/html/images/oxford.gif;/usr/local/share/doc/tiff/html/images/quad.jpg;/usr/local/share/doc/tiff/html/images/ring.gif;/usr/local/share/doc/tiff/html/images/smallliz.jpg;/usr/local/share/doc/tiff/html/images/strike.gif;/usr/local/share/doc/tiff/html/images/warning.gif")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/share/doc/tiff/html/images" TYPE FILE FILES
    "/src/html/images/back.gif"
    "/src/html/images/bali.jpg"
    "/src/html/images/cat.gif"
    "/src/html/images/cover.jpg"
    "/src/html/images/cramps.gif"
    "/src/html/images/dave.gif"
    "/src/html/images/info.gif"
    "/src/html/images/jello.jpg"
    "/src/html/images/jim.gif"
    "/src/html/images/note.gif"
    "/src/html/images/oxford.gif"
    "/src/html/images/quad.jpg"
    "/src/html/images/ring.gif"
    "/src/html/images/smallliz.jpg"
    "/src/html/images/strike.gif"
    "/src/html/images/warning.gif"
    )
endif()

