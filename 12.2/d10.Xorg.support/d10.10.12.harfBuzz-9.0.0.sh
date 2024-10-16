# d10.10.12.HarfBuzz-9.0.0.sh
#

#
# Dependencies Recommended:
#
#               d10.09.17 GLib-2.80.4
#               b10.09.24 icu-75.1
#               d10.10.04 FreeType-2.13.3
#                   ( after HarfBuzz is installed,
#                   reinstall Freetype-2.13.1 )
#
#               ??? 10.10 Graphite2-1.3.14  ??? for LibreOffice
#

#
# Required by:
#
#               e21.25.38 Pango-1.54.0
#
# Recommended by:
#
#               d10.10.04 FreeType-2.13.3
#               e12.25.42 Qt-6.7.2
#
# Note on Cairo
#
# Read: https://linuxfromscratch.org/blfs/view/12.2/general/harfbuzz.html
#

export PKG="harfbuzz-9.0.0"
export PKGLOG_DIR=$LFSLOG/10.12
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

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup ..                  \
            --prefix=/usr       \
            --buildtype=release \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#      -D graphite2=enabled  \

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
