# e42.33.21.evolution-data-server-3.54.3.sh
#

#
# Dependencies Required:
#
#               e41.09.47  libical-3.0.19
#               e42.33.04  libsecret-0.21.6
#               a.08.91.32 NSS-3.108
#               a.08.91.18 SQLite-3.49.1
#
# Dependencies Recommended:
#
#               e42.33.14  gnome-online-accounts-3.52.3.1
#               d10.09.17  GLib-2.82.5
#               e11.25.16  GTK-3.24.48
#               e41.25.17  GTK-4.16.12
#               a.08.91.07 icu-76.1
#               e11.42.26  libcanberra-0.30
#               e42.33.18  libgweather-4.4.4
#               e11.13.36  Vala-0.56.17
#               e41.25.45  WebKitGTK-2.48.3 (GTK-4) (errata)
#

#
# Required by:
#
#               e43.33.42 gnome-shell-47.4
#
# Optionally by:
#
#               g22.39.03 LibreOffice-25.2.3	(errata)
#

export PKG="evolution-data-server-3.54.3"
export PKGLOG_DIR=$LFSLOG/33.21
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build
cd    build

echo "2. CMake Setup ..."
echo "2. CMake Setup ..." >> $LFSLOG_PROCESS
echo "2. CMake Setup ..." >> $PKGLOG_ERROR
cmake -D CMAKE_INSTALL_PREFIX=/usr  \
      -D SYSCONF_INSTALL_DIR=/etc   \
      -D ENABLE_VALA_BINDINGS=ON    \
      -D ENABLE_INSTALLED_TESTS=ON  \
      -D WITH_OPENLDAP=OFF          \
      -D WITH_KRB5=OFF              \
      -D ENABLE_INTROSPECTION=ON    \
      -D ENABLE_GTK_DOC=OFF         \
      -D WITH_LIBDB=OFF             \
      -D WITH_SYSTEMDUSERUNITDIR=no \
      -W no-dev                     \
      -G Ninja                      \
      ..                            \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "5. Ninja Test ..."
echo "5. Ninja Test ..." >> $LFSLOG_PROCESS
echo "5. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
