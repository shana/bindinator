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
references, call bindinate with `--dependency` or `-d` options. E.g.:

> `bindinate --gir=Pango-1.0 -d=GLIB_SHARP,glib-sharp-3.0 -d=MONO_CAIRO,mono-cairo`

This will create an m4 file for each dependency you have. E.g. for
`MONO_CAIRO`, you'll get a file `m4/MONO_CAIRO.m4` containing:

>
```
AC_DEFUN([CHECK_MONO_CAIRO],
[
	PKG_CHECK_MODULES(MONO_CAIRO, mono-cairo)
	AC_SUBST(MONO_CAIRO_CFLAGS)
	AC_SUBST(MONO_CAIRO_LIBS)
])
```

A `CHECK_MONO_CAIRO` call will be added to `configure.ac` automatically.
`$(MONO_CAIRO_CFLAGS)` will be added to the code generation command and
`$(MONO_CAIRO_LIBS)` will be added to the assembly build command.
