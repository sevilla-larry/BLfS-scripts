# b.10.04.FreeType-2.13.1.sh
#
# Dependencies Recommended:
#
#               10.11 HarfBuzz-8.1.1 ( first, install FreeType, after HarfBuzz is installed, reinstall FreeType )
#               10.21 libpng-1.6.40
#               12.36 Which-2.21
#
#
# Required by:
#
#               10.05 Fontconfig-2.14.2
#               25.43 Pango-1.50.14
#
# Recommended by:
#
#               10.11 HarfBuzz-8.1.1 ( first, install FreeType, after HarfBuzz is installed, reinstall FreeType )
#

export PKG="freetype-2.13.1"
export PKGLOG_DIR=$LFSLOG/10.04.$PKGPASS
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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


tar xvf ../freetype-doc-2.13.1.tar.xz   \
    --strip-components=2 -C docs        \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg
sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:"         \
    -i include/freetype/config/ftoption.h

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR

./configure --prefix=/usr               \
            --enable-freetype-config    \
            --disable-static            \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -m755 -d /usr/share/doc/freetype-2.13.0
cp -R docs/*     /usr/share/doc/freetype-2.13.0
rm /usr/share/doc/freetype-2.13.0/freetype-config.1


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
