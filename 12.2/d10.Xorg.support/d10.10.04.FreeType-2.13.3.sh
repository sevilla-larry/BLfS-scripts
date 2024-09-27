# d10.10.04.FreeType-2.13.3.sh
#

#
# Dependencies Recommended:
#
#               10.11 HarfBuzz-8.1.1                    ???
#                   ( first, install FreeType,
#                       after HarfBuzz is installed,
#                       reinstall FreeType )
#               10.21 libpng-1.6.40                     ???
#

#
# Required by:
#
#               d10.10.05 Fontconfig-2.15.0
#               25.43 Pango-1.50.14                     ???
#
# Recommended by:
#
#               10.11 HarfBuzz-8.1.1                    ???
#                   ( first, install FreeType,
#                       after HarfBuzz is installed,
#                       reinstall FreeType )
#

export PKG="freetype-2.13.3"
export PKGLOG_DIR=$LFSLOG/10.04.$PKGPASS
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


tar xvf ../freetype-doc-2.13.3.tar.xz   \
    --strip-components=2 -C docs        \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:"         \
    -i include/freetype/config/ftoption.h           \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

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

cp -v -R docs -T /usr/share/doc/freetype-2.13.3 \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
rm -v /usr/share/doc/freetype-2.13.3/freetype-config.1  \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
