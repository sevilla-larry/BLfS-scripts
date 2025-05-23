# e11.09.33.libassuan-3.0.2.sh
#

#
# Dependencies Required
#
#               a.08.91.34 libgpg-error-1.51
#

#
# Required by:
#
#               e11.04.08 GPGME-1.24.2
#


export PKG="libassuan-3.0.2"
export PKGLOG_DIR=$LFSLOG/09.33
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
tar xvf $PKG.tar.bz2 > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr   \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "   Make Documentation ..."
echo "   Make Documentation ..." >> $LFSLOG_PROCESS
echo "   Make Documentation ..." >> $PKGLOG_ERROR
make -C doc html    \
          >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
makeinfo --html --no-split -o doc/assuan_nochunks.html doc/assuan.texi  \
          >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
makeinfo --plaintext       -o doc/assuan.txt           doc/assuan.texi  \
          >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -dm755   /usr/share/doc/libassuan-3.0.1/html \
          >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -m644 doc/assuan.html/*                      \
                    /usr/share/doc/libassuan-3.0.1/html \
          >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -m644 doc/assuan_nochunks.html               \
                    /usr/share/doc/libassuan-3.0.1      \
          >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -m644 doc/assuan.{txt,texi}                  \
                    /usr/share/doc/libassuan-3.0.1      \
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
