# e10.25.04.Cairo-1.18.0.sh
#

#
# Dependencies Required:
#
#               d10.10.22 libpng-1.6.43
#               d10.10.32 Pixman-0.43.4
#
# Dependencies Recommended:
#
#               d10.10.05 Fontconfig-2.15.0
#               d10.09.17 GLib-2.80.4
#               d20.24.08 Xorg Libraries
#
# Dependencies Optional:
#
#             ? e21.25.17 GTK+-3.24.43 (circular) ?
#               d20.25.38 Libdrm-2.4.122
#               b10.09.72 libxml2-2.13.3
#               d20.24.16 Mesa-24.1.5
#

#
# Required by:
#
#               e23.35.07 xfce4-panel-4.18.6
#               ??.13.24.18 PyCairo-1.18.2      ???
#
# Recommended ( but needed ) by:
#
#               e10.25.38 Pango-1.54.0
#

export PKG="cairo-1.18.0"
export PKGLOG_DIR=$LFSLOG/25.04
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
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


mkdir build
cd    build


echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr       \
            --buildtype=release \
            ..                  \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
