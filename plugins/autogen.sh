#!/bin/sh
# Run this to generate all the initial makefiles, etc.

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.
REQUIRED_AUTOMAKE_VERSION=1.9
PKG_NAME=plugins

(test -f $srcdir/configure.in \
  && test -f $srcdir/nortel/ike/payloadgen.c) || {
    echo -n "**Error**: Directory "\`$srcdir\'" does not look like the"
    echo " top-level $PKG_NAME directory"
    exit 1
}

(cd $srcdir;
    autoreconf --install --symlink &&
    autoreconf &&
    ./configure $@
)

