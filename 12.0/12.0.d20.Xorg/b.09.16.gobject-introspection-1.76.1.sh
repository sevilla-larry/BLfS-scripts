# b.09.16.gobject-introspection-1.76.1.sh
#
# Dependencies Required:
#
#               09.13 GLib-2.76.4
#
#
# Required by:
#
#               35.01 libxfce4util-4.18.1
#               33.03 gsettings-desktop-schemas-44.0 
#
# Recommended by:
#
#               04.20 Polkit-123
#               10.11 HarfBuzz-8.1.1
#               25.43 Pango-1.50.14
#
# Runtime needed / Required by:
#
#               09.13 GLib-2.76.4 test
#
# Optionally by:
#
#               37.06 libwnck-2.30.7
#               25.19 GTK+-2.24.33
#

export PKG="gobject-introspection-1.76.1"
export PKGLOG_DIR=$LFSLOG/09.16
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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


mkdir build 
cd    build 

echo "2. Meson ..."
echo "2. Meson ..." >> $LFSLOG_PROCESS
echo "2. Meson ..." >> $PKGLOG_ERROR
meson setup     --prefix=/usr           \
                --buildtype=release     \
                ..                      \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
