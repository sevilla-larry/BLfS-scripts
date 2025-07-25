# e10.25.37.Pango-1.56.1.sh
#

#
# Dependencies Required:
#
#               d10.10.05 Fontconfig-2.16.0
#               e10.10.06 FriBidi-1.0.16
#               d10.09.17 GLib-2.82.5
#
# Dependencies Recommended:
#
#               e10.25.04 Cairo-1.18.2 ( needed )
#               d20.24.08 Xorg Libraries
#

#
# Required by:
#
#               e21.25.16 GTK-3.24.48
#               e11.10.24 librsvg-2.59.2
#               e41.25.17 GTK-4.16.12
#               e41.25.39 Pangomm-2.56.1
#               e31.27.03 openbox-3.6.1
#
# Recommended by:
#
#               e41.42.15 gst-plugins-base-1.26.3   (errata)
#
# Optionally by:
#
#               e41.42.16 gst-plugins-bad-1.26.3    (errata)
#

export PKG="pango-1.56.1"
export PKGLOG_DIR=$LFSLOG/25.37
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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
meson setup --prefix=/usr               \
            --buildtype=release         \
            --wrap-mode=nofallback      \
            -D introspection=enabled    \
            ..                          \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
