# Xiphos build script
# The Xiphos Developement Team
#
# building xiphos-nav

if (HAVE_DBUS)
  message (STATUS "Building ${PROJECT_NAME}-nav")


  # need first to generate: ipc-interface.h
  add_custom_command (OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/ipc-interface.h
    # process ipc-interface.xml to generate ipc-interface.h
    COMMAND ${DBUS_BINDING_TOOL}
    ARGS
    --mode=glib-client
    --output=${CMAKE_CURRENT_BINARY_DIR}/ipc-interface.h
    --prefix=ipc_object ${CMAKE_CURRENT_SOURCE_DIR}/../gnome2/ipc-interface.xml
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    COMMENT "Generating src/example/ipc-interface.h"
    )


  # list of sources files
  set(nav_sources
    xiphos-nav.c
    )

  # list of headers
  set (nav_headers
    ${CMAKE_CURRENT_BINARY_DIR}/ipc-interface.h
    )

  # include the directory where are stored the generated files
  include_directories (${CMAKE_CURRENT_BINARY_DIR})

  # build xiphos-nav
  add_executable (
    ${PROJECT_NAME}-nav
    ${nav_sources}
    ${nav_headers}
    )

  # install executable
  install (TARGETS ${PROJECT_NAME}-nav
    DESTINATION ${CMAKE_INSTALL_BINDIR})

endif (HAVE_DBUS)
