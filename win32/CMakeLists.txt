# Xiphos build script
# The Xiphos Developement Team
#

message ("Cross-compiling for Windows")

# the name of the target operating system
set(CMAKE_SYSTEM_NAME Windows)

# which compilers to use for C and C++
set(CMAKE_C_COMPILER /usr/bin/x86_64-w64-mingw32-c++-win32)
set(CMAKE_CXX_COMPILER /usr/bin/x86_64-w64-mingw32-g++-win32)
set(CMAKE_RC_COMPILER /usr/bin/x86_64-w64-mingw32-windres)

# here is the target environment located
set(CMAKE_FIND_ROOT_PATH /usr/share/mingw-w64)

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

message ("Downloading MXE")

add_custom_target(git_clone_mxe ALL
  ${GIT_EXECUTABLE} clone git://github.com/openscad/mxe.git .
  COMMENT ("Downloading MXE")
  )

list(APPEND MXE_PACKAGES
  icu4C
  glib
  libgsf
  libxml2
  atk
  cairo
  gtk3
  gdk-pixbuf
  libsoup
  pango
  )

list(APPEND OWN_PACKAGES
  sword
  biblesync
  uuid
  gconf
  gmodule
  gtk+-unix-print
  gdk3
  gio
  gobject
  webkitgtk
  )

set (MXE_TARGETS "'x86_64-w64-mingw32.static.posix")
set (NUMCPU 4)
set (JOBS 4)
add_custom-target(mxe_make
  make $PACKAGES MXE_TARGETS=$MXE_TARGETS -j $NUMCPU JOBS=$NUMJOBS
  COMMENT ("echo make $MXE_PACKAGES MXE_TARGETS=$MXE_TARGETS -j $NUMCPU JOBS=$NUMJOBS")
  )
