# c13.20.01.Apache-2.4.65.sh
#

#
# Dependencies Required:
#
#               c13.09.05  Apr-Util-1.6.3
#               a.08.91.11 PCRE2-10.45
#
# Dependencies Optional:
#
#               a.08.91.22 brotli-1.1.0
#               a.08.91.66 Jansson-2.14.1
#               a.08.91.08 libxml2-2.14.5
#               b10.13.14  Lua-5.4.8
#               a.08.93.03 Lynx-2.9.2
#               a.08.91.67 nghttp2-1.66.0
#

export PKG="httpd-2.4.65"
export PKGLOG_DIR=$LFSLOG/20.01
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.bz2 > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


groupadd -g 25 apache
useradd -c "Apache Server" -d /srv/www -g apache    \
        -s /bin/false -u 25 apache

patch -Np1 -i ../httpd-blfs_layout-1.patch          \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed '/dir.*CFG_PREFIX/s@^@#@' -i support/apxs.in    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -e '/HTTPD_ROOT/s:${ap_prefix}:/etc/httpd:'         \
    -e '/SERVER_CONFIG_FILE/s:${rel_sysconfdir}/::'     \
    -e '/AP_TYPES_CONFIG_FILE/s:${rel_sysconfdir}/::'   \
    -i configure                                        \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# sed -e '/encoding.h/a # include <libxml/xmlstring.h>'   \ BLfS 12.3
#     -i modules/filters/mod_xml2enc.c                    \ Apache-2.4.63?64
#     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --enable-authnz-fcgi                                \
            --enable-layout=BLFS                                \
            --enable-mods-shared="all cgi"                      \
            --enable-mpms-shared=all                            \
            --enable-suexec=shared                              \
            --with-apr=/usr/bin/apr-1-config                    \
            --with-apr-util=/usr/bin/apu-1-config               \
            --with-suexec-bin=/usr/lib/httpd/suexec             \
            --with-suexec-caller=apache                         \
            --with-suexec-docroot=/srv/www                      \
            --with-suexec-uidmin=100                            \
            --with-suexec-userdir=public_html                   \
            --with-suexec-logfile=/var/log/httpd/suexec.log     \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install         > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
#make install-docs   >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mv -v /usr/sbin/suexec /usr/lib/httpd/suexec    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
chgrp -v apache        /usr/lib/httpd/suexec    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
chmod -v 4754          /usr/lib/httpd/suexec    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -v -R apache:apache /srv/www              \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
