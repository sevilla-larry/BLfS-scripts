# b30.15.04.Net-tools-2.10.sh
#

export PKG="net-tools-2.10"
export PKGLOG_DIR=$LFSLOG/15.04
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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

export BINDIR='/usr/bin' SBINDIR='/usr/bin'

echo "2. Make Build ..."
echo "2. Make Build ..." >> $LFSLOG_PROCESS
echo "2. Make Build ..." >> $PKGLOG_ERROR
yes "" | make -j1 > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. Make Install ..."
echo "3. Make Install ..." >> $LFSLOG_PROCESS
echo "3. Make Install ..." >> $PKGLOG_ERROR
make DESTDIR=$PWD/install -j1 install		\
		> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

rm -v  install/usr/bin/{nis,yp}domainname		\
		>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
rm -v  install/usr/bin/{hostname,dnsdomainname,domainname,ifconfig}	\
		>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
rm -vr install/usr/share/man/man1				\
		>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
rm -v  install/usr/share/man/man8/ifconfig.8	\
		>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

unset BINDIR SBINDIR

chown -vR root:root install						\
		>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -va install/* /								\
		>> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
#PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
