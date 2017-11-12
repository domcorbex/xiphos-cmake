# Xiphos build script
# The Xiphos Developement Team
#
# building main

list (APPEND main_sources
  biblesync_glue.cc
  configs.cc
  display.cc
  export_passage.cc
  global_ops.cc
  lists.cc
  main.c
  mod_mgr.cc
  modulecache.cc
  module_dialogs.cc
  navbar_book.cc
  navbar_book_dialog.cc
  navbar.cc
  navbar_versekey.cc
  parallel_view.cc
  prayerlists.cc
  previewer.cc
  search_dialog.cc
  search_sidebar.cc
  settings.c
  sidebar.cc
  sword.cc
  sword_treekey.cc
  tab_history.c
  url.cc
  xml.c
  )
list (APPEND main_headers
  biblesync_glue.h
  configs.h
  display.hh
  export_passage.h
  global_ops.hh
  gtk_compat.h
  lists.h
  mod_mgr.h
  modulecache.hh
  module_dialogs.h
  navbar_book_dialog.h
  navbar_book.h
  navbar.h
  navbar_versekey.h
  parallel_view.h
  prayerlists.h
  previewer.h
  search_dialog.h
  search_sidebar.h
  settings.h
  sidebar.h
  sword.h
  sword_treekey.h
  tab_history.h
  url.hh
  xml.h
  )

add_library (libmain ${main_sources} ${main_headers})
