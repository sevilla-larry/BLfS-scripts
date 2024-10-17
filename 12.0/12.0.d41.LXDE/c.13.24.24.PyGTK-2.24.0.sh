# b.13.24.24.PyGTK-2.24.0.sh
#
# Dependencies Required:
#
#               13.24.22 PyGObject-2.28.7
#               13.22 Python-2.7.18
#               25.02 at-spi2-core-2.48.3   ( atk           module )
#               25.43 Pango-1.50.14         ( pango         module )
#               13.24.18 PyCairo-1.18.2     ( pangocairo    module )
#               25.19 GTK+-2.24.33          ( gtk*          module )
#               25.40 libglade-2.6.4        ( gtk.glade     module )
#
# Recommended but needed by:
#
#               25.31 keybinder-0.3.1
#

export PKG="pygtk-2.24.0"
export PKGLOG_DIR=$LFSLOG/13.24.24
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.bz2 > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


sed -i '1394,1402 d' pango.defs

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr     \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# The tests must be run from an active X dispaly
#
# echo "4. Make Check ..."
# echo "4. Make Check ..." >> $LFSLOG_PROCESS
# echo "4. Make Check ..." >> $PKGLOG_ERROR
# make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
