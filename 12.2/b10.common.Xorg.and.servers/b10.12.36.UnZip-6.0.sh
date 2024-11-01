# b10.12.36.UnZip-6.0.sh
#

#
# Required by:
#
#               d10.10.05 Fontconfig-2.15.0
#               g12.40.03 Firefox-128.3.1esr
#               ???.49.01 docbook-xml-4.5   ???
#

export PKG="unzip60"
export PKGLOG_DIR=$LFSLOG/12.36
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


patch -Np1 -i ../unzip-6.0-consolidated_fixes-1.patch   \
        >> $PKGLOG_OTHERS   2>> $PKGLOG_ERROR
patch -Np1 -i ../unzip-6.0-gcc14-1.patch                \
        >> $PKGLOG_OTHERS   2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make -f unix/Makefile generic   \
        > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make    prefix=/usr                     \
        MANDIR=/usr/share/man/man1      \
        -f unix/Makefile                \
        install                         \
        > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
#PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
