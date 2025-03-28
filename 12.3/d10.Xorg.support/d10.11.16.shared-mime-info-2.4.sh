# d10.11.16.shared-mime-info-2.4.sh
#

#
# Dependencies Required:
#
#               d10.09.17 GLib-2.80.4
#               b10.09.72 libxml2-2.13.3
#

#
# Required by:
#
#               25.12 gdk-pixbuf-2.42.10    ???
#
# Runtime needed for test by: ( not implemented )
#
#               d10.09.17 GLib-2.80.4
#
# Optionally by:
#
#               g12.39.03 LibreOffice-24.8.0
#

export PKG="shared-mime-info-2.4"
export PKGLOG_DIR=$LFSLOG/11.16
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG
 

echo "2. Extract tar... xdgmime"
echo "2. Extract tar... xdgmime" >> $LFSLOG_PROCESS
echo "2. Extract tar... xdgmime" >> $PKGLOG_ERROR
tar -xvf ../xdgmime.tar.xz >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

echo "3. Make Build ... xdgmime"
echo "3. Make Build ... xdgmime" >> $LFSLOG_PROCESS
echo "3. Make Build ... xdgmime" >> $PKGLOG_ERROR 
make -C xdgmime > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "4. Meson Setup ..."
echo "4. Meson Setup ..." >> $LFSLOG_PROCESS
echo "4. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr         \
            --buildtype=release   \
            -D update-mimedb=true \
            ..                    \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "5. Ninja Build ..."
echo "5. Ninja Build ..." >> $LFSLOG_PROCESS
echo "5. Ninja Build ..." >> $PKGLOG_ERROR 
ninja >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "6. Ninja Test ..."
echo "6. Ninja Test ..." >> $LFSLOG_PROCESS
echo "6. Ninja Test ..." >> $PKGLOG_ERROR
ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "7. Make Install ..."
echo "7. Make Install ..." >> $LFSLOG_PROCESS
echo "7. Make Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
