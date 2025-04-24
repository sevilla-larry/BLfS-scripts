# e43.34.02.Brasero-3.12.3.sh
#

#                        
#
# Dependencies Required:
#
#               xxx.xx.xx gst-plugins-base-1.24.12
#               xxx.xx.xx itstool-2.0.7
#               xxx.xx.xx libcanberra-0.30
#               xxx.xx.xx libnotify-0.8.4
#
# Dependencies Recommended:
#
#               d10.09.17 GLib-2.82.5
#               xxx.xx.xx libburn-1.5.6
#               xxx.xx.xx libisoburn-1.5.6
#               xxx.xx.xx libisofs-1.5.6
#               xxx.xx.xx Nautilus-47.2
#               xxx.xx.xx tinysparql-3.8.2
#               xxx.xx.xx totem-pl-parser-3.26.6

# Required by:
#
#

export PKG="brasero-3.12.3"
export PKGLOG_DIR=$LFSLOG/34.02
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

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
autoreconf -fiv                 \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
    ./configure --prefix=/usr                    \
                --enable-compile-warnings=no     \
                --enable-cxx-warnings=no         \
                --disable-nautilus               \
                ..                               \
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
