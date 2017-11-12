# Xiphos build script
# The Xiphos Developement Team
#

# install pixmaps files
file (GLOB pixmaps_files
  *.png
  *.xpm
  *.ico
  )

install (FILES ${pixmaps_files}
  DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/${PROJECT_NAME})
