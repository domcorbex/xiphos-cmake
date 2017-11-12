# Xiphos build script
# The Xiphos Development Team
#


# the oldest stable cmake version we support
cmake_minimum_required (VERSION 3.4 FATAL_ERROR)
cmake_policy(VERSION 3.4)

### set project name and version ###
project (xiphos LANGUAGES C CXX)
set (PROJECT_VERSION "4.0.7")

# set project other properties
set (PROJECT_BUGREPORT "https://github.com/crosswire/xiphos/issues")
set (PROJECT_URL "http://xiphos.org")
# get current 'ChangeLog' timestamp
file(TIMESTAMP ${CMAKE_SOURCE_DIR}/ChangeLog PROJECT_DATE "%b %Y" UTC)


# tell cmake where its modules can be found in our project directory
list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)

# make sure it's an out-of-stream build
if (${CMAKE_CURRENT_BINARY_DIR} STREQUAL ${CMAKE_CURRENT_SOURCE_DIR})
  message (FATAL_ERROR "Please invoke CMake from a different directory than the source.")
endif ()

# set install directory variables as defined by the GNU Coding Standards.
# e.g. CMAKE_INSTALL_DATAROOTDIR; CMAKE_INSTALL_FULL_BINDIR; CMAKE_INSTALL_FULL_DOCDIR...
include (GNUInstallDirs)


# make platform checks, on different operating systems there are subtle differences,
# e.g. on FreeBSD you should not use malloc.h, while it is perfectly ok to use it on Linux.
include (XiphosSysChecks)

# set CMAKE options that the user can optionally select ON or OFF.
include (XiphosOptions)

# set flags
include (XiphosFlags)

# find needed tools
include (XiphosBuildTools)

# find dependencies
include (XiphosDependencies)

# create config.h
include (XiphosConfig_h)

# create packages
include(XiphosPackage)

# install doc files
install (FILES
  README.md
  RELEASE-NOTES
  COPYING
  AUTHORS
  ChangeLog
  INSTALL.md
  TODO
  Xiphos.ogg
  DESTINATION ${CMAKE_INSTALL_DOCDIR})

# build xiphos
add_subdirectory(src/backend)
add_subdirectory(src/editor)
add_subdirectory(src/main)
add_subdirectory(src/webkit)
add_subdirectory(src/xiphos_html)
add_subdirectory(src/gnome2)
add_subdirectory(src/examples)
add_subdirectory(pixmaps)
add_subdirectory(ui)
add_subdirectory(po)
add_subdirectory(desktop)

if (WITH_DB_HELP)
  add_subdirectory(help)
else ()
  add_subdirectory(mallard)
endif ()

# report
include (XiphosReport)
# End
