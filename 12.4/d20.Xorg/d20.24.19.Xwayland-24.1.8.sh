# d20.24.19.Xwayland-24.1.8.sh
#

#
# Dependencies Required:
#
#               d20.24.09 libxcvt-0.1.3
#               d10.10.33 Pixman-0.46.4
#               d10.09.A0 Wayland-Protocols-1.45
#               d20.24.17 Xorg Fonts - font-util
#
# Dependencies Recommended:
#
#               d20.25.32  libepoxy-1.5.10
#               a.08.91.15 libtirpc-1.3.6
#               d20.24.12  Mesa-25.1.8
#
# Dependencies Runtime:
#
#               d20.24.14 Xorg.Applications
#
# Dependencies Optional:
#
#               a.08.93.05 Git-2.50.1
#               a.08.91.35 libgcrypt-1.11.2
#               a.08.91.10 Nettle-3.10.2
#               d10.49.06  xmlto-0.0.29
#
#   read NOTES at: https://www.linuxfromscratch.org/blfs/view/12.4/x/xwayland.html
#

#
# Recommended by:
#
#               e43.33.41 Mutter-47.5
#
# Optionally by:
#
#               e10.09.73 libxkbcommon-1.11.0
#				e43.33.38 gnome-settings-daemon-47.2
#               e43.33.40 gnome-control-center-47.4
#


export PKG="xwayland-24.1.8"
export PKGLOG_DIR=$LFSLOG/24.19
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
meson   setup ..                        \
        --prefix=$XORG_PREFIX           \
        --buildtype=release             \
        -D xkb_output_dir=/var/lib/xkb  \
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
