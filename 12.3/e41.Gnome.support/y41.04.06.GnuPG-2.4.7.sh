# e41.04.06.GnuPG-2.4.7.sh
#

#                        
# Dependencies Required:
#
#               e11.09.33  libassuan-3.0.2
#               a.08.91.35 libgcrypt-1.11.0
#               e41.09.50  libksba-1.6.7
#               e41.09.81  npth-1.8
#               e41.23.01  OpenLDAP-2.6.9
#
# Dependencies Recommended:
#
#               a.08.91.63 GnuTLS-3.8.9
#
# Dependencies Recommended (Runtime):
#
#               e41.11.14 pinentry-1.3.1
#
# Dependencies Optional:
#
#               a.08.93.04 cURL-8.14.1
#               e10.09.69  libusb-1.0.27
#               a.08.91.18 SQLite-3.49.1
#

#
# Recommended by:
#
#               e42.33.01 Gcr-3.41.2
#               e42.33.02 Gcr-4.3.1
#

export PKG="gnupg-2.4.7"
export PKGLOG_DIR=$LFSLOG/04.06
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.bz2 > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


mkdir build
cd    build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
../configure    --prefix=/usr           \
                --localstatedir=/var    \
                --sysconfdir=/etc       \
                --docdir=/usr/share/doc/gnupg-2.4.7 \
                > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. MakeInfo Docs ..."
echo "4. MakeInfo Docs ..." >> $LFSLOG_PROCESS
echo "4. MakeInfo Docs ..." >> $PKGLOG_ERROR
makeinfo    --html --no-split -I doc    \
            -o doc/gnupg_nochunks.html  \
            ../doc/gnupg.texi           \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
makeinfo    --plaintext -I doc          \
            -o doc/gnupg.txt            \
            ../doc/gnupg.texi           \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
make -C doc html                        \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "5. Make Check ..."
echo "5. Make Check ..." >> $LFSLOG_PROCESS
echo "5. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "6. Make Install ..."
echo "6. Make Install ..." >> $LFSLOG_PROCESS
echo "6. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -m755 -d /usr/share/doc/gnupg-2.4.7/html             \
                    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -m644    doc/gnupg_nochunks.html                     \
                    /usr/share/doc/gnupg-2.4.7/html/gnupg.html  \
                    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -m644    ../doc/*.texi doc/gnupg.txt                 \
                    /usr/share/doc/gnupg-2.4.7                  \
                    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -m644    doc/gnupg.html/*                            \
                    /usr/share/doc/gnupg-2.4.7/html             \
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
