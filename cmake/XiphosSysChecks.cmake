# Xiphos build script
# The Xiphos Development Team
#

# system checks


# define statements that control the compilation (config.h)
include (CheckIncludeFiles)
check_include_files ("locale.h;libintl.h" ENABLE_NLS)

include (CheckFunctionExists)
check_function_exists (strcasestr HAVE_STRCASESTR)


# headers not defined in config.h but included in src files
include (CheckIncludeFile)
list (APPEND XIPHOS_HEADERS
  "assert.h"
  "ctype.h"
  "errno.h"
  "math.h"
  "stdint.h"
  "stdio.h"
  "stdlib.h"
  "string.h"
  "fcntl.h"
  "netinet/in.h"
  "regex.h"
  "sys/socket.h"
  "sys/stat.h"
  "sys/types.h"
  "unistd.h"
  )
foreach (header ${XIPHOS_HEADERS})
  check_include_file (${header} found_${header})
  if (NOT found_${header})
    message(FATAL_ERROR "${header} not found!")
  endif()
endforeach()

# find Threads
set(CMAKE_THREAD_PREFER_PTHREAD ON)
set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
