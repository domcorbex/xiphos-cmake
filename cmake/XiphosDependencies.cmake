# Xiphos build script
# The Xiphos Developement Team
#
# TODO: as pkg-config is typically found on Unix-like systems,
#       it should be avoided, and replaced by Find*.cmake commands
#       (although a bunch has to be written from scratch.)


# Detect unknown platform
IF( NOT WIN32 AND NOT(CMAKE_SYSTEM_NAME STREQUAL Linux))
  message("-- Assuming ${CMAKE_SYSTEM_NAME} is UNIX like platform")
ENDIF()


if (NOT MINGW)
  # list required dependencies
  list (APPEND CORE_DEPS "sword>=1.7.904;icu-i18n;biblesync>=1.1.2;uuid;gconf-2.0;glib-2.0;gmodule-2.0;libgsf-1>=1.14;libxml-2.0>=2.7.8")
  list (APPEND OPTS_DEPS "gtk+-unix-print-2.0")
  list (APPEND GNOME_DEPS "atk;cairo;gdk-3.0;gdk-pixbuf-2.0;gio-2.0;gobject-2.0;libsoup-2.4;pango")
  list (APPEND GTK2_DEPS "gtk+-2.0>=2.14;libglade-2.0;webkit-1.0")
  list (APPEND GTK2_HTMLEDIT_DEPS "gtkhtml-editor-3.14;libgtkhtml-3.14 >= 3.23")
  list (APPEND GTK2_WKITEDIT_DEPS "gtk+-2.0 >= 2.24")
  list (APPEND GTK3_DEPS "gtk+-3.0")
  list (APPEND GTK3_WEBKIT1_DEPS "webkitgtk-3.0")
  list (APPEND GTK3_WEBKIT2_DEPS "webkit2gtk-4.0")
  list (APPEND GTK3_HTMLEDIT_DEPS "gtkhtml-editor-4.0;libgtkhtml-4.0")
  list (APPEND GTK3_WKITEDIT_DEPS "")

  # list optional dependencies
  list (APPEND DBUS_DEPS "dbus-glib-1")

  # set dependencies
  IF (WITH_GTK2)
    # Gtk2 + webkit1
    list (APPEND DEPS_REQUIRED ${GTK2_DEPS})
    IF (WITH_GTKHTML)
      # Gtk2 + webkit1 + Gtkhtml-3.14
      list (APPEND DEPS_REQUIRED ${GTK2_HTMLEDIT_DEPS})
    ELSE (WITH_GTKHTML)
      # Gtk2 + webkit1 + WebKit1 editor
      list (APPEND DEPS_REQUIRED ${GTK2_WKITEDIT_DEPS})
    ENDIF (WITH_GTKHTML)

  ELSE (WITH_GTK2)
    # Gtk3
    list (APPEND DEPS_REQUIRED ${GTK3_DEPS})

    IF (WITH_GTKHTML)
      # Gtk3 + Gtkhtml-4
      list (APPEND DEPS_REQUIRED ${GTK3_HTMLEDIT_DEPS})
      IF (WITH_WEBKIT1)
	# Gtk3 + Gtkhtml-4 + webkit1
	list (APPEND DEPS_REQUIRED ${GTK3_WEBKIT1_DEPS})
      ELSE (WITH_WEBKIT1)
	# Gtk3 + Gtkhtml-4 + webkit2
	list (APPEND DEPS_REQUIRED ${GTK3_WEBKIT2_DEPS})
      ENDIF (WITH_WEBKIT1)

    ELSE (WITH_GTKHTML)
      # Gtk3 + webkit-editor
      IF (WITH_WEBKIT1)
	# Gtk3 + webkit1 + webkit1 editor
	list (APPEND DEPS_REQUIRED ${GTK3_WEBKIT1_DEPS})
      ELSE (WITH_WEBKIT1)
	# Gtk3 + Webkit2 + webkit2 editor
	list (APPEND DEPS_REQUIRED ${GTK3_WEBKIT2_DEPS})
      ENDIF (WITH_WEBKIT1)
    ENDIF (WITH_GTKHTML)

  ENDIF (WITH_GTK2)

  # gnome deps
  list (APPEND DEPS_REQUIRED ${GNOME_DEPS} ${CORE_DEPS})

  # dbus deps
  IF (WITH_DBUS)
    list (APPEND DEPS_REQUIRED ${DBUS_DEPS})
  ENDIF()

else (NOT MINGW)
  add_directory (win32)
endif ()

# find gettext
include (FindGettext)
if (GETTEXT_FOUND)
  message (STATUS "Setting up locales")
else ()
  message (STATUS "Gettext not found! Native Language Support disabled.")
endif ()
# warn if obsolete version
if(GETTEXT_VERSION_STRING VERSION_LESS "0.19.7")
  message (WARNING "Your Gettext version (${GETTEXT_VERSION_STRING} is not supported (<0.19.7).")
endif ()

# now let's actually check for the required dependencies
find_package(PkgConfig REQUIRED)
pkg_check_modules(DEPS REQUIRED ${DEPS_REQUIRED})


# include deps headers
include_directories(${DEPS_INCLUDE_DIRS})
link_libraries(${DEPS_LIBRARIES})
link_directories(${DEPS_LIBRARY_DIRS})

# include local headers
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/src")
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/src)
