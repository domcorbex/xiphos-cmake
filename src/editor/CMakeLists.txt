# Xiphos build script
# The Xiphos Developement Team
#
# build editor

if (USE_WEBKIT_EDITOR)
  list (APPEND editor_sources
    link_dialog.c
    editor.c
    webkit_editor.c
    )
else ()
  list (APPEND editor_sources
    slib-editor.c
    link_dialog.c
    )
endif ()

if (WIN32)
  include_directories(../../win32/include)
endif (WIN32)

add_library (libeditor ${editor_sources})
