# g12.39.03.LibreOffice-24.8.0.Part2.sh
#
# Part1 - as root, "install"
#

#
# Dependencies Required:
#
#               g11.13.18.01 Archive::Zip-1.68
#               b10.12.36 UnZip-6.0
#               a.08.91Z  WGet-1.24.5
#               a.08.92E  Which-2.21
#               b10.12.41 Zip-3.0
#
# Dependencies Recommended:
#
#               ???. apache-ant             java
#               b10.09.07 boost-1.86.0
#               g11.09.09 CLucene-2.3.3.4
#               ??? Cups                    no printing
#               b10.17.02 cURL-8.10.1
#               d20.25.35 libepoxy-1.5.10
#               e10.10.18 libjpeg-turbo-3.0.1
#               d10.13.12.LLVM-18.1.7
#               g11.10.10 GLM-1.0.1
#               g11.25.13 GLU-9.0.3
#               g11.04.08 GPGME-1.23.2
#               ??? Graphite
#               g11.42.15 gst-plugins-base-1.24.7
#               e11.25.17 GTK+-3.24.43
#               d10.10.12 harfBuzz-9.0.0
#               b10.09.24 icu-75.1
#               g11.09.35 libatomic_ops-7.8.2
#               e10.10.14 Little CMS-2.16
#               g11.10.24 librsvg-2.58.3
#               e10.10.26 libtiff-4.7.0
#               e10.10.27 libwebp-1.4.0
#               b10.09.72 libxml2-2.13.3
#               b10.09.74 libxslt-1.1.42
#               d10.13.23.12 lxml-5.3.0
#               d20.24.16 Mesa-24.1.5
#               g11.04.17 NSS-3.103
#               ??? OpenLDAP
#               g11.10.33 Poppler-24.08.0
#               c12.22.04 PostgreSQL-16.4           ( not used )
#               g11.12.30 Redland-1.0.17
#               b10.11.21 unixODBC-2.3.12
#
# Dependencies Optional:
#
#               d10.11.04 desktop-file-utils-0.27
#               c11.22.03 MariaDB-10.11.8           ( not used )
#               e10.13.16 NASM-2.16.03
#

export PKG="libreoffice-24.8.0.3"
export PKGLOG_DIR=$LFSLOG/39.03
#export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
#export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log

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


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_INSTALL
#PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR
#PKGLOG_TAR
unset PKGLOG_DIR PKG
