# Xiphos build script
# The Xiphos Development Team
#
# set flags


message (STATUS "Setting up flags")

# set 'debug' build type flags
set (CMAKE_C_FLAGS_DEBUG
  "${CMAKE_C_FLAGS_DEBUG} -DDEBUG" )
set (CMAKE_CXX_FLAGS_DEBUG
  "${CMAKE_CXX_FLAGS_DEBUG} -DDEBUG" )

# set 'release' build type flags
set (CMAKE_C_FLAGS_RELEASE
  "${CMAKE_C_FLAGS_RELEASE} -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2" )
set (CMAKE_CXX_FLAGS_RELEASE
  "${CMAKE_CXX_FLAGS_RELEASE} -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2" )

# set 'strip' option flags
if (WITH_STRIP)
  set (CMAKE_C_FLAGS_RELEASE
    "${CMAKE_C_FLAGS_RELEASE} -s" )
  set (CMAKE_CXX_FLAGS_RELEASE
    "${CMAKE_CXX_FLAGS_RELEASE} -s" )
endif()


# stop the insanity. NULLs mean something. shocking, i know, but seriously...
set (CMAKE_C_FLAGS
  "${CMAKE_C_FLAGS} -fno-delete-null-pointer-checks")
set (CMAKE_CXX_FLAGS
  "${CMAKE_CXX_FLAGS} -fno-delete-null-pointer-checks")


# set 'delint' option flags
if (WITH_DELINT)
  set (CMAKE_C_FLAGS
    "${CMAKE_C_FLAGS} -Werror -Wall -Wmissing-prototypes -Wnested-externs -Wpointer-arith -Wno-sign-compare" )
  set (CMAKE_CXX_FLAGS
    "${CMAKE_CXX_FLAGS} -Werror -Wall" )
endif (WITH_DELINT)


# set windows specific flags
IF (WIN32)
    # this isn't supposed to be necessary
  set (CMAKE_EXE_LINKER_FLAGS
    "${CMAKE_EXE_LINKER_FLAGS} -lws2_32', '-lrpcrt4" )

  # disable console window in win32
  if (NOT WITH_CONSOLE)
    set (CMAKE_EXE_LINKER_FLAGS
      "${CMAKE_EXE_LINKER_FLAGS} -mwindows" )
  endif()

else (WIN32)
  # add a linker option to stop very recent dbus linkage nightmare.
  set (CMAKE_EXE_LINKER_FLAGS
    "${CMAKE_EXE_LINKER_FLAGS} -Wl,-z,muldefs" )

endif()
