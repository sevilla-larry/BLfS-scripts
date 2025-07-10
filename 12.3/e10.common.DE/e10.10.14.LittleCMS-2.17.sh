# e10.10.14.LittleCMS-2.17.sh
#

#
# Dependencies Optional:
#
#               e10.10.18 libjpeg-turbo-3.0.1
#               e10.10.26 libtiff-4.7.0
#

#
# Required by:
#
#               e41.10.17 libgxps-0.3.2
#               e11.12.08 Colord-1.4.7
#               e41.25.45 WebKitGTK-2.46.6
#               e11.10.19 libjxl-0.11.1
#               e44.34.08 gnome-color-manager-3.36.2
#               e12.10.20 libmng-2.0.3
#
# Recommended by:
#
#               e11.10.33 Poppler-25.02.0
#               g22.39.03 LibreOffice-25.2.3	(errata)
#               e44.34.03 EOG-47.0
#               e12.25.42 Qt-6.7.2              ???
#
# Optionally by:
#
#               e10.10.31 OpenJPEG-2.5.3
#               e41.42.16 gst-plugins-bad-1.26.3    (errata)
#

export PKG="lcms2-2.17"
export PKGLOG_DIR=$LFSLOG/10.14
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


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr       \
            --disable-static    \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
