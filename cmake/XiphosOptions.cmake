# Xiphos build script
# The Xiphos Development Team
#
# manage CMAKE options


# set CMake options that the user can optionally select ON or OFF
option (WITH_GTK2     "Force UI build with Gtk2 instead of Gtk3."      OFF)
option (WITH_GTKHTML  "Force gtkhtml editor instead of webkit editor." OFF)
option (WITH_WEBKIT1  "Force webkit1 instead of webkit2."              ON)
option (WITH_DBUS     "Use the Xiphos dbus API."                       ON)
option (WITH_CHATTY   "Enable lots of tracing."                        OFF)
option (WITH_HELP     "Creating help files."                           ON)
option (WITH_MSHELP   "Creating Windows© Help file"                    OFF)
option (WITH_PDFHELP  "Creating PDF Help"                              OFF)
option (WITH_DB_HELP  "With docbook style Help."                       OFF)
option (WITH_I18N     "Native Language Support."                       ON)
option (WITH_STRIP    "Strip resulting binary (Release only)."         ON)
option (WITH_DEBUG    "Enable Xiphos gui debugging functions."         OFF)
option (WITH_DELINT   "Build with: -Wall -Werror."                     OFF)
option (WITH_CONSOLE  "Enable console window in win32."                OFF)
option (WITH_POSTINST "Enable post-install tasks."                     ON)
set (HELPDIR ${CMAKE_INSTALL_DATADIR}/gnome/help/${PROJECT_NAME}
  CACHE STRING "user documentation [default: ${CMAKE_INSTALL_DATADIR}/gnome/help/${PACKAGE}]")


# warn about Webkit2 editor not yet implemented
if ((NOT WITH_WEBKIT1) AND (NOT WITH_GTKHTML))
  message (AUTHOR_WARNING "Webkit2 and the WebKit2-editor were both selected ON, but integration of the Webkit2 editor is a work in progress. Expect build failures and errors.")
endif ()


# set build type
# Default possible values are empty, Debug, Release, RelWithDebInfo and MinSizeRel.
set (DEFAULT_BUILD_TYPE "Release")
if (NOT CMAKE_BUILD_TYPE)
  message (STATUS "Setting build type to '${DEFAULT_BUILD_TYPE}' as none was specified.")
  set(CMAKE_BUILD_TYPE "${DEFAULT_BUILD_TYPE}")
endif()


# win32 specific
if (WIN32)
  # do not install the package description file
  set (WITH_POSTINST OFF)

  # TODO: use chmcmd or hhc to generate help files
  set (WITH_HELP OFF)
endif (WIN32)
