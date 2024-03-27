# b.09.13.GLib-2.76.4.sh
#
# Dependencies Recommended:
#
#               09.69 libxslt-1.1.38 ( not installed, man=false )
#               09.80 PCRE2-10.42    ( installed as subproject )
#
# Dependencies Runtime:
#
#               09.16 gobject-introspection-1.74.0
#               11.04 desktop-file-utils-0.26
#               11.17 shared-mime-info-2.2
#               12.10 dbus-1.14.8
#
#
# Required by:
#
#               04.20 Polkit-123
#               09.16 gobject-introspection-1.76.1
#               11.04 desktop-file-utils-0.26
#               11.17 shared-mime-info-2.2
#               37.02 libfm-extra-1.3.2
#               25.02 at-spi2-core-2.48.3
#               25.12 gdk-pixbuf-2.42.10
#               25.43 Pango-1.50.14
#               09.07 dbus-glib-0.112
#               etc
#
# Recommended by:
#
#               10.11 HarfBuzz-8.1.1
#

export PKG="glib-2.76.4"
export PKGLOG_DIR=$LFSLOG/09.13
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG
 

patch -Np1 -i ../glib-skip_warnings-1.patch

mkdir build
cd    build

echo "2. Meson ..."
echo "2. Meson ..." >> $LFSLOG_PROCESS
echo "2. Meson ..." >> $PKGLOG_ERROR
meson setup ..                  \
            --prefix=/usr       \
            --buildtype=release \
            -Dman=false         \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#            -Dman=true          \

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mkdir -p /usr/share/doc/glib-2.76.4
cp -r ../docs/reference/{gio,glib,gobject} /usr/share/doc/glib-2.76.4

# echo "The GLib test suite requires desktop-file-utils for some tests."
# echo "The GLib test suite requires desktop-file-utils for some tests." >> $LFSLOG_PROCESS
# echo "The GLib test suite requires desktop-file-utils for some tests." >> $PKGLOG_ERROR

# echo "Do not run the test suite as root"
# echo "   or some tests will fail unexpectedly"
# echo "   and leave some non-FHS-compliant directories"
# echo "   in the /usr hierarchy."
# echo "Do not run the test suite as root"                >> $LFSLOG_PROCESS
# echo "   or some tests will fail unexpectedly"          >> $LFSLOG_PROCESS
# echo "   and leave some non-FHS-compliant directories"  >> $LFSLOG_PROCESS
# echo "   in the /usr hierarchy."                        >> $LFSLOG_PROCESS
# echo "Do not run the test suite as root"                >> $PKGLOG_ERROR
# echo "   or some tests will fail unexpectedly"          >> $PKGLOG_ERROR
# echo "   and leave some non-FHS-compliant directories"  >> $PKGLOG_ERROR
# echo "   in the /usr hierarchy."                        >> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
