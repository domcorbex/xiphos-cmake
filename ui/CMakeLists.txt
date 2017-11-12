# Xiphos build script
# The Xiphos Developement Team
#

# install ui files

file (GLOB ui_files
  *.glade
  *.gtkbuilder
  *.xml
  *.png
  *.ui
  languages
  )

install (FILES ${ui_files}
  DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/${PROJECT_NAME})
