# Xiphos build script
# The Xiphos Developement Team
#
# building webkit

# marshalling
add_custom_command (
  OUTPUT (
    ${CMAKE_CURRENT_BINARY_DIR}/marshal.h
    ${CMAKE_CURRENT_BINARY_DIR}/marshal.c
    )
  # Marshalling
  COMMAND ${GLIB_GENMARSHAL}
  ARGS
  ${CMAKE_CURRENT_SOURCE_DIR}/marshal.list
  --prefix=wk_marshal
  --header > ${CMAKE_CURRENT_BINARY_DIR}//marshal.h
  MAIN_DEPENDENCY ${CMAKE_CURRENT_SOURCE_DIR}/marshal.list

  COMMAND ${GLIB_GENMARSHAL}
  ARGS
  ${CMAKE_CURRENT_SOURCE_DIR}/marshal.list
  --prefix=wk_marshal
  --body > ${CMAKE_CURRENT_BINARY_DIR}/marshal.c
  MAIN_DEPENDENCY ${CMAKE_CURRENT_SOURCE_DIR}/marshal.list

  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
  COMMENT "Generating webkit files"
  )

# local and generated sources
list (APPEND wk_sources
  wk-html.c
  wk-html.h
  ${CMAKE_CURRENT_BINARY_DIR}/marshal.h
  ${CMAKE_CURRENT_BINARY_DIR}/marshal.c
  )

# the following files are tagged as generated during the build
set_source_files_properties(${CMAKE_CURRENT_BINARY_DIR}/marshal.h PROPERTIES GENERATED 1)
set_source_files_properties(${CMAKE_CURRENT_BINARY_DIR}/marshal.c PROPERTIES GENERATED 1)

# include the directory where are generated these files
include_directories(${CMAKE_CURRENT_BINARY_DIR})

# build
add_library (libwebkit ${wk_sources})
