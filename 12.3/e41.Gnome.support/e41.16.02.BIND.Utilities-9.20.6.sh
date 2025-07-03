# e41.16.02.BIND.Utilities-9.20.6.sh
#

#
# Dependencies Required:
#
#               e41.09.68  liburcu-0.15.1
#               a.08.91.13 libuv-1.50.0
#
# Dependencies Recommended:
#
#               e41.09.28  JSON-C-0.18
#               a.08.91.67 nghttp2-1.64.0
#
# Dependencies Optional:
#
#               a.08.92.03 Libcap-2.73.with.PAM
#               a.08.91.08 libxml2-2.14.3       (errata)
#

#
# Required Runtime by:
#
#               e44.34.12 gnome-nettool-42.0
#

export PKG="bind-9.20.6"
export PKGLOG_DIR=$LFSLOG/16.02
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Builds ..."
echo "3. Make Builds ..." >> $LFSLOG_PROCESS
echo "3. Make Builds ..." >> $PKGLOG_ERROR
make -C lib/isc         >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR
make -C lib/dns         >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR
make -C lib/ns          >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR
make -C lib/isccfg      >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR
make -C lib/isccc       >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR
make -C bin/dig         >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR
make -C bin/nsupdate    >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR
make -C bin/rndc        >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR
#make -C doc             >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Installs ..."
echo "4. Make Installs ..." >> $LFSLOG_PROCESS
echo "4. Make Installs ..." >> $PKGLOG_ERROR
make install >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
make -C lib/isc      install    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
make -C lib/dns      install    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
make -C lib/ns       install    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
make -C lib/isccfg   install    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
make -C lib/isccc    install    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
make -C bin/dig      install    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
make -C bin/nsupdate install    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
make -C bin/rndc     install    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

#cp -v doc/man/{dig.1,host.1,nslookup.1,nsupdate.1}  \
#    /usr/share/man/man1                             \
#    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
#cp -v doc/man/rndc.8                                \
#    /usr/share/man/man8                             \
#    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
