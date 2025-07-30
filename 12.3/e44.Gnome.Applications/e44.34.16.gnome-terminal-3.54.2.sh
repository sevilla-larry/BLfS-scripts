# e44.34.16.gnome-terminal-3.54.2.sh
#

#
# Dependencies Required:
#
#               e43.33.31  DConf-0.40.0
#               e11.33.03  gsettings-desktop-schemas-47.1
#               e11.49.05  itstool-2.0.7
#               e11.25.32  libhandy-1.8.3
#               a.08.91.11 PCRE2-10.45
#               e42.33.07  VTE-0.76.4
#
# Dependencies Recommended:
#
#               e43.33.42 gnome-shell-47.4
#               e43.33.35 Nautilus-47.2
#
# Dependencies Optional:
#
#               e41.09.03 appstream-glib-0.8.3
#               d10.11.04 desktop-file-utils-0.28
#

export PKG="gnome-terminal-3.54.2"
export PKGLOG_DIR=$LFSLOG/34.16
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


sed -i -r 's:"(/system):"/org/gnome\1:g'    \
    src/external.gschema.xml                \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr        \
            --buildtype=release  \
            ..                   \
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

rm -v /usr/lib/systemd/user/gnome-terminal-server.service   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
