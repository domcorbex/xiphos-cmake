# Xiphos build script
# The Xiphos Developement Team
#
# Create config.h

message (STATUS "Generating config.h")

# system checks
INCLUDE (CheckIncludeFiles)
CHECK_INCLUDE_FILES ("stdlib.h;stdarg.h;string.h;float.h" STDC_HEADERS)
CHECK_INCLUDE_FILES ("time.h;sys/time.h" TIME_WITH_SYS_TIME)

INCLUDE (CheckFunctionExists)
CHECK_FUNCTION_EXISTS (strcasestr HAVE_STRCASESTR)

# generate config.h
SET (CONFIG_H ${CMAKE_CURRENT_BINARY_DIR}/config.h)
CONFIGURE_FILE (${CMAKE_CURRENT_SOURCE_DIR}/cmake/config.h.cmake.in ${CONFIG_H})
ADD_DEFINITIONS (-DHAVE_CONFIG_H)

# include config.h
INCLUDE_DIRECTORIES("${CMAKE_CURRENT_BINARY_DIR}")


# Notes
# From wscript and wscript_build files:

# DATADIR is defined by intltool in config.h - conflict in win32 (mingw)
# ok define('VERSION', VERSION)
# -> Pack    define('PACKAGE_VERSION', VERSION)
# Ok    define('GETTEXT_PACKAGE', PACKAGE)
# -> Pack    define('PACKAGE', PACKAGE)
# -> Pack    define('PACKAGE_NAME', APPNAME)
# -> Pack    define('PACKAGE_STRING', '%s %s' % (APPNAME, VERSION))
# -> Pack    define('PACKAGE_TARNAME', PACKAGE)
# nok    define('INSTALL_PREFIX', conf.escpath(sub('${PREFIX}/', env)))
# ok   define('PACKAGE_BUGREPORT','https://github.com/crosswire/xiphos/issues' )
# nok    define('PACKAGE_DATA_DIR', conf.escpath(sub('${DATAROOTDIR}/${PACKAGE}', env)))
# nok    define('PACKAGE_DOC_DIR', conf.escpath(env['DOCDIR']))
# nok    define('PACKAGE_HELP_DIR', conf.escpath(sub('${DATAROOTDIR}/gnome/help/${PACKAGE}', env)))
# ok   define('PACKAGE_LOCALE_DIR', conf.escpath(env['LOCALEDIR']))
# nok    define('PACKAGE_MENU_DIR', conf.escpath(sub('${DATAROOTDIR}/applications', env)))
    #define('PACKAGE_PIXMAPS_DIR', conf.escpath(sub('${DATAROOTDIR}/pixmaps/${PACKAGE}', env)))
# ok   define('PACKAGE_PIXMAPS_DIR', conf.escpath(sub('${DATAROOTDIR}/${PACKAGE}', env)))
# nok    define('PACKAGE_SOURCE_DIR', conf.escpath(os.path.abspath(srcdir))) # folder where was wscript executed
# nok        define('PACKAGE_APPDATA_DIR', conf.escpath(sub('${INSTALL_PREFIX}/share/appdata', env)))
# ok            conf.define('USE_WEBKIT_EDITOR', 1)
# ok        conf.define('USE_GTK_3', 1)
# ok        conf.define('USE_GTKBUILDER', 1)
# ok                conf.define('USE_WEBKIT2', 1)

# ok		conf.check_cc(msg='Checking for function strcasestr', define_name="HAVE_STRCASESTR",
# Ok dfn('WIN32', 1)
# ok    dfn('STDC_HEADERS', 1)
# ok    dfn('TIME_WITH_SYS_TIME', 1)
# ok    dfn('ENABLE_NLS', 1)
# ok    dfn('HAVE_BIND_TEXTDOMAIN_CODESET', 1)
# ok    dfn('HAVE_GETTEXT', 1)
# ok    dfn('HAVE_DCGETTEXT', 1)
# ok    dfn('CHATTY', 1)

# sample
#IF (NOT WIN32)
#CHECK_INCLUDE_FILES (X11/Xlib.h HAVE_X11_XLIB_H)
#ENDIF (NOT WIN32)

#CHECK_INCLUDE_FILES (dirent.h HAVE_DIRENT_H)
#CHECK_INCLUDE_FILES (dlfcn.h HAVE_DLFCN_H)
#CHECK_INCLUDE_FILES (glob.h HAVE_GLOB_H)
#CHECK_INCLUDE_FILES (inttypes.h HAVE_INTTYPES_H)
#CHECK_INCLUDE_FILES (limits.h HAVE_LIMITS_H)
#CHECK_INCLUDE_FILES (locale.h HAVE_LOCALE_H)
#CHECK_INCLUDE_FILES (memory.h HAVE_MEMORY_H)
#CHECK_INCLUDE_FILES (stdint.h HAVE_STDINT_H)
#CHECK_INCLUDE_FILES (stdlib.h HAVE_STDLIB_H)
#CHECK_INCLUDE_FILES (string.h HAVE_STRING_H)
#CHECK_INCLUDE_FILES (strings.h HAVE_STRINGS_H)
#CHECK_INCLUDE_FILES (sys/stat.h HAVE_SYS_STAT_H)
#CHECK_INCLUDE_FILES (sys/time.h HAVE_SYS_TIME_H)
#CHECK_INCLUDE_FILES (sys/times.h HAVE_SYS_TIMES_H)
#CHECK_INCLUDE_FILES (sys/types.h HAVE_SYS_TYPES_H)
#CHECK_INCLUDE_FILES (sys/wait.h HAVE_SYS_WAIT_H)
#CHECK_INCLUDE_FILES (unistd.h HAVE_UNISTD_H)
#CHECK_INCLUDE_FILES (utmp.h HAVE_UTMP_H)
#CHECK_INCLUDE_FILES (wctype.h HAVE_WCTYPE_H)

# from config.h
#define HAVE_INTTYPES_H 1
#define HAVE_LOCALE_H 1
#define HAVE_MEMORY_H 1
#define HAVE_STDINT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRCASESTR 1
#define HAVE_STRING_H 1
#define HAVE_STRINGS_H 1
#define HAVE_SWORD 1
#define HAVE_SYS_SELECT_H 1
#define HAVE_SYS_SOCKET_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_UNISTD_H 1
#define HAVE_UUID 1
