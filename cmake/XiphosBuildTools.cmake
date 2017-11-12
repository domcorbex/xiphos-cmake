# Xiphos build script
# The Xiphos Development Team
#

# check for utilities needed for building Xiphos


function (xiphos_find_program cmd_name cmd_exec)
  message (STATUS "Looking for ${cmd_exec}")
  find_program(${cmd_name} ${cmd_exec})
  if(${cmd_name})
    message (STATUS "Looking for ${cmd_exec} - found")
  else()
    message(FATAL_ERROR "Cannot find ${cmd_exec}, which is required to build ${PROJECT_NAME}")
  endif()
endfunction ()


xiphos_find_program (GLIB_GENMARSHAL glib-genmarshal)

if (WITH_DBUS)
  xiphos_find_program (DBUS_BINDING_TOOL dbus-binding-tool)
endif (WITH_DBUS)


if (UNIX)
  xiphos_find_program (DESKTOP_FILE_VALIDATE desktop-file-validate)
  xiphos_find_program (APPSTREAM_UTIL appstream-util)
  xiphos_find_program (XMLLINT xmllint)
  xiphos_find_program (YELP_BUILD yelp-build)
endif (UNIX)


if (WITH_I18N)
  xiphos_find_program (ITSTOOL itstool)
endif (WITH_I18N)


if (WITH_MSHELP)
  if (WIN32)
    xiphos_find_program (HHC_EXE hhc.exe)
  else (WIN32)
    xiphos_find_program (CHMCMD chmcmd)
  endif (WIN32)
endif (WITH_MSHELP)


if (WITH_PDFHELP)
  xiphos_find_program (HTMLDOC htmldoc)
endif (WITH_PDFHELP)
