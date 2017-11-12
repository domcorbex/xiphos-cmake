# Xiphos build script
# The Xiphos Developement Team
#
# TODO: create a new directory:  desktop
#       move the related files into this new desktop directory
#       move this script to CMakelists.txt in the desktop directory


# configuring and installing desktop files:
# xiphos.desktop, man pages, xiphos.appdata.xml, icon


# desktop file
# configuration file describing how a particular program is to be launched
# and how it appears in menus
# TODO: validate xiphos.desktop file
if ( GETTEXT_FOUND AND (NOT WIN32))
  message(STATUS "Configuring ${PROJECT_NAME}.desktop file")
  # generate xiphos.desktop.in file from template
  configure_file (${CMAKE_SOURCE_DIR}/cmake/${PROJECT_NAME}.desktop.cmake.in ${PROJECT_NAME}.desktop.in)
  # add translations to xiphos.desktop
  add_custom_target(desktop_file ALL
    ${GETTEXT_MSGFMT_EXECUTABLE} --desktop --template=${PROJECT_NAME}.desktop.in -d ${CMAKE_SOURCE_DIR}/po -o ${PROJECT_NAME}.desktop
    COMMENT ("Building ${PROJECT_NAME}.desktop file.")
    )
    # install xiphos.desktop file
  install (FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.desktop
    DESTINATION  ${CMAKE_INSTALL_DATADIR}/applications)
endif ()


# Icon
# describe what an application is, for use in the Programs menu
# TODO: on uninstall run gtk-update-icon-cache
# install icon
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/pixmaps/xiphos.svg
  DESTINATION ${CMAKE_INSTALL_DATADIR}/icons/hicolor/scalable/apps)

# run gtk-update-icon-cache to create a cache file for icon theme
IF (WITH_POSTINST)
  # check that gtk-update-icon-cache is installed
  find_program (GTK_UPDATE_ICON_CACHE gtk-update-icon-cache)
  if (GTK_UPDATE_ICON_CACHE)
    # gtk-update-icon-cache was found
    message (STATUS "Installing gtk-update-icon-cache.")
    # run gtk-update-icon as a post-building command
    set(_update_icon_cache_cmd
      "${GTK_UPDATE_ICON_CACHE} -f -t ${CMAKE_INSTALL_FULL_DATADIR}/icons/hicolor")
    install(CODE
      "execute_process(
       COMMAND ${CMAKE_COMMAND} -E chdir . ${_update_icon_cache_cmd}
       )"
      )
  else (GTK_UPDATE_ICON_CACHE)
    # gtk-update-icon-cache was not found
    message(WARNING "gtk-update-icon-cache not found.
  Make sure to call ${GTK_UPDATE_ICON_CACHE} -f -t \"${CMAKE_INSTALL_DATADIR}/icons/hicolor\" after install and uninstall")
  endif (GTK_UPDATE_ICON_CACHE)
endif (WITH_POSTINST)


# xiphos.appdata.xml
# provides specifications for things like an unified software metadata database,
# screenshot services and various other things needed to create user-friendly
# application-centers for software distributions.
# TODO: validate xml file (appstream-util validate validate-relax --nonet xiphos.appdata.xml)
if (UNIX)
  message (STATUS "Configuring the AppData metadata file")
  # add translations to xiphos.appdata.xml
  add_custom_target(appdata_xml ALL
    COMMAND ${GETTEXT_MSGFMT_EXECUTABLE} --xml --template "${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}.appdata.xml" -d "${CMAKE_SOURCE_DIR}/po" -o "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.appdata.xml"
    COMMENT "Building appdata.xml file"
    )
  # validate file
#  add_test(validate_appdata
#    appstream-util validate validate-relax --nonet xiphos.appdata.xml
#    )
  # install file
  install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.appdata.xml
    DESTINATION ${CMAKE_INSTALL_METAINFODIR})
endif ()


# man pages
# TODO: make man pages translatable
if (UNIX)
  message (STATUS "Building man pages")
  # configure xiphos man page
  configure_file (${CMAKE_CURRENT_SOURCE_DIR}/cmake/${PROJECT_NAME}.1.in
    ${PROJECT_NAME}.1)
  # install xiphos man pages
  install (
    FILES
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.1
    DESTINATION ${CMAKE_INSTALL_MANDIR}/man1
    )

  if (HAVE_DBUS)
    # configure xiphos-nav man page
    configure_file (${CMAKE_CURRENT_SOURCE_DIR}/cmake/${PROJECT_NAME}-nav.1.in
      ${PROJECT_NAME}-nav.1)
    # install xiphos-nav man pages
    install (
      FILES
      ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-nav.1
      DESTINATION ${CMAKE_INSTALL_MANDIR}/man1
      )
  endif (HAVE_DBUS)

endif (UNIX)
