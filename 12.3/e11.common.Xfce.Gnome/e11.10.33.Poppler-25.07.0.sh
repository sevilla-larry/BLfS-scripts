# e11.10.33.Poppler-25.07.0.sh
# errata/svn
#
# with    GTK-3.xx
# withOUT Qt-6.x
#

#
# Dependencies Required:
#
#               a.08.9x.?1 CMake-3.31.5
#               d10.10.05  Fontconfig-2.16.0
#               d10.09.17  GLib-2.82.5
#
# Dependencies Recommended:
#
#               a.08.91.23 boost-1.87.0
#               e10.25.04  Cairo-1.18.2
#               g11.04.08  GPGME-1.23.2          ???
#               e10.10.14  Little CMS-2.17
#               e10.10.18  libjpeg-turbo-3.0.1
#               d10.10.22  libpng-1.6.46
#               e10.10.26  libtiff-4.7.0
#               a.08.91.32 NSS-3.108
#               e10.10.31  OpenJPEG-2.5.2
#               e42.33.23  localsearch-3.8.2
#       withOUT Qt-6.x
#
# Dependencies Optional:
#
#               a.08.93.04 cURL-8.12.1
#               e10.25.10  gdk-pixbuf-2.42.12
#               a.08.93.05 Git-2.48.1
#               e11.25.16  GTK-3.24.48
#

#
# Recommended by:
#
#               g22.39.03 LibreOffice-25.2.3	(errata)
#
# Recommended ( but needed ) by:
#
#               g42.34.04 Evince-46.3.1
#               e44.34.04 Evince-46.3.1
#
# Optionally by:
#
#               e23.35.12 tumbler-4.20.0
#

export PKG="poppler-25.07.0"
export PKGLOG_DIR=$LFSLOG/10.33
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

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
      -D ENABLE_QT6=OFF                     \
      -D ENABLE_UNSTABLE_API_ABI_HEADERS=ON \
      -G Ninja                              \
      ..                                    \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
# Note: Poppler detected that NSS3 has lower version
#      -D ENABLE_NSS3=OFF                    \
#      -D ENABLE_GPGME=OFF                   \
#

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4.1 Git some Test ..."
echo "4.1 Git some Test ..." >> $LFSLOG_PROCESS
echo "4.1 Git some Test ..." >> $PKGLOG_ERROR
git clone --depth 1     \
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

install -v -m755 -d           /usr/share/doc/poppler-25.07.0    \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -vr ../glib/reference/html /usr/share/doc/poppler-25.07.0    \
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


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
