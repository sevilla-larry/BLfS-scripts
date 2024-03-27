# b.24.22.Xwayland-23.2.3.sh
# errata
#
# Dependencies Required:
#
#               24.09 libxcvt-0.1.2
#               10.30 Pixman-0.42.2
#               09.89 Wayland-Protocols-1.32
#               24.20 Xorg Fonts - font-util
#
# Dependencies Recommended:
#
#               25.38 libepoxy-1.5.10
#               17.18 libtirpc-1.3.3
#               24.16 Mesa-23.1.6
#
# Dependencies Runtime
#
#               24.18 Xorg.Applications
#

export PKG="xwayland-23.2.3"
export PKGLOG_DIR=$LFSLOG/24.22
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


sed -i '/install_man/,$d' meson.build

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=$XORG_PREFIX               \
            --buildtype=release                 \
            -Dxkb_output_dir=/var/lib/xkb       \
            ..                                  \
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

# Note: exisintg in .0, but omitted in .3
#
# cat >> /etc/sysconfig/createfiles << "EOF"
# /tmp/.X11-unix dir 1777 root root
# EOF


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
