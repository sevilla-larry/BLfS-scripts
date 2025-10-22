# b30.23.02.Unbound-1.23.1.sh
#

#
# Dependencies Optional:
#
#               a.08.91.14 libevent-2.1.12
#               a.08.91.10 Nettle-3.10.2
#

#
# Optionally by:
#
#               i2.4.2 openvswitch-3.3.6
#

export PKG="unbound-1.23.1"
export PKGLOG_DIR=$LFSLOG/23.02
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "   Create the user and group..."
echo "   Create the user and group..." >> $LFSLOG_PROCESS
echo "   Create the user and group..." >> $PKGLOG_ERROR
groupadd -g 88 unbound  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
useradd -c "Unbound DNS Resolver" -d /var/lib/unbound -u 88 \
        -g unbound -s /bin/false unbound                    \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr       \
            --sysconfdir=/etc   \
            --disable-static    \
            --with-libevent     \
            --with-pidfile=/run/unbound.pid \
            --with-pyunbound                \
            PYTHON_VERSION=3.${PYVER}       \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
# --with-run-dir=/run/unbound suggestion by Grok but seems problematic

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

mv -v /usr/sbin/unbound-host /usr/bin/  \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mkdir -vp /var/lib/unbound /etc/unbound \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

unbound-anchor  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -vR unbound:unbound       \
        /{etc,var/lib}/unbound  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


echo "."
echo "."                                                >> $LFSLOG_PROCESS
echo "."                                                >> $PKGLOG_ERROR
echo "Unbound installed but NOT configured"
echo "Unbound installed but NOT configured"             >> $LFSLOG_PROCESS
echo "Unbound installed but NOT configured"             >> $PKGLOG_ERROR
echo "."
echo "."                                                >> $LFSLOG_PROCESS
echo "."                                                >> $PKGLOG_ERROR
echo "Configure Unbound after installing this package"
echo "Configure Unbound after installing this package"  >> $LFSLOG_PROCESS
echo "Configure Unbound after installing this package"  >> $PKGLOG_ERROR
echo "."
echo "."                                                >> $LFSLOG_PROCESS
echo "."                                                >> $PKGLOG_ERROR

# Edit /etc/unbound/unbound.conf if needed
# (e.g., set auto-trust-anchor-file: "/etc/unbound/root.key"
# explicitly under the server: section to override

# For DNS resolution,
# update /etc/resolv.conf
# to nameserver 127.0.0.1
# if using Unbound locally.


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
