# Xiphos build script
# The Xiphos Development Team
#
# Create config.h

message (STATUS "Generating config.h")

# pixmaps dir
set (PACKAGE_PIXMAPS_DIR "${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}")

# locale dir
set (PACKAGE_LOCALE_DIR "${CMAKE_INSTALL_LOCALEDIR}")

# share dir
set (SHARE_DIR "${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}")

# textdomain
set (GETTEXT_PACKAGE "${PROJECT_NAME}")

# webkit editor
if (NOT WITH_GTKHTML)
  set (USE_WEBKIT_EDITOR ON)
endif ()

# Gtk
if (NOT WITH_GTK2)
  set (USE_GTK_3 ON)
  set (USE_GTKBUILDER ON)
endif ()

# select WebkitGtk
if (NOT WITH_WEBKIT1)
  set (USE_WEBKIT2 ON)
endif ()

# enable dBus
if (WITH_DBUS)
  set (HAVE_DBUS ON)
endif()

# chatty
if (WITH_CHATTY)
  set (CHATTY ON)
endif ()

# debug
if (WITH_DEBUG)
  set (DEBUG ON)
endif ()

# generate config.h
set (CONFIG_H ${CMAKE_CURRENT_BINARY_DIR}/config.h)
configure_file (${CMAKE_CURRENT_SOURCE_DIR}/cmake/config.h.cmake.in ${CONFIG_H})
add_definitions (-DHAVE_CONFIG_H)

# include config.h
include_directories ("${CMAKE_CURRENT_BINARY_DIR}")
