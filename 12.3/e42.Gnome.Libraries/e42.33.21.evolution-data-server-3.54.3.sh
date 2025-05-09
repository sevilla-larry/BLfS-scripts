# e42.33.21.evolution-data-server-3.54.3.sh
#

#
# Dependencies Required:
#
#               xxx.xx.xx libical-3.0.19
#               xxx.xx.xx libsecret-0.21.6
#               xxx.xx.xx nss-3.108
#               xxx.xx.xx SQLite-3.49.1
#                        
#
# Dependencies Recommended:
#
#              xxx.xx.xx gnome-online-accounts-3.52.3.1
#              d10.09.17 Glib-2.82.5
#              xxx.xx.xx GTK-3.24.48
#              xxx.xx.xx GTK-4.16.12
#              xxx.xx.xx ICU-76.1
#              xxx.xx.xx libcanberra-0.30
#              e42.33.18 libgweather-4.4.4
#              e11.13.35 Vala-0.56.17

#
# Required by:
#
#

export PKG="evolution-data-server-3.54.3"
export PKGLOG_DIR=$LFSLOG/33.21
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES= `pwd`

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
cmake -D CMAKE_INSTALL_PREFIX=/usr    \
      -D SYSCONF_INSTALL_DIR=/etc     \
      -D ENABLE_VALA_BINDINGS=ON      \
      -D ENABLE_INSTALLED_TESTS=ON    \
      -D WITH_OPENLDAP=OFF            \
      -D WITH_KRB5=OFF                \
      -D ENABLE_INTROSPECTION=ON      \
      -D ENABLE_GTK_DOC=OFF           \
      -D WITH_LIBDB=OFF               \
      -D WITH_SYSTEMDUSERUNITDIR=no   \
      -W no-dev                       \
      -G Ninja                        \
      ..                              \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
