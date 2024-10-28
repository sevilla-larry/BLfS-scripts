# g12.34.04.Evince-46.3.1.sh
#

#
# Dependencies Required:
#
#               e11.28.01 adwaita-icon-theme-46.2
#               e11.33.03 gsettings-desktop-schemas-46.1
#               e11.25.17 GTK+-3.24.43
#               f21.49.05 itstool-2.0.7
#               g11.25.33 libhandy-1.8.3
#               b10.09.72 libxml2-2.13.3
#               g11.10.31 OpenJPEG-2.5.2
#
# Dependencies Recommended:
#
#               d10.09.17 GLib-2.80.4
#
# Dependencies Recommended ( but needed ):
#
#               e11.10.33 Poppler-24.08.0
#

export PKG="evince-46.3.1"
export PKGLOG_DIR=$LFSLOG/34.04
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
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
#CPPFLAGS+=" -I/opt/texlive/2024/include"    \
meson setup --prefix=/usr                   \
            --buildtype=release             \
            -D gtk_doc=false                \
            --wrap-mode=nodownload          \
            -D systemduserunitdir=no        \
            ..                              \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# complex test

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
