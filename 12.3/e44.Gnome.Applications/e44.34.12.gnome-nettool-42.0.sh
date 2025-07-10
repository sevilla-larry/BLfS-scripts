# e43.34.12.gnome-nettool-42.0.sh
#

#
# Dependencies Required:
#
#               e11.25.16 GTK-3.24.48
#               e11.49.05 itstool-2.0.7
#               e11.33.17 libgtop-2.41.3
#
# Dependencies Runtime:
#
#               e41.16.02 BIND Utilities-9.20.6
#               b10.16.05 Nmap-7.95
#               b10.15.04 Net-tools-2.10
#               e41.16.06 Traceroute-2.1.6
#               e41.16.07 Whois-5.4.3
#

export PKG="gnome-nettool-42.0"
export PKGLOG_DIR=$LFSLOG/34.12
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
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


patch -Np1 -i ../gnome-nettool-42.0-ping_and_netstat_fixes-1.patch  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -i '/merge_file/s/(.*/(/' data/meson.build                      \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr           \
            --buildtype=release     \
            ..                      \
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
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
