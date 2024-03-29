# c.35.05.Garcon-4.18.0.sh
#
# Required by:
#
#       35.06 xfce4-panel-4.18.2
#
#
# Dependencies Required:
#
#       10.20 libpng-1.6.39
#       10.30 Pixman-0.42.2
#
# Dependencies Recommended:
#
#       10.05 Fontconfig-2.14.2
#       09.13 GLib-2.74.5
#       24.08 Xorg Libraries
#

export PKG="cairo-1.17.6"
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


sed 's/PTR/void */' -i util/cairo-trace/lookup-symbol.c

sed -e "/@prefix@/a exec_prefix=@exec_prefix@" \
    -i util/cairo-script/cairo-script-interpreter.pc.in

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr       \
            --disable-static    \
            --enable-tee        \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
