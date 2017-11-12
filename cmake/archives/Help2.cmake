# Xiphos build script
# The Xiphos Developement Team
#
# help files

# check itstool
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

if (WITH_HELP)
  message (STATUS "Building Help files")

  set(DOC_INCLUDES
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
    )

  set(DOC_FIGURES
    figures/first_start.png
    figures/gtkhtml3-vs-mozembed.png
    figures/interface_biblepane-options.png
    figures/interface_biblepane.png
    figures/interface_commentarypane.png
    figures/interface_dictionary.png
    figures/interface_menubar.png
    figures/interface_menubar-view.png
    figures/interface_parallel.png
    figures/interface_parallel-separate.png
    figures/interface.png
    figures/interface_searchpane.png
    figures/interface_shortcut.png
    figures/interface_sidepane.png
    figures/interface_toolbar.png
    figures/interface_viewer.png
    figures/journal.png
    figures/module.png
    figures/personal.png
    figures/preferences_fonts-color.png
    figures/preferences_fonts-misc.png
    figures/preferences_general-misc.png
    figures/preferences_general-biblesync.png
    figures/preferences_modules-misc.png
    figures/preferences_modules-parallel.png
    figures/preferences.png
    figures/search_search.png
    figures/studypad.png
    figures/sword3.png
    figures/sword_config.png
    figures/sword_install.png
    figures/sword_remove.png
    figures/sword_sources.png
    )

  # FIXME: don't re-specify this here, instead read it from file list
  set(LINGUAS
    fr
    fa
    )

  set(HELP_DEST share/gnome/help/${PROJECT_NAME})

  set(HELP_SOURCE)
  foreach(_page ${DOC_INCLUDES})
    set(HELP_SOURCE ${HELP_SOURCE} C/${_page})
  endforeach()

  install(FILES ${HELP_SOURCE} DESTINATION ${HELP_DEST}/C)
  install(FILES C/figures/* DESTINATION ${HELP_DEST}/C/figures)

  # Hacked together from the similar macro in cmake/Gettext.cmake.
  macro(HELP_CREATE_TRANSLATIONS _firstLang)
    set(_translatedPages)
    set(_addToAll)
    set(_isComment FALSE)

    FOREACH(_lang ${_firstLang} ${ARGN})
      IF(_lang STREQUAL "ALL")
        SET(_addToAll "ALL")
      ELSEIF(_lang STREQUAL "COMMENT")
        SET(_isComment TRUE)
      ELSEIF(_isComment)
        SET(_isComment FALSE)
        SET(_comment ${_lang})
      ELSE()
        GET_FILENAME_COMPONENT(_absPo ${_lang}/${_lang}.po ABSOLUTE)

        FOREACH(_page ${DOC_INCLUDES})
          GET_FILENAME_COMPONENT(_absSourcePage C/${_page} ABSOLUTE)
          SET(_destPage ${CMAKE_CURRENT_BINARY_DIR}/${_lang}/${_page})
          GET_FILENAME_COMPONENT(_destPath ${_destPage} PATH)

          message("_absPo=${_absPo} _absSourcePage=${_absSourcePage} _destPage=${_destPage} _lang=${_lang} _page=${_page} curr_bin=${CMAKE_CURRENT_BINARY_DIR}\n")
          ADD_CUSTOM_COMMAND(
            OUTPUT ${_destPage}
            COMMAND mkdir -p ${_destPath} && ${XML2PO_BIN} -m mallard -p ${_absPo} -o ${_destPage} ${_absSourcePage}
            DEPENDS ${_absPo} ${_absSourcePage}
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            )

          INSTALL(FILES ${_destPage} DESTINATION ${HELP_DEST}/${_lang})
          SET(_translatedPages ${_translatedPages} ${_destPage})
        ENDFOREACH()
      ENDIF()
    ENDFOREACH()

    IF(DEFINED _comment)
      ADD_CUSTOM_TARGET(help_translations ${_addToAll} DEPENDS ${_translatedPages} COMMENT ${_comment})
    ELSE()
      ADD_CUSTOM_TARGET(help_translations ${_addToAll} DEPENDS ${_translatedPages})
    ENDIF()
  ENDMACRO()

  if (TRANSLATE_HELP)
    find_program (XML2PO_BIN xml2po)
    if (NOT XML2PO_BIN)
      message (FATAL_ERROR "xml2po not found")
    endif()

    HELP_CREATE_TRANSLATIONS(ALL ${TRANSLATED} COMMENT "Translating help docs.")
  endif ()
endif ()
