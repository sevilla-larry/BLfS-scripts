# g12.39.03.LibreOffice-25.2.1.Part2.sh
#
# Part2 - as root, "install"
#

#
# Dependencies Required:
#
#               g11.13.19.01 Archive::Zip-1.68
#               a.08.91.12   libarchive-3.7.7
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
#               a.08.93.04   cURL-8.12.1
#               d20.25.34    libepoxy-1.5.10
#               e10.10.18    libjpeg-turbo-3.0.1
#               d10.13.13    LLVM-19.1.7
#               g11.10.10    GLM-1.0.1
#               e11.25.13    GLU-9.0.3
#               e11.04.08    GPGME-1.24.2
#               d10.10.11    Graphite2-1.3.14
#           ??? g11.42.14    gst-plugins-base-1.24.12   ???
#               e11.25.16    GTK-3.24.48
#               d10.10.12    harfBuzz-10.4.0
#               a.08.91.07   icu-76.1
#               g11.09.35    libatomic_ops-7.8.2
#               e10.10.14    LittleCMS-2.17
#               e10.10.24    librsvg-2.59.2
#               e10.10.26    libtiff-4.7.0
#               g11.10.27    libwebp-1.5.0
#               a.08.91.08   libxml2-2.13.6
#               a.08.91.38   libxslt-1.1.43
#               d10.13.24.12 lxml-5.3.1
#               d20.24.12    Mesa-24.3.4
#               a.08.91.32   NSS-3.108
#               ???          OpenLDAP                   ???
#               e11.10.33    Poppler-25.02.0 (GTK)
#               c12.22.04    PostgreSQL-17.4        (not used)
#               g11.12.30    Redland-1.0.17
#               b10.11.21    unixODBC-2.3.12
#
# Dependencies Optional:
#
#               d10.11.04  desktop-file-utils-0.28
#               c11.22.03  MariaDB-11.4.5           (not used)
#               e10.13.17  NASM-2.16.03
#               a.08.91.40 make-ca-1.16
#               ???        Qt-6.x                       ???
#

export PKG="libreoffice-25.2.1.2"
export PKGLOG_DIR=$LFSLOG/39.03
#export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
#export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

# rm -r $PKGLOG_DIR 2> /dev/null - don't delete
# mkdir $PKGLOG_DIR

#echo "1. Extract tar..."
#echo "1. Extract tar..." >> $LFSLOG_PROCESS
#echo "1. Extract tar..." >> $PKGLOG_ERROR
#tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make distro-pack-install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

if [ "$LO_PREFIX" != "/usr" ]; then

  # This symlink is necessary for the desktop menu entries
  ln -svf $LO_PREFIX/lib/libreoffice/program/soffice    \
            /usr/bin/libreoffice                        \
            >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
  # Set up a generic location independent of version number
  ln -sfv $LO_PREFIX /opt/libreoffice                   \
            >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

  # Icons
  mkdir -vp /usr/share/pixmaps                          \
            >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
  for i in $LO_PREFIX/share/icons/hicolor/32x32/apps/*; do
    ln -svf $i /usr/share/pixmaps                       \
            >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
  done

  # Desktop menu entries
  for i in $LO_PREFIX/lib/libreoffice/share/xdg/*; do
    ln -svf $i /usr/share/applications/libreoffice-$(basename $i)   \
            >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
  done

  # Man pages
  for i in $LO_PREFIX/share/man/man1/*; do
    ln -svf $i /usr/share/man/man1/         \
            >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
  done

  unset i
fi

update-desktop-database \
            >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_INSTALL
#PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR
#PKGLOG_TAR
unset PKGLOG_DIR PKG
