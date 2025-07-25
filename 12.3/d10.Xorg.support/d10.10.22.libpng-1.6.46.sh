# d10.10.22.libpng-1.6.46.sh
#

#
# Required by:
#
#               d20.24.14 Xorg Applications
#				e10.25.04 Cairo-1.18.2
#               e10.25.10 gdk-pixbuf-2.42.12
#               e10.10.19 libjxl-0.11.1
#
# Recommended by:
#
#               d10.10.04 FreeType-2.13.3
#               e11.10.33 Poppler-25.02.0
#               e10.10.27 libwebp-1.5.0
#               e41.42.15 gst-plugins-base-1.26.3   (errata)
#               e12.25.40 Qt-6.9.1          (errata/svn)
#
# Optional by:
#
#               d10.10.32 Pixman-0.44.2
#               e23.35.12 tumbler-4.20.0
#               e10.10.31 OpenJPEG-2.5.3
#

export PKG="libpng-1.6.46"
export PKGLOG_DIR=$LFSLOG/10.22
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


gzip -cd ../libpng-1.6.46-apng.patch.gz | patch -p1 \
        > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr    \
            --disable-static \
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

mkdir -v /usr/share/doc/libpng-1.6.46   \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v README libpng-manual.txt /usr/share/doc/libpng-1.6.46 \
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
