# g11.10.33.Poppler-24.11.0.sh
#

#
# Dependencies Required:
#
#               b10.13.03 CMake-3.30.2
#               d10.10.05 Fontconfig-2.15.0
#               d10.09.17 GLib-2.80.4
#
# Dependencies Recommended:
#
#               b10.09.07 boost-1.86.0
#               e10.25.04 Cairo-1.18.0
#               ??? GPGME
#               e10.10.14 Little CMS-2.16
#               e10.10.18 libjpeg-turbo-3.0.1
#               d10.10.22 libpng-1.6.43
#               e10.10.26 libtiff-4.7.0         (errata)
#               g11.04.17 NSS-3.103         ??? Poppler detected lower version
#               g11.10.31 OpenJPEG-2.5.2
#               ??? Qt6
#
# Dependencies Optional:
#
#               b10.17.02 cURL-8.10.1
#               e10.25.10 gdk-pixbuf-2.42.12
#               d10.13.09 Git-2.46.0
#               e11.25.17 GTK+-3.24.43
#               ??? Qt5
#

#
# Recommended by:
#
#               g12.39.03 LibreOffice-24.8.0
#
# Recommended ( but needed ) by:
#
#               g12.34.04 Evince-46.3.1
#

export PKG="poppler-24.11.0"
export PKGLOG_DIR=$LFSLOG/10.33
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG
 

mkdir    build
cd       build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_BUILD_TYPE=Release           \
      -D CMAKE_INSTALL_PREFIX=/usr          \
      -D TESTDATADIR=$PWD/testfiles         \
      -D ENABLE_QT5=OFF                     \
      -D ENABLE_UNSTABLE_API_ABI_HEADERS=ON \
      -G Ninja                              \
      ..                                    \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
# Note: Poppler detected that NSS3 has lower version
#      -D ENABLE_NSS3=OFF                    \

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4.1 Git some Test ..."
echo "4.1 Git some Test ..." >> $LFSLOG_PROCESS
echo "4.1 Git some Test ..." >> $PKGLOG_ERROR
 git clone --depth 1    \
        https://gitlab.freedesktop.org/poppler/test.git \
        testfiles       \
      > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "4.2 Ninja Test ..."
echo "4.2 Ninja Test ..." >> $LFSLOG_PROCESS
echo "4.2 Ninja Test ..." >> $PKGLOG_ERROR
LC_ALL=en_US.UTF-8 ninja test   \
      > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -m755 -d           /usr/share/doc/poppler-24.08.0    \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -vr ../glib/reference/html /usr/share/doc/poppler-24.08.0    \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "6.1. Extract Encoding Data tar ..."
echo "6.1. Extract Encoding Data tar ..." >> $LFSLOG_PROCESS
echo "6.1. Extract Encoding Data tar ..." >> $PKGLOG_ERROR
tar -vxf ../../poppler-data-0.4.12.tar.gz   \
        >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

cd poppler-data-0.4.12

echo "6.2. Install Encoding Data ..."
echo "6.2. Install Encoding Data ..." >> $LFSLOG_PROCESS
echo "6.2. Install Encoding Data ..." >> $PKGLOG_ERROR
make prefix=/usr install    \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cd ..

cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
