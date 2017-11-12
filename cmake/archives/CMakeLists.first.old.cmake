# Xiphos build script
# The Xiphos Developement Team
#
# TODO
# - Check cmake/config.h.in
# - Write cmake/Report.cmake
# + Move dependencies checking to cmake/Dependencies.cmake
# - Add install sequence
# - Move cmake/CreateConfig.cmake to cmake/Config_h.cmake
# - Check this file CMakelists.txt
# - 

# project name
project (xiphos C CXX)

# base bits
set (RELEASE_NAME "A Bible study tool.")

# version number.
set (VERSION "4.0.6a")

# package bits
set (PACKAGE "xiphos")
set (PACKAGE_NAME "${RELEASE_NAME}")
set (PACKAGE_STRING "${PACKAGE} ${VERSION} cmake")
set (PACKAGE_BUGREPORT "https://github.com/crosswire/xiphos/issues")


# the oldest stable cmake version we support
cmake_minimum_required (VERSION 3.6 FATAL_ERROR)

# tell cmake where its modules can be found in our project directory
list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

# make sure it's an out-of-stream build
IF(${CMAKE_CURRENT_BINARY_DIR} STREQUAL ${CMAKE_CURRENT_SOURCE_DIR})
  MESSAGE(FATAL_ERROR "Please invoke CMake from a different directory than the source.")
ENDIF()      

# TODO list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/src)
MESSAGE(STATUS "Configuring your system to build Xiphos.")

# cmake options
IF (NOT CMAKE_BUILD_TYPE)
  message(STATUS "Setting build type to 'Release' as none was specified.")
  set(CMAKE_BUILD_TYPE "Release")
ENDIF()

# xiphos core options
option(WANT_DEBUG   "Build for debugging."                           OFF)
option(WANT_GTK2    "Force UI build with Gtk2 instead of Gtk3."      OFF)
option(WANT_GTKHTML "Force gtkhtml editor instead of webkit editor." OFF)
option(WANT_WEBKIT1 "Force webkit1 instead of webkit2."              OFF)
option(WANT_DBUS    "Use the Xiphos dbus API."                       ON)
option(WANT_HELP    "Creating help files."                           ON)
option(WANT_INSTALL "Enable post-install tasks."                     ON)
option(WANT_CHATTY  "Enable lots of tracing."                        OFF)

# options needing rewrite
#option(WITH_STRIP "Strip resulting binary." OFF)
#option(WITH_DELINT "Build with: -Wall -Werror." OFF)

# TODOset(DEBUG_LEVEL "debug" CACHE STRING "Specify the debugging level ['ultradebug', 'debug', 'release', 'optimized'].")

# win32 options needing checking
#option(WIN32_TARGET "Cross-compile for win32 from Linux/Unix." OFF)
#option(WIN32_WITHOUT_CONSOLE "Disable console window in win32." OFF)
# TODO pkgconf-libdir  "Specify dir with *.pc files for cross-compilation"
# TODO pkgconf-prefix "Specify prefix with folders for headers and libraries for cross-compilation"
# TODO helpdir "user documentation [default: ${DATAROOTDIR}/gnome/help/${PACKAGE}]"

# weird options, need checking
#option(ICON_UPDATE "Run gtk-update-icon-cache after the install." ON)
#option(DESKTOP_UPDATE "Run update-desktop-database after the install." ON)
#option(DESKTOP_VALIDATE "Check generated desktop file for errors during build." ON)
#option(TRANSLATE_HELP "Generate and install translated help documentation." ON)

# workaround: Webkit2 editor not yet implemented
if (NOT WANT_WEBKIT1 AND NOT WANT_GTKHTML)
  message (AUTHOR_WARNING "Auto fall back to webkit1. Webkit2 and the WebKit2-editor were both selected ON, but the Webkit2 editor is a work in progress and is not yet available. If you still want rendering with Webkit2, enable the GtkHtml-4 editor (-DWANT_GTKHTML)")
  SET (WANT_WEBKIT1 ON)
ENDIF ()


    # where we install data directory (if we have any)
    set (DATADIR "${CMAKE_INSTALL_PREFIX}/share")


# generate list of source files
file(
  GLOB_RECURSE
  SOURCE_FILES
  src/backend/*
  src/editor/*
  src/gnome2/*
  src/gui/*
  src/main/*
  src/webkit/*
  src/xiphos_html/*
  )

# create config.h
INCLUDE (CreateConfig)
# include config.h
INCLUDE_DIRECTORIES("${CMAKE_CURRENT_BINARY_DIR}")

# add executable
add_executable(
  xiphos
  ${SOURCE_FILES}
  )
target_link_libraries(xiphos LINK_PUBLIC ${DEPS_LIBRARY_DIRS})

INCLUDE (CheckDependencies)
# Run required scripts before building
INCLUDE (Scripts)
INCLUDE (Report)
add_definitions(-DHAVE_STRCASESTR)
add_definitions(-DSHARE_DIR="${DATAROOTDIR}/${PACKAGE}")
