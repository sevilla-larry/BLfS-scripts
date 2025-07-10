# e41.11.10.ibus-1.5.31.sh
#

#
# Dependencies Required:
#
#               e10.11.12 ISO Codes-4.17.0
#               e11.13.36 Vala-0.56.17
#
# Dependencies Recommended:
#
#               e43.33.31 DConf-0.40.0 / DConf-Editor-45.0.1
#               d10.09.17 GLib-2.82.5
#               e11.25.16 GTK-3.24.48
#               e41.25.17 GTK-4.16.12
#               e11.25.35 libnotify-0.8.4
#
# Dependencies Optional:
#
#               e13.13.24.06 D-Bus Python-1.3.2
#               e13.13.24.23 PyGObject-3.50.0
#               e10.09.71    libxkbcommon-1.8.0
#               d10.09.97    Wayland-1.23.0
#

#
# Required by:
#
#               e43.33.42 gnome-shell-47.4
#
# Recommended by:
#
#               e43.33.40 gnome-control-center-47.4
#

export PKG="ibus-1.5.31"
export PKGLOG_DIR=$LFSLOG/11.10
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir -vp               /usr/share/unicode/ucd  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
unzip -vo ../UCD.zip -d /usr/share/unicode/ucd  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -e 's@/desktop/ibus@/org/freedesktop/ibus@g'    \
    -i data/dconf/org.freedesktop.ibus.gschema.xml  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

if ! [ -e /usr/bin/gtkdocize ]; then
  sed '/docs/d;/GTK_DOC/d' -i Makefile.am configure.ac  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
fi

SAVE_DIST_FILES=1 NOCONFIGURE=1 \
    ./autogen.sh                \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr               \
            --sysconfdir=/etc           \
            --disable-python2           \
            --disable-appindicator      \
            --disable-emoji-dict        \
            --disable-gtk2              \
            --disable-systemd-services  \
            >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make -k check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
