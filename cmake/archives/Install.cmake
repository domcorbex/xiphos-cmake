

# install ui files
file (GLOB ui_files
  ${CMAKE_CURRENT_SOURCE_DIR}/pixmaps/*.png
  ${CMAKE_CURRENT_SOURCE_DIR}/pixmaps/*.xpm
  ${CMAKE_CURRENT_SOURCE_DIR}/pixmaps/*.ico
  ${CMAKE_CURRENT_SOURCE_DIR}/ui/*.glade
  ${CMAKE_CURRENT_SOURCE_DIR}/ui/*.gtkbuilder
  ${CMAKE_CURRENT_SOURCE_DIR}/ui/*.xml
  ${CMAKE_CURRENT_SOURCE_DIR}/ui/*.png
  ${CMAKE_CURRENT_SOURCE_DIR}/ui/languages
  ${CMAKE_CURRENT_SOURCE_DIR}/ui/*.ui
  )
install (FILES ${ui_files}
  DESTINATION ${PACKAGE_PIXMAPS_DIR})

# install icon
#install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/pixmaps/xiphos.svg
#  DESTINATION ${SHARE_INSTALL_PREFIX}/icons/hicolor/scalable/apps)

# install .desktop file
#if (NOT WIN32)
#  install (FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.desktop
#    DESTINATION ${SHARE_INSTALL_PREFIX}/share/applications)
#endif ()

# install appdata.xml
#if (NOT WIN32)
#  install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}.appdata.xml
#    DESTINATION ${CMAKE_INSTALL_METAINFODIR})
#endif ()

# man pages
#if (unix)
  # install man pages
#  install (FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.1
#    DESTINATION ${CMAKE_INSTALL_PREFIX}/man/man1)
#  install (FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-nav.1
#    DESTINATION ${CMAKE_INSTALL_PREFIX}/man/man1)
#endif (unix)

# post-install tasks
#if (unix)
  # remainder to create a script to:
  #           gnome.postinstall_scrollkeeper('xiphos') # Installing the user docs
  # now the scrollkeeper update if we can write to the log file
  #		if os.access('/var/log/scrollkeeper.log', os.W_OK):
  #			dir1 = Build.bld.get_install_path('${PREFIX}/var/scrollkeeper')
  #			dir2 = Build.bld.get_install_path('${DATAROOTDIR}/omf/%s' % prog_name)
  #			command = 'scrollkeeper-update -q -p %s -o %s' % (dir1, dir2)
  #			ret = Utils.exec_command(command)

  #           gnome.postinstall_icons() # Updating the icon cache
  # update the pixmap cache directory
  #			Utils.pprint('YELLOW', "Updating Gtk icon cache.")
  #			command = 'gtk-update-icon-cache -q -f -t %s' % dir
  #			ret = Utils.exec_command(command)
  #		else:
  #			Utils.pprint('YELLOW', 'Icon cache not updated. After install, run this:')
  #			Utils.pprint('YELLOW', 'gtk-update-icon-cache -q -f -t %s' % dir)

  #Options:
  # -o DIR			Use the specified omf directories for
  #   				conversion. Multiple directories can be
  #				specified using colon (:) separator.
  # -r DIR			Use the specified directory for the resulting
  #				scrolls.  If the directory doesn't exist, it
  #				will be created at run time.
  #				 Note: Multiple output paths are not supported
  # --c				Rebuild the index entirely.  This will rebuild
  #				all scroll files and may take a long time.
  # -v				Turn Verbosity on.
  # -p				Specify a different place to store the mtimes file.
  # -q				Run silently (default).

#  add_custom_target (scrollkeeper ALL
#    COMMAND scrollkeeper-update -q -p ${CMAKE_INSTALL_PREFIX}/var/scrollkeeper -o ${SHARE_INSTALL_PREFIX}/omf/${PROJECT_NAME}
#    )
#  add_custom_target (update_icon_cache ALL
#    COMMAND gtk-update-icon-cache --quiet --force --ignore-theme-index ${SHARE_INSTALL_PREFIX}/icons/hicolor
#    )

#endif (unix)
