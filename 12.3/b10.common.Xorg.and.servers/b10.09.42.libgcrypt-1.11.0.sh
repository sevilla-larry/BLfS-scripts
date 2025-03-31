# b10.09.42.libgcrypt-1.11.0.sh
#

#
# Dependencies Required:
#
#               b10.09.43 libgpg-error-1.50
#

#
# Required by:
#
#               f2.26.02 lightdm-1.32.0
#
# Optionally by:
#
#               b10.09.74 libxslt-1.1.42
#
#

export PKG="libgcrypt-1.11.0"
export PKGLOG_DIR=$LFSLOG/09.42
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

echo "4. Make doc html ..."
echo "4. Make doc html ..." >> $LFSLOG_PROCESS
echo "4. Make doc html ..." >> $PKGLOG_ERROR
make -C doc html  \
           > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

makeinfo  --html --no-split           \
          -o doc/gcrypt_nochunks.html \
          doc/gcrypt.texi             \
          >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
makeinfo  --plaintext                 \
          -o doc/gcrypt.txt           \
          doc/gcrypt.texi             \
          >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "5. Make Check ..."
echo "5. Make Check ..." >> $LFSLOG_PROCESS
echo "5. Make Check ..." >> $PKGLOG_ERROR
make check  > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "6. Make Install ..."
echo "6. Make Install ..." >> $LFSLOG_PROCESS
echo "6. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -dm755   /usr/share/doc/libgcrypt-1.11.0                 \
                    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -m644    README doc/{README.apichanges,fips*,libgcrypt*} \
                    /usr/share/doc/libgcrypt-1.11.0                 \
                    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -dm755   /usr/share/doc/libgcrypt-1.11.0/html            \
                    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -m644    doc/gcrypt.html/*                               \
                    /usr/share/doc/libgcrypt-1.11.0/html            \
                    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -m644    doc/gcrypt_nochunks.html                        \
                    /usr/share/doc/libgcrypt-1.11.0                 \
                    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -m644    doc/gcrypt.{txt,texi}                           \
                    /usr/share/doc/libgcrypt-1.11.0                 \
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
