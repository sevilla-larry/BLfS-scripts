# d10.09.99.Wayland-1.24.0.sh
#

#
# Dependencies Required:
#
#               a.08.91.08 libxml2-2.14.5
#
# Dependencies Optional:
#
#               d10.49.06  xmlto-0.0.29
#               a.08.91.36 docbook-xml-4.5
#               a.08.91.37 docbook-xsl-nons-1.79.2
#               a.08.91.38 libxslt-1.1.43
#

#
# Required by:
#
#               d10.09.A0 Wayland-Protocols-1.45
#               e32.37.06 kwayland-6.3.2 for lxqt
#
# Recommended by:
#
#               d20.09.73 libxkbcommon-1.11.0
#               e10.09.73 libxkbcommon-1.11.0
#               d20.25.42 Vulkan-Loader-1.4.321
#				e43.33.38 gnome-settings-daemon-47.2
#               e43.33.41 Mutter-47.5
#               e12.25.40 Qt-6.9.1          (errata/svn)
#
# Optionally by:
#
#               d20.42.41.libva-2.22.0
#               e41.11.10 ibus-1.5.31
#               e41.25.45 WebKitGTK-2.48.3          (errata)
#               e41.42.15 gst-plugins-good-1.26.3   (errata)
#               e41.42.16 gst-plugins-bad-1.26.3    (errata)
#

export PKG="wayland-1.24.0"
export PKGLOG_DIR=$LFSLOG/09.99
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


mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup     ..                      \
                --prefix=/usr           \
                --buildtype=release     \
                -D documentation=false  \
                > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
env -u XDG_RUNTIME_DIR ninja test   \
        > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
