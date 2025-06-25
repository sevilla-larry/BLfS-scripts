# g22.39.03.LibreOffice-25.2.3.Part1.sh
#
# Part1 - as user, up to "build"
#

#
# Dependencies Required:
#
#               g11.13.19.01 Archive::Zip-1.68
#               a.08.91.12   libarchive-3.8.1   (errata)
#               a.08.93.02   WGet-1.25.0
#               a.08.91.03   Which-2.23
#               a.08.91.04   Zip-3.0
#
# Dependencies Recommended:
#
#               ???          apache-ant (java)          ???
#               a.08.91.23   boost-1.87.0
#               g11.09.09    CLucene-2.3.3.4
#               ???          Cups                       ???
#               a.08.93.04   cURL-8.14.1        (errata)
#               d20.25.34    libepoxy-1.5.10
#               e10.10.18    libjpeg-turbo-3.0.1
#               d10.13.13    LLVM-19.1.7
#               g11.10.10    GLM-1.0.1
#               e11.25.13    GLU-9.0.3
#               e11.04.08    GPGME-1.24.2
#               d10.10.11    Graphite2-1.3.14
#           ??? e41.42.14    gst-plugins-base-1.26.2    ???
#               e11.25.16    GTK-3.24.48
#               d10.10.12    harfBuzz-10.4.0
#               a.08.91.07   icu-76.1
#               g11.09.35    libatomic_ops-7.8.2
#               e10.10.14    LittleCMS-2.17
#               e10.10.24    librsvg-2.59.2
#               e10.10.26    libtiff-4.7.0
#               e11.10.27    libwebp-1.5.0
#               a.08.91.08   libxml2-2.14.3     (errata)
#               a.08.91.38   libxslt-1.1.43     (errata)
#               d10.13.24.12 lxml-5.4.0         (errata)
#               d20.24.12    Mesa-24.3.4
#               a.08.91.32   NSS-3.108
#               ???          OpenLDAP                   ???
#               e11.10.33    Poppler-25.02.0 (GTK)
#               c12.22.04  PostgreSQL-17.5      (errata) (not used)
#               g11.12.30    Redland-1.0.17
#               b10.11.21    unixODBC-2.3.12
#
# Dependencies Optional:
#
#         Gnome e43.33.31  DConf-0.40.0
#               d10.11.04  desktop-file-utils-0.28
#         Gnome e42.33.21  evolution-data-server-3.54.3
#               a.08.91.63 GnuTLS-3.8.9
#         Gnome e41.25.17  GTK-4.16.12
#               c11.22.03 MariaDB-11.4.7        (errata) (not used)
#               e10.13.17  NASM-2.16.03
#               a.08.91.40 make-ca-1.16
#               ???        Qt-6.x                       ???
#

export PKG="libreoffice-25.2.3.2"
export PKGLOG_DIR=$LFSLOG/39.03
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
#export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


patch -Np1 -i ../libreoffice-25.2.3.2-icu76_fixes-1.patch   \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
patch -Np1 -i ../libreoffice-25.2.3.2-poppler_fixes-1.patch \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -i '/icuuc \\/a zlib\\'						    \
			writerperfect/Library_wpftdraw.mk	    \
			>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed -i "/distro-install-file-lists/d" Makefile.in   \
			>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed -e "/gzip -f/d"                                 \
    -e "s|.1.gz|.1|g"                               \
    -i bin/distro-install-desktop-integration       \
			>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

install -v -dm755 external/tarballs	                        \
			>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
ln -sv ../../../libreoffice-dictionaries-25.2.3.2.tar.xz    \
                external/tarballs/                          \
			>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
ln -sv ../../../libreoffice-help-25.2.3.2.tar.xz            \
                external/tarballs/                          \
			>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
ln -sv ../../../libreoffice-translations-25.2.3.2.tar.xz    \
                external/tarballs/                          \
			>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

ln -sv src/libreoffice-help-25.2.3.2/helpcontent2/			\
			>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
ln -sv src/libreoffice-dictionaries-25.2.3.2/dictionaries/	\
			>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
ln -sv src/libreoffice-translations-25.2.3.2/translations/	\
			>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Autogen Configure ..."
echo "2. Autogen Configure ..." >> $LFSLOG_PROCESS
echo "2. Autogen Configure ..." >> $PKGLOG_ERROR
./autogen.sh --prefix=$LO_PREFIX            \
             --sysconfdir=/etc              \
             --with-vendor=BLFS             \
             --with-lang='en en-US'         \
             --with-help=html               \
             --with-myspell-dicts           \
             --without-java                 \
             --without-junit                \
             --without-system-dicts         \
             --disable-cups                 \
             --disable-dconf                \
             --disable-odk                  \
             --disable-skia                 \
             --disable-mariadb-sdbc         \
             --disable-postgresql-sdbc      \
             --disable-firebird-sdbc        \
             --disable-gstreamer-1-0        \
             --enable-release-build=yes     \
             --enable-python=system         \
             --enable-lto                   \
             --with-system-boost            \
             --with-system-clucene          \
             --with-system-curl             \
             --with-system-epoxy            \
             --with-system-expat            \
             --with-system-glm              \
             --with-system-gpgmepp          \
             --with-system-graphite         \
             --with-system-harfbuzz         \
             --with-system-jpeg             \
             --with-system-lcms2            \
             --with-system-libatomic_ops    \
             --with-system-libpng           \
             --with-system-libxml           \
             --with-system-nss              \
             --with-system-odbc             \
             --with-system-openssl          \
             --with-system-poppler          \
             --with-system-redland          \
             --with-system-libtiff          \
             --with-system-libwebp          \
             --with-system-icu              \
             --with-system-zlib             \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#             --with-jdk-home=/opt/jdk    \ Java        NOT installed
#             --with-system-openldap      \ OpenLDAP    NOT installed
#             --with-system-postgresql    \ PostgreSQL  NOT installed

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make build > $PKGLOG_BUILD 2>> $PKGLOG_ERROR


cd $SOURCES
# rm -rf $PKG   Don't delete directory now
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
#unset PKGLOG_INSTALL 
unset PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
