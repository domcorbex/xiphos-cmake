# Xiphos CMake based buildsystem

This files describes Xiphos's CMake based buildsystem. CMake is a cross-platform
tool for generating makefiles (as well as project files used by IDEs).

The current version of the buildsystem is capable of building and packaging
Xiphos for the following platforms:

- Linux (GNU Makefiles, Ninja)

Should work, but untested:
- FreeBSD (GNU Makefiles)

Work in progress:
- Linux Cross compiling for Windows (GNU Makefiles, Ninja)

While the legacy build systems typically used in-source builds, it's highly
recommended to use *out-of-source* builds with CMake.

The necessary runtime dependencies such as generated source files, static
libraries, translated files are copied over to the build directory automatically
during the build process.

## Dependencies

Before building Xiphos with CMake, please ensure that you have the platform
specific dependencies installed.

    gcc				GCC, the GNU Compiler Collection
    intltool			Set of tools to centralize translation
    libxml2			XML C parser and toolkit
    libgsf			The G Structured File Library
    gconfmm			C++ wrappers for GConf
    libuuid			universally unique identifier library
    gnome-doc-utils		Collection of documentation utilities for the Gnome project
    rarian			Documentation metadata library
    rarian-compat		Documentation meta-data library (compatibility tools)
    sword >= 1.7.904		CrossWire Bible Society's Bible software
    biblesync			Protocol to support Bible software shared co-navigation
    Gtk+-2.0 or GTK+-3.0	The GIMP Toolkit
    WebKit1 or Webkit2		Port to Gtk+ of the WebKit rendering engine

Optional Dependencies
    gtkhtml			Lightweight HTML rendering/editing engine
    dbus-glib			dbus-glib is a deprecated API for use of D-Bus from GLib applications


## Building Xiphos

This section lists the necessary commands for building Xiphos with CMake.
CMake supports different generators (like GNU/NMake Makefiles or Ninja).

The cmake(1) command-line tool --help output lists available generators on the
current platform. Use its -G option to specify the generator for a new build tree.

Set-up the out-of-source build. Using a build tree that is separate from the
source tree will prevent CMake from generating any files in the source tree.
Create a completely separate directory:

```
mkdir xiphos-build && cd xiphos-build
```

All examples below are for out-of-source builds with Xiphos checked out to
`<XIPHOS_SOURCE>`:

### Linux with Ninja

```
cmake <XIPHOS_SOURCE> -G Ninja
cmake --build . -- -v  # or: ninja -v all
```

`CMAKE_BUILD_TYPE` defaults to `Release`.

### Linux with Makefiles
```
cmake <XIPHOS_SOURCE>
cmake --build . -- VERBOSE=1 -j$(nproc)  # or: make VERBOSE=1 -j$(nproc)
```


#### Tarball generation

The buildsystem is capable of generating a tarball using CPack. To generate it, run:
```
cpack
```

Generated packages can be found in <BUILD_DIR>/packages.


## Options

Xiphos supports a number of build options that can enable or disable certain
functionality. These options must be set when running CMake with
`-DENABLE_<OPTION>=<ON|OFF`. `ON` forcefully enables the dependency
and the CMake run will fail if the related dependency is not available.
This is mostly useful for packagers. `OFF` will disable the feature.


Example for forcefully enabling Gtk2 instead of Gtk3

```
cmake ... -DWITH_GTK2=ON ...
```

Example for building with WebKitGtk1 and the GtkHTML-editor:

```
cmake ... -DWITH_WEBKIT1=ON -DWITH_GTKHTML=ON ...
```

List of options:

Option | Functionality | Default
------------- | -------------------------------------------- | -------
WITH_GTK2 | Force UI build with Gtk2 instead of Gtk3. | OFF
WITH_GTKHTML | Force gtkhtml editor instead of webkit editor. | OFF
WITH_WEBKIT1 | Force webkit1 instead of webkit2. | ON
WITH_DBUS | Use the Xiphos dbus API. | ON
WITH_CHATTY | Enable lots of tracing. | OFF
WITH_HELP | Creating help files. | ON
WITH_STRIP | Strip resulting binary (Release only). | ON
WITH_DEBUG | Enable Xiphos gui debugging functions. | OFF
WITH_DELINT | Build with: -Wall -Werror. | OFF
WITH_CONSOLE | Enable console window in win32. | OFF
WITH_POSTINST | Enable post-install tasks. | ON

Examples:
- release build with gtk3 + webkit2

```
$ cmake <XIPHOS_SOURCE> -G Ninja -DWITH_GTKHTML=ON -DWEBKIT1=OFF
```
- release build with Gtk2

```
$ cmake <XIPHOS_SOURCE> -G Ninja -DWITH_GTK2=ON
```
- debug build

```
$ cmake <XIPHOS_SOURCE> -G Ninja -DCMAKE_BUILD_TYPE=debug -DWITH_CHATTY=ON
```
For more information and an updated list of options, please check the file
cmake/Xiphos.Options.cmake (https://github.com/xiphos/cmake/Xiphos.Options.cmake).

## Extra targets for developpers

For developpers, a few extra targets are defined:

- `make pot_update` regenerate the po template file (po/xiphos.pot)
- `make po_update_all` update all .po files in the po/ directory
- `make po_update_<LANG>` update a specific <LANG>.po file
- `make help_pot_update` regenerate the help po template file (help/xiphos.pot)
- `make help_po_update_all` update all help .po files in the help/ directory
- `make help_po_update_<LANG>` update a specific help <LANG>.po file

NOTE: running these targets will modify your source directory.

