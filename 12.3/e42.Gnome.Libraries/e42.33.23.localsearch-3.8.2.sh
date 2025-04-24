# e42.33.23.localsearch-3.8.2.sh
#

#
# Dependencies Required:
#
#               xxx.xx.xx Exempi-2.6.5
#               xxx.xx.xx gexiv2-0.14.3
#               xxx.xx.xx gst-plugins-base-1.24.12
#               xxx.xx.xx tinysparql-3.8.2
#
# Dependencies Recommended:
#
#                xxx.xx.xx giflib-5.2.2
#                xxx.xx.xx gst-libav-2.24.12
#                xxx.xx.xx ICU-76.1
#                xxx.xx.xx libexif-0.6.25
#                xxx.xx.xx libgxps-0.3.2
#                xxx.xx.xx libseccomp-2.6.0
#                xxx.xx.xx Poppler-25.02.0
#                xxx.xx.xx UPower-1.90.7
#               

#
# Required by:
#
#

export PKG="localsearch-3.8.2"
export PKGLOG_DIR=$LFSLOG/33.23
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

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr           \
            --buildtype=release     \
            -D systemd_user_services=false \
            -D man=false                   \
            -D miner_rss=false             \
            .. 
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
