# Bindinator

The bindinator installs a tool called bindinate, which can be called
with the name of a gir file to generate a binding project.

Example:

> `bindinate --gir=WebKit-3.0`

If the package name in the gir file does not match the system package
(i.e., the .pc file), it can be supplied to bindinate.

Example:

> `bindinate --gir=GnomeKeyring-1.0 --package=gnome-keyring-1`

## Dependencies

You'll need a fairly recent gtk-sharp from https://github.com/mono/gtk-sharp.

## Extra cs code

If you want to extend/add code, you can add extra source files to the sources
list in Makefile.am

## Extra package checks

The bindinate tool creates a directory of the same name as the supplied
gir file name and produces the needed files for compiling a binding.
Customization of the gapi output can be done via the usual metadata file.

If the build requires checking for extra packages and getting assembly
references, call bindinate with the `--dependencies` option. E.g.:

> `bindinate --gir=DBusGLib-1.0 --dependencies=GLIBSHARP,DBUSSHARP`

Additionally, you'll need to create an m4 file for each dependency you
have. If you had a dependency `MONOCAIRO`, you'd create a file `m4/cairo.m4`
like this:

>
```
AC_DEFUN([CHECK_MONOCAIRO],
[
	PKG_CHECK_MODULES(MONOCAIRO, mono-cairo)
	AC_SUBST(MONOCAIRO_LIBS)
])
```

The bindinate tool would create an `m4.custom` file with `MONOCAIRO`, add a
`CHECK_MONOCAIRO` call to `configure.ac` and `$(MONOCAIRO_LIBS)` will be added
to the assembly build line automatically.
