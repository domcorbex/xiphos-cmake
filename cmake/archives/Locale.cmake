# Xiphos build script
# The Xiphos Developement Team
#
# configure i18n

#
set (GETTEXT_PACKAGE "${PROJECT_NAME}")


# generate .gmo files
if (GETTEXT_FOUND)
  # create i18n dir
  set (CMAKE_CURRENT_BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/i18n)

  # copy po files into the current binary directory
  file (GLOB PO_FILES po/*.po)
  file (COPY ${PO_FILES} DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
  # get list of translations files
  file (READ ${CMAKE_SOURCE_DIR}/po/LINGUAS linguas)
  # transform list to a cmake regular list
  string (REGEX MATCHALL "[a-zA-Z_]+" langs "${linguas}")
  # create and install gmo files
  gettext_process_pot_file(
    ${CMAKE_SOURCE_DIR}/po/xiphos.pot
    ALL
    INSTALL_DESTINATION ${PACKAGE_LOCALE_DIR}
    LANGUAGES ${langs}
    )
  # reset current binary dir
  set (CMAKE_CURRENT_BINARY_DIR ${CMAKE_BINARY_DIR})
endif ()

message ("${CMAKE_CURRENT_BINARY_DIR}")
#message ("${CMAKE_SOURCE_DIR}")
#message ("${GETTEXT_MSGFMT_EXECUTABLE}")
#message ("COMMAND ${GETTEXT_MSGFMT_EXECUTABLE} --desktop --template=${PROJECT_NAME}.desktop.in -d ${CMAKE_SOURCE_DIR}/po -o ${PROJECT_NAME}.desktop")

# generate xiphos.desktop file from template
if ( GETTEXT_FOUND AND (NOT WIN32))
  # copy xiphos.desktop.in
  configure_file (${CMAKE_SOURCE_DIR}/cmake/${PROJECT_NAME}.desktop.cmake.in ${PROJECT_NAME}.desktop.in)
  # add translations to xiphos.desktop
#  add_custom_command(
#    OUTPUT ${PROJECT_NAME}.desktop
#    COMMAND ${GETTEXT_MSGFMT_EXECUTABLE} --desktop --template=${PROJECT_NAME}.desktop.in -d ${CMAKE_SOURCE_DIR}/po -o ${PROJECT_NAME}.desktop
#    MAIN_DEPENDENCY ${PROJECT_NAME}.desktop.in
#)
  add_custom_command(
    OUTPUT xiphos.desktop
    COMMAND ${GETTEXT_MSGFMT_EXECUTABLE} --desktop --template=xiphos.desktop.in -d ${CMAKE_SOURCE_DIR}/po/ -o xiphos.desktop
    MAIN_DEPENDENCY xiphos.desktop.in
    )
  # install xiphos.desktop file
  install (FILES ${PROJECT_NAME}.desktop}
    DESTINATION  ${SHARE_INSTALL_PREFIX}/share/applications)
endif ()
