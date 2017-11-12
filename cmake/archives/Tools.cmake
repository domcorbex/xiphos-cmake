# TODO: Ass header and Licence, clean-up code, add documentation
#
# Tools.cmake
#
# Provides functions to run tools.
#
# Functions:
#
# glib_genmarshal(_output_filename_noext _prefix _marshallist_filename)
#    runs glib-genmarshal to process ${_marshallist_filename} to ${_output_filename_noext}.c
#    and ${_output_filename_noext}.h files in the current binary directory, using
#    the ${_prefix} as the function prefix.
#
# dbus-binding-tool(_output_h _files_prefix _xml)
#    runs dbus-binding-tool to generate DBus code from _xml file description,
#    using _output_h, _files_prefix and _xml as arguments.
#

#include(PkgConfigEx)
#include(UninstallTarget)


find_program(GLIB_GENMARSHAL glib-genmarshal)
if(NOT GLIB_GENMARSHAL)
  message(FATAL_ERROR "Cannot find glib-genmarshal, which is required to build ${PROJECT_NAME}")
endif(NOT GLIB_GENMARSHAL)

function(glib_genmarshal _output_filename_noext _prefix _marshallist_filename)
  message(STATUS "Marshalling ${CMAKE_CURRENT_SOURCE_DIR}/${_marshallist_filename}")
#  message("output=${CMAKE_CURRENT_BINARY_DIR}/${_output_filename_noext}.h")
#  message("command=${GLIB_GENMARSHAL} --header --prefix=${_prefix} ${CMAKE_CURRENT_SOURCE_DIR}/${_marshallist_filename} > ${CMAKE_CURRENT_BINARY_DIR}/${_output_filename_noext}.h.tmp")
  add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${_output_filename_noext}.h
    COMMAND ${CMAKE_COMMAND} -E touch ${CMAKE_BINARY_DIR}/${_output_filename_noext}.h
    COMMAND ${GLIB_GENMARSHAL} --header --prefix=${_prefix} ${CMAKE_CURRENT_SOURCE_DIR}/${_marshallist_filename} > ${CMAKE_CURRENT_BINARY_DIR}/${_output_filename_noext}.h.tmp
    COMMAND ${CMAKE_COMMAND} -E rename ${CMAKE_CURRENT_BINARY_DIR}/${_output_filename_noext}.h.tmp ${CMAKE_CURRENT_BINARY_DIR}/${_output_filename_noext}.h
    DEPENDS ${_marshallist_filename}
    )

  add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${_output_filename_noext}.c
    COMMAND ${CMAKE_COMMAND} -E touch ${CMAKE_BINARY_DIR}/${_output_filename_noext}.c
#    COMMAND ${CMAKE_COMMAND} -E echo " #include \\\"${_output_filename_noext}.h\\\"" >${CMAKE_CURRENT_BINARY_DIR}/${_output_filename_noext}.c.tmp
    COMMAND ${GLIB_GENMARSHAL} --body --prefix=${_prefix} "${CMAKE_CURRENT_SOURCE_DIR}/${_marshallist_filename}" >>${CMAKE_CURRENT_BINARY_DIR}/${_output_filename_noext}.c.tmp
    COMMAND ${CMAKE_COMMAND} -E rename ${CMAKE_CURRENT_BINARY_DIR}/${_output_filename_noext}.c.tmp ${CMAKE_CURRENT_BINARY_DIR}/${_output_filename_noext}.c
    DEPENDS ${_marshallist_filename}
    )
endfunction(glib_genmarshal)

find_program(DBUS_BINDING_TOOL dbus-binding-tool)
if(NOT DBUS_BINDING_TOOL)
  message(FATAL_ERROR "Cannot find dbus-binding-tool, which is required to build ${PROJECT_NAME}")
endif(NOT DBUS_BINDING_TOOL)

# dbus-binding
function(dbus_binding_tool _output_filename_noext _symbol_prefix _xml)
  message(STATUS "dbus binding ${_xml}")
#  message("command=${DBUS_BINDING_TOOL} --mode=glib-server --output=${CMAKE_CURRENT_BINARY_DIR}/${_output_filename_noext}.h --prefix=${_symbol_prefix} ${CMAKE_CURRENT_SOURCE_DIR}/${_xml}")
  add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${_output_filename_noext}.h
    COMMAND ${DBUS_BINDING_TOOL}
    --mode=glib-server
    --output=${CMAKE_CURRENT_BINARY_DIR}/${_output_filename_noext}.h
    --prefix=${_symbol_prefix}
    ${CMAKE_CURRENT_SOURCE_DIR}/${_xml}
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${_xml}
    )
endfunction(dbus_binding_tool)





