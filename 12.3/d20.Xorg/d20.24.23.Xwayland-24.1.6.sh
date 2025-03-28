# d20.24.23.Xwayland-24.1.6.sh
# errata
#

#
# Dependencies Required:
#
#               d20.24.09 libxcvt-0.1.2
#               d10.10.32 Pixman-0.43.4
#               d10.09.98 Wayland-Protocols-1.38    (svn)
#               d20.24.21 Xorg Fonts - font-util
#
# Dependencies Recommended:
#
#               d20.25.35 libepoxy-1.5.10
#               d20.24.16 Mesa-24.1.5
#
# Dependencies Runtime
#
#               d20.24.18 Xorg.Applications
#

#
#   read NOTES at: https://www.linuxfromscratch.org/blfs/view/12.2/x/xwayland.html
#

export PKG="xwayland-24.1.6"
export PKGLOG_DIR=$LFSLOG/24.23
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
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


sed -i '/install_man/,$d' meson.build           \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup ..                       \
      --prefix=$XORG_PREFIX          \
      --buildtype=release            \
      -D xkb_output_dir=/var/lib/xkb \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# Test is VERY complex

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cat >> /etc/sysconfig/createfiles << "EOF"  2>> $PKGLOG_ERROR
/tmp/.X11-unix dir 1777 root root
EOF



cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
