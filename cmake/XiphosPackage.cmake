# Xiphos build script
# The Xiphos Development Team
#

# package definitions
set (CPACK_PACKAGE_NAME "${PROJECT_NAME}")
set (CPACK_PACKAGE_VERSION "${PROJECT_VERSION}")
set (CPACK_PACKAGE_DESCRIPTION_SUMMARY "A Bible study tool.")
set (CPACK_PACKAGE_CONTACT "https://github.com/crosswire/xiphos/issues")
set (CPACK_PACKAGE_VENDOR "The Xiphos Developement Team")
set (CPACK_SOURCE_IGNORE_FILES
  "${CMAKE_BINARY_DIR}/"
  "/.git/"
  "/.gitignore"
  "/.bzrignore/"
  "/.bzrrules/"
  "/.clang-format"
  "/.travis.yml"
  "/debian"
  )


# set package for unix
if(UNIX)
  # Try to find architecture
  execute_process(COMMAND uname -m OUTPUT_VARIABLE CPACK_PACKAGE_ARCHITECTURE)
  string(STRIP "${CPACK_PACKAGE_ARCHITECTURE}" CPACK_PACKAGE_ARCHITECTURE)

  # source package
  set (CPACK_SOURCE_GENERATOR "TGZ")
  set (CPACK_SOURCE_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")

  set (CPACK_PACKAGE_FILE_NAME "${PROJECT_NAME}_${PROJECT_VERSION}+git_${CPACK_DEBIAN_PACKAGE_ARCHITECTURE}")
  set (CPACK_GENERATOR "TGZ")
endif(UNIX)


# set package peoperties for Windows
if (WIN32)
  set(CPACK_PACKAGE_EXECUTABLES "xiphos" "xiphos")
  set(CPACK_PACKAGE_INSTALL_DIRECTORY "${PROJECT_NAME}")
  set(CPACK_NSIS_MUI_ICON "${CMAKE_CURRENT_SOURCE_DIR}/pixmaps/gs2-48x48.ico")
  set(CPACK_NSIS_MUI_UNIICON "${CMAKE_CURRENT_SOURCE_DIR}/pixmaps/gs2-48x48.ico")
  # There is a bug in NSIS that does not handle full unix paths properly. Make
  # sure there is at least one set of four (4) backlasshes.
  set(CPACK_NSIS_INSTALLED_ICON_NAME "bin\\\\${PROJECT_NAME}.exe")
  set(CPACK_NSIS_DISPLAY_NAME "xiphos")
  set(CPACK_NSIS_HELP_LINK "${PROJECT_URL}/Manual")
  set(CPACK_NSIS_URL_INFO_ABOUT "${PROJECT_URL}")
  set(CPACK_NSIS_MODIFY_PATH OFF)
  set(CPACK_NSIS_ENABLE_UNINSTALL_BEFORE_INSTALL ON)
  set (CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/COPYING")
  set(CPACK_GENERATOR "NSIS")
 endif (WIN32)


include(CPack)
