# Xiphos build script
# The Xiphos Development Team
#
# Information Summary

message(STATUS "Summary")

# project info
message(STATUS "  Version de ${PROJECT_NAME}         ${PROJECT_VERSION}")
message(STATUS "  Last ChangeLog edit       ${PROJECT_DATE}")
message(STATUS "  Build type                ${CMAKE_BUILD_TYPE}")
message(STATUS "  Install prefix            ${CMAKE_INSTALL_PREFIX}")

# Options
if (WITH_GTK2)
  message(STATUS "  Gtk version               Gtk+-2.0")
else ()
  message(STATUS "  Gtk version               Gtk+-3.0")
endif ()

if (WITH_WEBKIT1)
  message(STATUS "  WebKitGTK                 WebKit1")
else ()
  message(STATUS "  WebKitGTK                 WebKit2")
endif ()

if (WITH_GTKHTML)
  message(STATUS "  Editor                    Gtkhtml")
else ()
  message(STATUS "  Editor                    WebKit-editor")
endif ()

message(STATUS "  Chatty                    ${WITH_CHATTY}")
message(STATUS "  Delint                    ${WITH_DELINT}")
message(STATUS "  Debug                     ${WITH_DEBUG}")
message(STATUS "  Strip                     ${WITH_STRIP}")
message(STATUS "  Dbus                      ${WITH_DBUS}")

if (CMAKE_BUILD_TYPE STREQUAL "Debug")

  message("")
  message(STATUS "Extended summary")
  message(STATUS "  PROJECT_BUGREPORT:        ${PROJECT_BUGREPORT}")
  message(STATUS "  PROJECT_URL:              ${PROJECT_URL}")

  # cmake info
  message(STATUS "  CMAKE_SYSTEM_NAME:        ${CMAKE_SYSTEM_NAME}")
  message(STATUS "  CMAKE_SYSTEM_VERSION:     ${CMAKE_SYSTEM_VERSION}")
  message(STATUS "  CMAKE_SYSTEM_PROCESSOR:   ${CMAKE_SYSTEM_PROCESSOR}")
  message(STATUS "  CMAKE_C_COMPILER:         ${CMAKE_C_COMPILER}")
  message(STATUS "  CMAKE_CXX_COMPILER:       ${CMAKE_CXX_COMPILER}")
  message(STATUS "  C_FLAGS:                  ${CMAKE_C_FLAGS}")
  message(STATUS "  CXX_FLAGS:                ${CMAKE_CXX_FLAGS}")
  if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    message(STATUS "  C_FLAGS_DEBUG:            ${CMAKE_C_FLAGS_DEBUG}")
    message(STATUS "  CXX_FLAGS_DEBUG:          ${CMAKE_CXX_FLAGS_DEBUG}")
  endif ()
  if (CMAKE_BUILD_TYPE STREQUAL "Release")
    message(STATUS "  C_FLAGS_RELEASE:          ${CMAKE_C_FLAGS_RELEASE}")
    message(STATUS "  CXX_FLAGS_RELEASE:        ${CMAKE_CXX_FLAGS_RELEASE}")
  endif ()
  if (CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
    message(STATUS "  C_FLAGS_RELWITHDEBINFO:   ${CMAKE_C_FLAGS_RELWITHDEBINFO}")
    message(STATUS "  CXX_FLAGS_RELWITHDEBINFO: ${CMAKE_CXX_FLAGS_RELWITHDEBINFO}")
  endif ()
    if (CMAKE_BUILD_TYPE STREQUAL "MinSizeRel")
    message(STATUS "  C_FLAGS_MINSIZEREL:       ${CMAKE_C_FLAGS_MINSIZEREL}")
    message(STATUS "  CXX_FLAGS_MINSIZEREL:     ${CMAKE_CXX_FLAGS_MINSIZEREL}")
  endif ()
  message(STATUS "  CMAKE_BINARY_DIR:         ${CMAKE_BINARY_DIR}")
  message(STATUS "  ENABLE_NLS:               ${ENABLE_NLS}")
  message(STATUS "  GETTEXT_PACKAGE:          ${GETTEXT_PACKAGE}")

  if(WIN32)
    message(STATUS "Windows summary")
    message(STATUS "  WITH_CONSOLE:                ${WITH_CONSOLE}")
    message(STATUS "  CMAKE_PREFIX_PATH:           ${CMAKE_PREFIX_PATH}")
    message(STATUS "  CMAKE_FIND_LIBRARY_PREFIXES: ${CMAKE_FIND_LIBRARY_PREFIXES}")
    message(STATUS "  CMAKE_FIND_LIBRARY_SUFFIXES: ${CMAKE_FIND_LIBRARY_SUFFIXES}")
  endif()

  if(WIN32)
    message(STATUS "  HAVE_MINGW:              ${HAVE_MINGW}")
    message(STATUS "  HAVE_MINGW64:            ${HAVE_MINGW64}")
    message(STATUS "  MINGW_PATH:              ${MINGW_PATH}")
    message(STATUS "  MINGW_ARCH:              ${MINGW_ARCH}")
    message(STATUS "  MINGW_ARCH_PATH:         ${MINGW_ARCH_PATH}")

    if(NOT HAVE_MSYS2)
      message(STATUS "  DEVLIBS_PATH:            ${DEVLIBS_PATH}")
      message(STATUS "  DEVLIBS_LIB:             ${DEVLIBS_LIB}")
      message(STATUS "  DEVLIBS_BIN:             ${DEVLIBS_BIN}")
      message(STATUS "  PKG_CONFIG_PATH:         ${PKG_CONFIG_PATH}")
    endif()
  endif ()
endif()
