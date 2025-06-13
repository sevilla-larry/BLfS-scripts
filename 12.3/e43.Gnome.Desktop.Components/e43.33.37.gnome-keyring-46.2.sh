# e43.33.37.gnome-keyring-46.2.sh
#

#                        
#
# Dependencies Required:
#
#               xxx.xx.xx dbus-1.16.0
#               xxx.xx.xx Gcr-3.41.2

# Dependencies Recommended:

#               xxx.xx.xx Linux-PAM-1.7.0
#               xxx.xx.xx libxslt-1.1.42
#               xxx.xx.xx OpenSSH-9.9p2
#
# Required by:
#
#

export PKG="gnome-keyring-46.2"
export PKGLOG_DIR=$LFSLOG/33.37
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

sed -i 's:"/desktop:"/org:' schema/*.xml &&

mkdir build
cd    build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
autoreconf -fiv                 \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
    ./configure --prefix=/usr           \
                --sysconfdir=/etc       \
                --enable-ssh-agent      \
                ..
           >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Install ..."
echo "3. Make Install ..." >> $LFSLOG_PROCESS
echo "3. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
