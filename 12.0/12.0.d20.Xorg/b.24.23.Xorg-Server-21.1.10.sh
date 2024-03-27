# b.24.23.Xorg-Server-21.1.10.sh
# errata
#
# Dependencies Required:
#
#               24.09 libxcvt-0.1.2
#               10.30 Pixman-0.42.2
#               24.20 Xorg Fonts - font-util
#
# Dependencies Recommended (but neeeded):
#
#               25.38 libepoxy-1.5.10
#               17.18 libtirpc-1.3.3
#
# Dependencies Runtime Required:
#
#               24.21 XKeyboardConfig-2.39
#
# Dependencies Runtime Recommended:
#
#               12.11 elogind-252.9
#               24.24.1.4 Xorg Libinput Driver 1.3.0
#
# Dependencies Optional:
#
#               24.xx xcb-util-*
#
#
# Required by:
#
#               24.24.1.2 Xorg Evdev Driver 2.10.6
#               24.24.1.4 Xorg Libinput Driver 1.3.0
#               24.25 twm-1.0.12
#

export PKG="xorg-server-21.1.10"
export PKGLOG_DIR=$LFSLOG/24.23
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


# NO TearFree option
# patch -Np1 -i ../xorg-server-21.1.8-tearfree_backport-1.patch

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup     ..                      \
                --prefix=$XORG_PREFIX   \
                --localstatedir=/var    \
                -Dglamor=true           \
                -Dxkb_output_dir=/var/lib/xkb   \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
ldconfig
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mkdir -p /etc/X11/xorg.conf.d

install -d -m1777 /tmp/.{ICE,X11}-unix

# Note: existing in .8, but omitted in .10
#
# cat >> /etc/sysconfig/createfiles << "EOF"
# /tmp/.ICE-unix dir 1777 root root
# # /tmp/.X11-unix dir 1777 root root - already created in Xwayland
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
