# d20.24.20.Xorg-Server-21.1.18.sh
#

#
# Dependencies Required:
#
#               d20.24.09 libxcvt-0.1.3
#               d10.10.33 Pixman-0.46.4
#               d20.24.17 Xorg Fonts - font-util
#               d20.24.12 Mesa-25.1.8           (implied)
#
# Dependencies Recommended (but neeeded):
#
#               d20.12.11  dbus-1.16.2 Pass2
#               d20.25.32  libepoxy-1.5.10
#               a.08.91.15 libtirpc-1.3.6
#
# Dependencies Runtime Required:
#
#               d20.24.18 XKeyboardConfig-2.45
#
# Dependencies Runtime Recommended:
#
#               d10.12.12   elogind-255.17
#               d20.24.21.4 Xorg Libinput Driver 1.5.0
#
# Dependencies Optional:
#
#               a.08.91.10 Nettle-3.10.2
#               a.08.91.35 libgcrypt-1.11.2
#               d20.24.11  XCB Utilities
#               d10.49.06  xmlto-0.0.29
#

#
# Required by:
#
#               d20.24.21.2 Xorg Evdev Driver 2.11.0
#               d20.24.21.4 Xorg Libinput Driver 1.5.0
#               d20.24.22   twm-1.0.13.1
#
# Required Runtime by:
#
#               f2.26.02 lightdm-1.32.0
#
# Optionally by:
#
#               e10.09.73 libxkbcommon-1.11.0
#				e43.33.38 gnome-settings-daemon-47.2
#               e43.33.40 gnome-control-center-47.4
#               e43.33.41 Mutter-47.5
#

#
# Kernel Configuration
#
# Device Drivers --->
#   Graphics support --->
#     <*/M> Direct Rendering Manager (XFree86 4.1.0 and higher DRI support) --->
#                                                                       ...  [DRM]
#       < /*/M> DRM driver for VMware Virtual GPU                     [DRM_VMWGFX]
#       < /*/M> DRM Support for bochs dispi vga interface (qemu stdvga)
#                                                                 ...  [DRM_BOCHS]
#       < /*/M> Virtual Box Graphics Card                          [DRM_VBOXVIDEO]
#
#
# fallback
#
# Device Drivers --->
#   Firmware Drivers --->
#     [*] Mark VGA/VBE/EFI FB as generic system framebuffer       [SYSFB_SIMPLEFB]
#   Graphics support --->
#     <*> Direct Rendering Manager (XFree86 4.1.0 and higher DRI support) --->
#                                                                       ...  [DRM]
#       <*> Simple framebuffer driver                              [DRM_SIMPLEDRM]
#

#
#   read NOTES at: https://www.linuxfromscratch.org/blfs/view/12.4/x/xorg-server.html
#

export PKG="xorg-server-21.1.18"
export PKGLOG_DIR=$LFSLOG/24.20
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
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


# NO TearFree option
# patch -Np1 -i ../xorg-server-21.1.18-tearfree_backport-1.patch

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup ..               \
      --prefix=$XORG_PREFIX  \
      --localstatedir=/var   \
      -D glamor=true         \
      -D systemd_logind=true \
      -D xkb_output_dir=/var/lib/xkb    \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
ldconfig -v > $PKGLOG_CHECK 2>> $PKGLOG_ERROR
ninja test >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mkdir -pv /etc/X11/xorg.conf.d              \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m1777 /tmp/.{ICE,X11}-unix   \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cat >> /etc/sysconfig/createfiles << "EOF"  2>> $PKGLOG_ERROR
/tmp/.ICE-unix dir 1777 root root
# /tmp/.X11-unix dir 1777 root root - already created in Xwayland
EOF


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
