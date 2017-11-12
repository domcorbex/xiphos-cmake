# Xiphos build script
# The Xiphos Developement Team
#
# build backend

list (APPEND backend_sources
  gs_stringmgr.cpp
  module_manager.cc
  sword_main.cc
  )

list (APPEND backend_headers
  gs_stringmgr.h
  module_manager.hh
  sword_main.hh
  )

add_library(libbackend STATIC ${backend_sources} ${backend_headers})
