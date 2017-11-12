# Xiphos build script
# The Xiphos Developement Team
#
# help files
#
# TODO:
# - switch from itstool to gettext utilities (msgfmt and xgettext)


if (WITH_HELP)
  message (STATUS "Configuring Mallard Help files")

  # list of help files
  list (APPEND help_files_list
    index.page
    legal.xml
    xiphos-01-introduction.page
    xiphos-02-shortcut-keys.page
    xiphos-10-start.page
    xiphos-11-interface.page
    xiphos-20-modules-introduction.page
    xiphos-21-modules-configuration.page
    xiphos-22-modules-install.page
    xiphos-23-modules-maintenance.page
    xiphos-24-modules-third-party.page
    xiphos-30-search.page
    xiphos-31-advanced-search.page
    xiphos-32-search-syntax.page
    xiphos-33-original-language.page
    xiphos-40-personal-commentary.page
    xiphos-41-studypad.page
    xiphos-42-journals.page
    xiphos-50-preferences-general-settings.page
    xiphos-51-preferences-biblesync.page
    xiphos-52-preferences-fonts-colors.page
    xiphos-53-preferences-modules.page
    xiphos-60-online-help.page
    )

  # figures directory
  set(help_figures_dir figures)

  # figures
  list (APPEND help_media_list
    ${help_figures_dir}/first_start.png
    ${help_figures_dir}/gtkhtml3-vs-mozembed.png
    ${help_figures_dir}/interface_biblepane-options.png
    ${help_figures_dir}/interface_biblepane.png
    ${help_figures_dir}/interface_commentarypane.png
    ${help_figures_dir}/interface_dictionary.png
    ${help_figures_dir}/interface_menubar.png
    ${help_figures_dir}/interface_menubar-view.png
    ${help_figures_dir}/interface_parallel.png
    ${help_figures_dir}/interface_parallel-separate.png
    ${help_figures_dir}/interface.png
    ${help_figures_dir}/interface_searchpane.png
    ${help_figures_dir}/interface_shortcut.png
    ${help_figures_dir}/interface_sidepane.png
    ${help_figures_dir}/interface_toolbar.png
    ${help_figures_dir}/interface_viewer.png
    ${help_figures_dir}/journal.png
    ${help_figures_dir}/module.png
    ${help_figures_dir}/personal.png
    ${help_figures_dir}/preferences_fonts-color.png
    ${help_figures_dir}/preferences_fonts-misc.png
    ${help_figures_dir}/preferences_general-misc.png
    ${help_figures_dir}/preferences_general-biblesync.png
    ${help_figures_dir}/preferences_modules-misc.png
    ${help_figures_dir}/preferences_modules-parallel.png
    ${help_figures_dir}/preferences.png
    ${help_figures_dir}/search_search.png
    ${help_figures_dir}/studypad.png
    ${help_figures_dir}/sword3.png
    ${help_figures_dir}/sword_config.png
    ${help_figures_dir}/sword_install.png
    ${help_figures_dir}/sword_remove.png
    ${help_figures_dir}/sword_sources.png
    ${help_figures_dir}/xiphos-icon.png
    ${help_figures_dir}/xiphos-trail-icon.png
    )

  add_custom_target(help-files ALL)


  # get list of translations
  file (READ ${CMAKE_CURRENT_SOURCE_DIR}/LINGUAS linguas)
  # transform linguas to a cmake regular list
  string (REGEX MATCHALL "[a-zA-Z_]+" help_locales "${linguas}")
  # get list of all languages
  list (APPEND all_languages "C" ${help_locales})

  # copy existing files
  foreach (lang ${all_languages})
    file (COPY ${lang} DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
  endforeach (lang)

  # create translated pages for other languages than C
  foreach (lang ${help_locales})
    set(pofile "${CMAKE_CURRENT_SOURCE_DIR}/${lang}/${lang}.po")
    set(mofile "${CMAKE_CURRENT_BINARY_DIR}/${lang}/${lang}.mo")

    # check .po file
    if(NOT EXISTS ${pofile})
      message(FATAL_ERROR "No 'po.${lang}' found, create it or remove ${lang} from LINGUAS.")
    else ()
      message(STATUS "Building help files for language '${lang}'")
    endif(NOT EXISTS ${pofile})

    # create translated pages for <lang>
    add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${lang}/xiphos-60-online-help.page
      COMMAND ${CMAKE_COMMAND} -E make_directory "${CMAKE_CURRENT_BINARY_DIR}/${lang}"
      COMMAND ${GETTEXT_MSGFMT_EXECUTABLE} -o "${mofile}" "${pofile}"
      COMMAND ${CMAKE_COMMAND} -E env d="${CMAKE_CURRENT_SOURCE_DIR}/C"
      ${ITSTOOL} -m "${mofile}" ${help_files_list} --output ${CMAKE_CURRENT_BINARY_DIR}/${lang}/
      WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/C
      COMMENT "Generating '${lang}' help files"
      )

    # import missing figures from C into <lang>
    foreach (media_file ${help_media_list})
      if (NOT EXISTS "${CMAKE_CURRENT_BINARY_DIR}/${lang}/${media_file}")
	# the <lang> figure has not been created, install the corresponding C figure
	file (COPY ${CMAKE_CURRENT_SOURCE_DIR}/C/${media_file}
	  DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/${lang}/${help_figures_dir}
	  )
      endif (NOT EXISTS "${CMAKE_CURRENT_BINARY_DIR}/${lang}/${media_file}")
    endforeach (media_file)


    add_custom_target(${lang}-help-files
      DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${lang}/xiphos-60-online-help.page
      ${pofile}
      )

    add_dependencies(help-files ${lang}-help-files)

  endforeach (lang)


  # validate pages
  if (UNIX)
    set (mallard-schema ${CMAKE_CURRENT_SOURCE_DIR}/schema/mallard-1.0.rng)
    foreach (lang ${all_languages})
      add_custom_command (OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${lang}/validation.rpt
	COMMAND ${XMLLINT} --noout --xinclude --noent --relaxng ${mallard-schema} *.page > validation.rpt
	DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${lang}/xiphos-60-online-help.page
	WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${lang}
	COMMENT "Validating '${lang}' help files"
	)
      add_custom_target(${lang}-validate-mallard
	DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${lang}/validation.rpt
	)

      add_dependencies(help-files ${lang}-validate-mallard)

    endforeach (lang)
  endif (UNIX)

  # install help files
  if (UNIX)
    # install mallard help files
    foreach (lang ${all_languages})
      # list help pages to install
      set (install_pages)
      foreach(page ${help_files_list})
	list(APPEND install_pages ${CMAKE_CURRENT_BINARY_DIR}/${lang}/${page})
      endforeach(page)
      # install help files
      install (FILES ${install_pages}
	DESTINATION ${HELPDIR}/${lang}/
	)
      # list figures to install
      set (install_media)
      foreach(media ${help_media_list})
	list(APPEND install_media ${CMAKE_CURRENT_BINARY_DIR}/${lang}/${media})
      endforeach(media)
      # install figures
      install (FILES ${install_media}
	DESTINATION ${HELPDIR}/${lang}/${help_figures_dir}
	)
    endforeach (lang)
  endif (UNIX)


  # additional targets for updating translation files

  # target to refresh .pot file
  set (help_pot ${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}.pot)
  add_custom_target (help_pot_update
    COMMAND ${ITSTOOL} -o ${help_pot} ${CMAKE_CURRENT_SOURCE_DIR}/C/*.page
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    COMMENT "Updating help pot file."
    )

  # target for updating a given .po file
  set (help_po_update_all echo)
  foreach (lang ${help_locales})
    add_custom_target (help_po_update_${lang}
      COMMAND ${GETTEXT_MSGMERGE_EXECUTABLE} --update --verbose ${lang}.po ${help_pot}
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${lang}
      COMMENT "Updating ${lang}.po file"
      )
    # prepare command for the all po target
    set (help_po_update_all ${help_po_update_all} && echo ${lang}.po: && ${GETTEXT_MSGMERGE_EXECUTABLE} --update --verbose ${lang}/${lang}.po ${help_pot})
  endforeach()

  # target for updating all po files
  add_custom_target (help_po_update_all
    COMMAND ${help_po_update_all}
    VERBATIM
    )


  ### optional features
  # TODO: switch from yelp-x utilities which are bash script to plain XSLT

  # export mallard files to html

  set (have_html_help)
  function (xiphos_export_to_html)
    # TODO: switch to plain XSLT
    message(STATUS "Exporting to HTML")
    foreach (lang ${all_languages})
      # list help pages to convert
      set (mallard_pages)
      foreach(help_page ${help_files_list})
	list(APPEND mallard_pages ${CMAKE_CURRENT_BINARY_DIR}/${lang}/${help_page})
      endforeach(help_page)

      # convert Mallard pages into html files
      add_custom_command (OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${lang}/xiphos-60-online-help.html
	COMMAND ${YELP_BUILD} html ${mallard_pages}
	DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${lang}/xiphos-60-online-help.page
	WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${lang}
	COMMENT "Generating '${lang}' html files"
	)

      add_custom_target(${lang}-html-files
	DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${lang}/xiphos-60-online-help.html
	)

      add_dependencies(help-files ${lang}-html-files)

    endforeach ()

    set (have_html_help ON PARENT_SCOPE)

  endfunction (xiphos_export_to_html)


  # create MS Help files

  if (WITH_MSHELP)
    # create Windows© Help files
    # be sure to have html files generated
    if (NOT have_html_help)
      xiphos_export_to_html()
    endif ()
    # generate .chm file for each <lang>
    foreach (lang ${all_languages})
      message(STATUS "Configuring Windows© Help file for '${lang}'")
      if (NOT EXISTS ${CMAKE_CURRENT_BINARY_DIR}/${lang}/xiphos.hhp)
	message(WARNING "  xiphos.hhp not found! Windows© Help disabled.")
      endif ()
      if (WIN32)
	# building help with HHC.EXE [NOTE: First switch to XSLT]
	add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${lang}/xiphos.chm
	  COMMAND ${HHC_EXE} xiphos.hhp
	  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${lang}
	  COMMENT "Generating '${lang}' Windows© Help file - HHC.EXE"
	  )
      else (WIN32)
	# build chm help using the chmcmd utility from Free Pascal
	add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${lang}/xiphos.chm
	  COMMAND ${CHMCMD} xiphos.hhp
	  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${lang}/xiphos-60-online-help.html
	  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${lang}
	  COMMENT "Generating '${lang}' Windows© Help file - chmcmd"
	  )
      endif()

      # add target to current target
      add_custom_target( xiphos_${lang}_chm
	DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${lang}/xiphos.chm
	)

      add_dependencies(help-files xiphos_${lang}_chm)

    endforeach (lang)
  endif (WITH_MSHELP)

  # create PDF (experimental)

  if (WITH_PDFHELP)
    set(lang "C")
    # create a PDF file
    message(STATUS "Configuring PDF Help file for '${lang}'")
    # be sure to have html files generated
    if (NOT have_html_help)
      xiphos_export_to_html()
    endif ()
    # create PDF file
    # Warning: problems with utf-8 chars
    # other option: COMMAND ${WKHTMLTOPDF} *.html xiphos.pdf
    # but needs a patched version of QT
    add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${lang}/xiphos.pdf
      COMMAND ${HTMLDOC} --webpage --linkstyle plain -f xiphos.pdf *.html
      DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${lang}/xiphos-60-online-help.html
      WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${lang}
      COMMENT "Generating '${lang}' PDF file"
      )

    # add target to current target
    add_custom_target( xiphos_${lang}_pdf
      DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${lang}/xiphos.pdf
      )

    add_dependencies(help-files xiphos_${lang}_pdf)

  endif (WITH_PDFHELP)

endif (WITH_HELP)
