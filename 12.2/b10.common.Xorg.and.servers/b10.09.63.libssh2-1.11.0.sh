# b10.09.63.libssh2-1.11.0.sh
#

#
# Dependencies Optional:
#
#               b10.09.42 libgcrypt-1.11.0
#

#
# Recommended by:
#
#               e11.13.26 Rustc-1.80.1
#
# Optionally by:
#
#               b10.17.02 cURL-8.10.1
#

export PKG="libssh2-1.11.0"
export PKGLOG_DIR=$LFSLOG/09.63
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


patch -Np1 -i ../libssh2-1.11.0-security_fixes-1.patch  \
            > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -E '/^DOCKER_TEST/,/^SSHD_TEST/s/test_(auth_keyboard_info.* |hostkey |simple)/$(NOTHING)/'  \
    -i tests/Makefile.inc                                                                       \
            > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

autoreconf -fi > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

sed 's/ssh-dss,//' -i tests/openssh_server/sshd_config  \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr           \
            --disable-docker-tests  \
            --disable-static        \
            >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

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


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
