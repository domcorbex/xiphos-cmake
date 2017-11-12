# Xiphos build script
# The Xiphos Developement Team
#
# help files
# code grabbed from evolution
# https://git.gnome.org/browse/evolution/tree/help

# i18n checks
find_program (XML2PO xml2po)
if (NOT XML2PO)
  message (STATUS "xml2po not found: localized help disabled.")
  set (WITH_I18N_HELP OFF)
  else ()
  set (WITH_I18N_HELP ON)
endif ()

if (WIN32)
  message (STATUS "help disabled. Building .chm files for Windows is not implemented.")
  set (WITH_HELP OFF)
endif ()

# start
if (WITH_HELP)
  message (STATUS "Building Help files")

  # create build/help dir
  set (CMAKE_CURRENT_BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/help)

  set (HELP_ID ${PROJECT_NAME})

  # directories
  if (WITH_DB_HELP)
   set (SOURCE_HELP_DIR help)
  else ()
   set (SOURCE_HELP_DIR mallard)
  endif ()
  set(HELP_FIGURES_DIR figures)

  # help files
  set (HELP_FILES
    xiphos.xml
    introduction.xml
    interface.xml
    start.xml
    preferences.xml
    modules.xml
    search.xml
    studypad.xml
    personal.xml
    journals.xml
    onlinehelp.xml
    originallanguage.xml
    legal.xml
    )

  # figures
  set (HELP_MEDIA
    ${HELP_FIGURES_DIR}/first_start.png
    ${HELP_FIGURES_DIR}/gtkhtml3-vs-mozembed.png
    ${HELP_FIGURES_DIR}/interface_biblepane-options.png
    ${HELP_FIGURES_DIR}/interface_biblepane.png
    ${HELP_FIGURES_DIR}/interface_commentarypane.png
    ${HELP_FIGURES_DIR}/interface_dictionary.png
    ${HELP_FIGURES_DIR}/interface_menubar.png
    ${HELP_FIGURES_DIR}/interface_menubar-view.png
    ${HELP_FIGURES_DIR}/interface_parallel.png
    ${HELP_FIGURES_DIR}/interface_parallel-separate.png
    ${HELP_FIGURES_DIR}/interface.png
    ${HELP_FIGURES_DIR}/interface_searchpane.png
    ${HELP_FIGURES_DIR}/interface_shortcut.png
    ${HELP_FIGURES_DIR}/interface_sidepane.png
    ${HELP_FIGURES_DIR}/interface_toolbar.png
    ${HELP_FIGURES_DIR}/interface_viewer.png
    ${HELP_FIGURES_DIR}/journal.png
    ${HELP_FIGURES_DIR}/module.png
    ${HELP_FIGURES_DIR}/personal.png
    ${HELP_FIGURES_DIR}/preferences_fonts-color.png
    ${HELP_FIGURES_DIR}/preferences_fonts-misc.png
    ${HELP_FIGURES_DIR}/preferences_general-misc.png
    ${HELP_FIGURES_DIR}/preferences_general-biblesync.png
    ${HELP_FIGURES_DIR}/preferences_modules-misc.png
    ${HELP_FIGURES_DIR}/preferences_modules-parallel.png
    ${HELP_FIGURES_DIR}/preferences.png
    ${HELP_FIGURES_DIR}/search_search.png
    ${HELP_FIGURES_DIR}/studypad.png
    ${HELP_FIGURES_DIR}/sword3.png
    ${HELP_FIGURES_DIR}/sword_config.png
    ${HELP_FIGURES_DIR}/sword_install.png
    ${HELP_FIGURES_DIR}/sword_remove.png
    ${HELP_FIGURES_DIR}/sword_sources.png
    )

  add_custom_target(help-files ALL)

  macro(create_help_files_for_lang _lang _helpfilesvar)
    set(pofile "${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/${dir}/${_lang}.po")
    set(mofile "${CMAKE_CURRENT_BINARY_DIR}/${dir}/${_lang}.mo")

    if(NOT EXISTS ${pofile})
      message(FATAL_ERROR "Passed incorrect language '${_lang}' to create_help_files_for_lang()")
    else ()
      message(STATUS "Building help files for language '${_lang}'")
    endif(NOT EXISTS ${pofile})

    set(installed)
    set(deps)
    if (WITH_DB_HELP)
      set (HELP_FILES_LIST xiphos.xml)
    else ()
      set (HELP_FILES_LIST ${HELP_FILES})
    endif ()
    foreach(_file ${HELP_FILES_LIST})
      list(APPEND installed ${CMAKE_CURRENT_BINARY_DIR}/${_lang}/${_file})
      list(APPEND deps ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/C/${_file})
      if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/${_lang}/${_file})
	list(APPEND deps ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/${_lang}/${_file})
      endif(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/${_lang}/${_file})
    endforeach(_file)
    foreach(_file ${HELP_MEDIA})
      list(APPEND deps ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/C/${_file})
      if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/${_lang}/${_file})
	list(APPEND deps ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/${_lang}/${_file})
      endif(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/${_lang}/${_file})
    endforeach(_file)

    if (WITH_DB_HELP)
      add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${_lang}/index.page
	COMMAND ${CMAKE_COMMAND} -E make_directory "${CMAKE_CURRENT_BINARY_DIR}/${_lang}"
	COMMAND ${GETTEXT_MSGFMT_EXECUTABLE} -o "${mofile}" "${pofile}"
	COMMAND ${CMAKE_COMMAND} -E env d="${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/C"
	xml2po --expand-all-entities --translation=${mofile} --output=${CMAKE_CURRENT_BINARY_DIR}/${_lang}/xiphos.xml ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/C/xiphos.xml
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/C
	COMMENT "Generating '${_lang}' help files"
	)
    else ()
      # set-up for project-mallard files
      add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${_lang}/index.page
	COMMAND ${CMAKE_COMMAND} -E make_directory "${CMAKE_CURRENT_BINARY_DIR}/${_lang}"
	COMMAND ${GETTEXT_MSGFMT_EXECUTABLE} -o "${mofile}" "${pofile}"
	COMMAND ${CMAKE_COMMAND} -E env d="${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/C"
	itstool -m "${mofile}" ${${_helpfilesvar}} --output ${CMAKE_CURRENT_BINARY_DIR}/${_lang}/
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/C
	COMMENT "Generating '${_lang}' help files"
	)
    endif ()

    add_custom_target(${_lang}-help-files
      DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${_lang}/index.page
      ${pofile}
      ${deps}
      )

    add_dependencies(help-files ${_lang}-help-files)

    # install files
    install(FILES ${installed}
      DESTINATION ${HELPDIR}/${_lang}/
      )

  endmacro(create_help_files_for_lang)

  if (WITH_I18N_HELP)
    file(GLOB directories RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR} ${SOURCE_HELP_DIR}/*)
    foreach(dir ${directories})
      if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/${dir}/${dir}.po")
	list(APPEND helpdeps "${CMAKE_CURRENT_BINARY_DIR}/${dir}/index.page")
	create_help_files_for_lang(${dir} HELP_FILES)

	foreach(_media ${HELP_MEDIA})
	  if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/${dir}/${_media}")
	    install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/${dir}/${_media}
	      DESTINATION ${HELPDIR}/${dir}/${HELP_FIGURES_DIR}/
	      )
	  else(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/${dir}/${_media}")
	    # Pity, no symlink ability here
	    install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/C/${_media}
	      DESTINATION ${HELPDIR}/${dir}/${HELP_FIGURES_DIR}/
	      )
	  endif(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/${dir}/${_media}")
	endforeach(_media)
      endif (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/${dir}/${dir}.po")
    endforeach(dir)
  endif (WITH_I18N_HELP)

  set(cinstalled)
  foreach(_file ${HELP_FILES})
    list(APPEND cinstalled "${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/C/${_file}")
  endforeach(_file)

  install(FILES ${cinstalled}
    DESTINATION ${HELPDIR}/C/
    )

  set(cinstalled)
  foreach(_file ${HELP_MEDIA})
    list(APPEND cinstalled "${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE_HELP_DIR}/C/${_file}")
  endforeach(_file)

  install(FILES ${cinstalled}
    DESTINATION ${HELPDIR}/C/${HELP_FIGURES_DIR}
    )

  # install omf files
  if (WITH_DB_HELP)
    find_program (SCROLLKEEPER_UPDATE scrollkeeper-update)
    if (SCROLLKEEPER_UPDATE)
      message(STATUS "Installing scrollkeeper-update")
      set(_scrollkeeper_cmd "${SCROLLKEEPER_UPDATE} -q -p ${CMAKE_INSTALL_PREFIX}/var/scrollkeeper -o ${CMAKE_INSTALL_FULL_DATADIR}/omf/${PROJECT_NAME}")
      install(CODE
	"execute_process(
	COMMAND ${CMAKE_COMMAND} -E chdir . ${_scrollkeeper_cmd}
	)"
	)
    else (SCROLLKEEPER_UPDATE)
        message(WARNING "scrollkeeper-update was not found. Make sure to call ${SCROLLKEEPER_UPDATE} -q -p ${CMAKE_INSTALL_PREFIX}/var/scrollkeeper -o ${CMAKE_INSTALL_DATADIR}/omf/${PROJECT_NAME} after install and uninstall")
    endif ()
  endif (WITH_DB_HELP)

  # reset build dir
  set (CMAKE_CURRENT_BINARY_DIR ${CMAKE_BINARY_DIR})

endif (WITH_HELP)
