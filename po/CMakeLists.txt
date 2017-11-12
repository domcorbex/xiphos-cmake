# Xiphos build script
# The Xiphos Developement Team
#
#
# building MO files


if (GETTEXT_FOUND)
  # copy all po files into the current binary directory
  file (GLOB po_files ${CMAKE_CURRENT_SOURCE_DIR}/*.po)
  file (COPY ${po_files} DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

  # get list of translations files
  file (READ ${CMAKE_CURRENT_SOURCE_DIR}/LINGUAS linguas)
  # transform linguas to a cmake regular list
  string (REGEX MATCHALL "[a-zA-Z_]+" langs "${linguas}")

  # create and install MO files
  gettext_process_pot_file (
    ${CMAKE_CURRENT_SOURCE_DIR}/xiphos.pot
    ALL
    INSTALL_DESTINATION ${CMAKE_INSTALL_LOCALEDIR}
    LANGUAGES ${langs}
    )


  # additional targets for updating translation files

  # target to refresh .pot file
  find_program(INTLTOOL_UPDATE intltool-update)
  add_custom_target (pot_update
    COMMAND cd ${CMAKE_SOURCE_DIR}/po
    COMMAND ${INTLTOOL_UPDATE} --pot --gettext-package=${PROJECT_NAME}
    COMMENT "Updating pot file."
    )

  # target for updating a given .po file
  foreach (PO ${langs})
    add_custom_target (po_update_${PO}
      COMMAND cd ${CMAKE_SOURCE_DIR}/po
      COMMAND ${GETTEXT_MSGMERGE_EXECUTABLE} --update --verbose ${PO}.po ${PROJECT_NAME}.pot
      COMMENT "Updating ${PO}.po file"
      )
    # prepare command for the all po target
    set (PO_UPDATE_ALL ${PO_UPDATE_ALL} && echo ${PO}.po: && ${GETTEXT_MSGMERGE_EXECUTABLE} --update --verbose ${PO}.po ${PROJECT_NAME}.pot)
  endforeach()

  # target for updating all po files
  set (PO_UPDATE_ALL print ${PO_UPDATE_ALL})
  add_custom_target (po_update_all
    COMMAND cd ${CMAKE_SOURCE_DIR}/po
    COMMAND ${PO_UPDATE_ALL}
    VERBATIM
    )
endif ()
