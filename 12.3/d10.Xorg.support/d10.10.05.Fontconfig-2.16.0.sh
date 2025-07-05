# d10.10.05.Fontconfig-2.16.0.sh
#  

#
# Dependencies Required:
#
#               d10.10.04 FreeType-2.13.3
#
# Dependencies Optional (for Testing):
#
#               a.08.93.04 cURL-8.12.1
#               a.08.91.12 libarchive-3.7.7
#               a.08.91.40 make-ca-1.16
#
# Dependencies Optional:
#
#               a.08.91.08 libxml2-2.13.6
#

#
# Required by:
#
#               d20.24.08 Xorg.Libraries
#               e21.25.37 Pango-1.56.1
#               e11.10.33 Poppler-25.02.0
#
# Recommended by:
#
#				e10.25.04 Cairo-1.18.2
#               e11.42.25 libass-0.17.3
#
# Optionally by:
#
#               e11.44.01 FFmpeg-7.1
#

export PKG="fontconfig-2.16.0"
export PKGLOG_DIR=$LFSLOG/10.05
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
./configure --prefix=/usr        \
            --sysconfdir=/etc    \
            --localstatedir=/var \
            --disable-docs       \
            --docdir=/usr/share/doc/fontconfig-2.16.0 \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

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

install -v -dm755 \
        /usr/share/{man/man{1,3,5},doc/fontconfig-2.16.0/fontconfig-devel}  \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -m644 fc-*/*.1         /usr/share/man/man1   \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -m644 doc/*.3          /usr/share/man/man3   \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -m644 doc/fonts-conf.5 /usr/share/man/man5   \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
#install -v -m644 doc/fontconfig-devel/* \
#                                  /usr/share/doc/fontconfig-2.16.0/fontconfig-devel \
#        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -m644 doc/*.{pdf,sgml,txt,html} \
                                  /usr/share/doc/fontconfig-2.16.0  \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
