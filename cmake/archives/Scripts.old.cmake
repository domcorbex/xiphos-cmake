# Xiphos build script
# The Xiphos Developement Team
#
# Xiphos utility scripts to run before build

ADD_CUSTOM_COMMAND (
  OUTPUT (
    ${CMAKE_CURRENT_SOURCE_DIR}/src/gnome2/marshal.h
    ${CMAKE_CURRENT_SOURCE_DIR}/src/gnome2/marshal.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/webkit/marshal.h
    ${CMAKE_CURRENT_SOURCE_DIR}/src/webkit/marshal.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/xiphos-html/marshal.h
    ${CMAKE_CURRENT_SOURCE_DIR}/src/xiphos-html/marshal.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/gnome2/ipc-interface.h
    ${CMAKE_CURRENT_SOURCE_DIR}/src/gnome2/locale_set.c
    )
  # Marshalling
  COMMAND glib-genmarshal
  ARGS
  ${CMAKE_CURRENT_SOURCE_DIR}/src/gnome2/marshal.list
  --prefix=ipc_marshal
  --header > ${CMAKE_CURRENT_SOURCE_DIR}/src/gnome2/marshal.h
  MAIN_DEPENDENCY ${CMAKE_CURRENT_SOURCE_DIR}/src/gnome2/marshal.list

  COMMAND glib-genmarshal
  ARGS
  ${CMAKE_CURRENT_SOURCE_DIR}/src/gnome2/marshal.list
  --prefix=ipc_marshal
  --body > ${CMAKE_CURRENT_SOURCE_DIR}/src/gnome2/marshal.c
  MAIN_DEPENDENCY ${CMAKE_CURRENT_SOURCE_DIR}/src/gnome2/marshal.list

  COMMAND glib-genmarshal
  ARGS
  ${CMAKE_CURRENT_SOURCE_DIR}/src/webkit/marshal.list
  --prefix=wk_marshal
  --header > ${CMAKE_CURRENT_SOURCE_DIR}/src/webkit/marshal.h
  MAIN_DEPENDENCY ${CMAKE_CURRENT_SOURCE_DIR}/src/webkit/marshal.list

  COMMAND glib-genmarshal
  ARGS
  ${CMAKE_CURRENT_SOURCE_DIR}/src/webkit/marshal.list
  --prefix=wk_marshal
  --body > ${CMAKE_CURRENT_SOURCE_DIR}/src/webkit/marshal.c
  MAIN_DEPENDENCY ${CMAKE_CURRENT_SOURCE_DIR}/src/webkit/marshal.list

  COMMAND glib-genmarshal
  ARGS
  ${CMAKE_CURRENT_SOURCE_DIR}/src/xiphos_html/marshal.list
  --prefix=xihtml_marshal
  --header > ${CMAKE_CURRENT_SOURCE_DIR}/src/xiphos_html/marshal.h
  MAIN_DEPENDENCY ${CMAKE_CURRENT_SOURCE_DIR}/src/xiphos_html/marshal.list

  COMMAND glib-genmarshal
  ARGS
  ${CMAKE_CURRENT_SOURCE_DIR}/src/xiphos_html/marshal.list
  --prefix=xihtml_marshal
  --body > ${CMAKE_CURRENT_SOURCE_DIR}/src/xiphos_html/marshal.c
  MAIN_DEPENDENCY ${CMAKE_CURRENT_SOURCE_DIR}/src/xiphos_html/marshal.list

  COMMAND dbus-binding-tool
  ARGS
  --mode=glib-server
  --output=${CMAKE_CURRENT_SOURCE_DIR}/src/gnome2/ipc-interface.h
  --prefix=ipc_object ${CMAKE_CURRENT_SOURCE_DIR}/src/gnome2/ipc-interface.xml
  MAIN_DEPENDENCY ${CMAKE_CURRENT_SOURCE_DIR}/src/gnome2/ipc-interface.xml

  # convert LINGUAS file into C source file
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/src/gnome2/make-locale-set.sh
  ARGS
  ${CMAKE_CURRENT_SOURCE_DIR}/po/LINGUAS > ${CMAKE_CURRENT_SOURCE_DIR}/src/gnome2/locale_set.c
  MAIN_DEPENDENCY ${CMAKE_CURRENT_SOURCE_DIR}/po/LINGUAS

  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  COMMENT "Running Xiphos script files"
  )
