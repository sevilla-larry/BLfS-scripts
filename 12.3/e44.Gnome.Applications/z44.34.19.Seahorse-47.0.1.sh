# e43.34.19.Seahorse-47.0.1.sh
#
               
#
# Dependencies Required:
#
#                  xxx.xx.xx Gcr-3.41.2
#                  xxx.xx.xx GnuPG-2.4.7
#                  xxx.xx.xx GPGME-1.24.2
#                  xxx.xx.xx itstool-2.0.7
#                  xxx.xx.xx libhandy-1.8.3
#                  xxx.xx.xx libpwquality-1.4.5
#                  xxx.xx.xx libsecret-0.21.6
#                  e11.13.35 Vala-0.56.17

# Dependencies Recommended:
#
#                  xxx.xx.xx libsoup-3.6.4
#                  xxx.xx.xx OpenSSH-9.9p2
#
# Required by:
#
#

export PKG="seahorse-47.0.1"
export PKGLOG_DIR=$LFSLOG/34.19
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
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

sed -i -r 's:"(/apps):"/org/gnome\1:' data/*.xml &&

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr            \
            --buildtype=release      \
            ..                       \
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
