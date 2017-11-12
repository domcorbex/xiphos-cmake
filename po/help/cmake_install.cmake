# Install script for directory: /home/domi/xiphos/xiphos-cmake/help

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/po/help/fa/xiphos.xml")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/first_start.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/gtkhtml3-vs-mozembed.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/interface_biblepane-options.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/interface_biblepane.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/interface_commentarypane.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/interface_dictionary.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/interface_menubar.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/interface_menubar-view.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/interface_parallel.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/interface_parallel-separate.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/interface.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/interface_searchpane.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/interface_shortcut.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/interface_sidepane.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/interface_toolbar.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/interface_viewer.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/journal.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/module.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/personal.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/preferences_fonts-color.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/preferences_fonts-misc.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/preferences_general-misc.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/C/figures/preferences_general-biblesync.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/preferences_modules-misc.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/preferences_modules-parallel.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/preferences.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/search_search.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/studypad.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/sword3.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/sword_config.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/sword_install.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/sword_remove.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fa/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fa/figures/sword_sources.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/po/help/fr/xiphos.xml")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/first_start.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/gtkhtml3-vs-mozembed.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/interface_biblepane-options.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/interface_biblepane.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/interface_commentarypane.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/interface_dictionary.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/interface_menubar.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/interface_menubar-view.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/interface_parallel.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/interface_parallel-separate.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/interface.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/interface_searchpane.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/interface_shortcut.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/interface_sidepane.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/interface_toolbar.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/interface_viewer.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/journal.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/module.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/personal.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/preferences_fonts-color.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/preferences_fonts-misc.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/preferences_general-misc.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/preferences_general-biblesync.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/preferences_modules-misc.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/preferences_modules-parallel.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/preferences.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/search_search.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/studypad.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/sword3.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/sword_config.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/sword_install.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/sword_remove.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/fr/figures" TYPE FILE FILES "/home/domi/xiphos/xiphos-cmake/help/fr/figures/sword_sources.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/C" TYPE FILE FILES
    "/home/domi/xiphos/xiphos-cmake/help/C/xiphos.xml"
    "/home/domi/xiphos/xiphos-cmake/help/C/introduction.xml"
    "/home/domi/xiphos/xiphos-cmake/help/C/interface.xml"
    "/home/domi/xiphos/xiphos-cmake/help/C/start.xml"
    "/home/domi/xiphos/xiphos-cmake/help/C/preferences.xml"
    "/home/domi/xiphos/xiphos-cmake/help/C/modules.xml"
    "/home/domi/xiphos/xiphos-cmake/help/C/search.xml"
    "/home/domi/xiphos/xiphos-cmake/help/C/studypad.xml"
    "/home/domi/xiphos/xiphos-cmake/help/C/personal.xml"
    "/home/domi/xiphos/xiphos-cmake/help/C/journals.xml"
    "/home/domi/xiphos/xiphos-cmake/help/C/onlinehelp.xml"
    "/home/domi/xiphos/xiphos-cmake/help/C/originallanguage.xml"
    "/home/domi/xiphos/xiphos-cmake/help/C/legal.xml"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnome/help/xiphos/C/figures" TYPE FILE FILES
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/first_start.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/gtkhtml3-vs-mozembed.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/interface_biblepane-options.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/interface_biblepane.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/interface_commentarypane.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/interface_dictionary.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/interface_menubar.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/interface_menubar-view.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/interface_parallel.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/interface_parallel-separate.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/interface.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/interface_searchpane.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/interface_shortcut.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/interface_sidepane.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/interface_toolbar.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/interface_viewer.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/journal.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/module.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/personal.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/preferences_fonts-color.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/preferences_fonts-misc.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/preferences_general-misc.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/preferences_general-biblesync.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/preferences_modules-misc.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/preferences_modules-parallel.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/preferences.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/search_search.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/studypad.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/sword3.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/sword_config.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/sword_install.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/sword_remove.png"
    "/home/domi/xiphos/xiphos-cmake/help/C/figures/sword_sources.png"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/share/omf/xiphos/xiphos-C.omf;/usr/local/share/omf/xiphos/xiphos-fa.omf;/usr/local/share/omf/xiphos/xiphos-fr.omf")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/share/omf/xiphos" TYPE FILE FILES
    "/home/domi/xiphos/xiphos-cmake/cmake/xiphos-C.omf"
    "/home/domi/xiphos/xiphos-cmake/cmake/xiphos-fa.omf"
    "/home/domi/xiphos/xiphos-cmake/cmake/xiphos-fr.omf"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(
	COMMAND /usr/bin/cmake -E chdir . /usr/bin/scrollkeeper-update -q -p /usr/local/var/scrollkeeper -o /usr/local/share/omf/xiphos
	)
endif()

