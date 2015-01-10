AC_INIT([bindinator], [1.0])
AC_CONFIG_SRCDIR([README.md])
AC_CANONICAL_TARGET
AM_INIT_AUTOMAKE([foreign])
AM_MAINTAINER_MODE
AC_PROG_INSTALL

AC_PATH_PROG(XSLTPROC, xsltproc, no)
if test "x$XSLTPROC" = "xno" ; then
	AC_MSG_ERROR([xsltproc not found])
fi
AC_SUBST(XSLTPROC)

PKG_CHECK_MODULES(GIR, gobject-introspection-1.0, has_gir=true, has_gir=false)
if test "x$has_gir" = "xfalse"; then
	AC_MSG_ERROR([gobject-introspection not found, cannot determine gir directory])
fi

GIRDIR=`pkg-config --variable=girdir gobject-introspection-1.0`/
AC_SUBST(GIRDIR)

AC_PATH_PROG(GAPIFIXUP, gapi3-fixup, no)
if test "x$GAPIFIXUP" = "xno"; then
	AC_MSG_CHECKING(for gapi3-fixup.exe)
	GAPIFIXUP=`which gapi3-fixup.exe 2> /dev/null`
	if test "x$GAPIFIXUP" = "xno" ; then
		AC_MSG_ERROR(['gapi3_fixup'/'gapi3-fixup.exe' not found.])
	fi
	AC_MSG_RESULT($GAPIFIXUP)
	GAPIFIXUP="$MONO $GAPI_FIXUP"
fi
AC_SUBST(GAPIFIXUP)

AC_PATH_PROG(UUIDGEN, uuidgen, no)
if test "x$UUIDGEN" = "xno" ; then
	AC_MSG_ERROR([uuidgen not found])
fi
AC_SUBST(UUIDGEN)

AC_PATH_PROG(PERL, perl, no)
if test "x$PERL" = "xno" ; then
	AC_MSG_ERROR([perl not found])
fi
AC_SUBST(PERL)

AC_PATH_PROG(UNIX2DOS, unix2dos, no)
if test "x$UNIX2DOS" = "xno" ; then
	AC_MSG_ERROR([dos2unix and unix2dos not found])
fi
AC_SUBST(UNIX2DOS)

AC_CONFIG_FILES([
	Makefile
	bindinate/Makefile
	bindinate/bindinate
	bindinate/gir2gapi.xslt
])
AC_CONFIG_COMMANDS([default],[[ echo timestamp > stamp-h ]],[[]])
AC_OUTPUT

cat <<EOF

Configuration summary
---------------------

   * Installation prefix: ${prefix}

EOF
