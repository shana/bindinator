AC_INIT([bindinator], [1.0])
AC_CONFIG_SRCDIR([README])
AC_CANONICAL_TARGET
AM_INIT_AUTOMAKE
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


AC_CONFIG_FILES([
	Makefile
	bindinate/Makefile
	bindinate/bindinate
	bindinate/gir2gapi.xslt
])
AC_CONFIG_COMMANDS([default],[[ echo timestamp > stamp-h ]],[[]])
AC_OUTPUT

echo ""
echo "Configuration summary"
echo "---------------------"
echo ""
echo "   * Installation prefix: \$prefix"
echo ""
