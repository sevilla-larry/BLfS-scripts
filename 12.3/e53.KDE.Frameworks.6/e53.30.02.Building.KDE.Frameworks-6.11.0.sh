# e53.30.02.Building.KDE.Frameworks-6.11.0.sh
#

#
# Dependencies Required:
#
#               e12.29.02 extra-cmake-modules-6.11.0
#               e12.28.02 breeze-icons-6.11.0
#               a.08.91.36 docbook-xml-4.5
#               a.08.91.37 docbook-xsl-nons-1.79.2
#               e14.42.26 libcanberra-0.30  e11
#               a.08.91.35 libgcrypt-1.11.0
#               a.08.91.38 libxslt-1.1.43
#               e16.09.47 libical-3.0.19    e41
#       lmdb
#       qca
#       qrencode
#               e12.29.06 plasma-wayland-protocols-1.16.0
#               b10.13.24.28 PyYAML-6.0.2
#               d10.11.16 shared-mime-info-2.4
#       URI
#               a.08.93.02 WGet-1.25.0
#
# Dependencies Recommended:
#
#               e14.09.06 Aspell-0.60.8.1   e11
#               e16.16.01 Avahi-0.8         e41
#               e12.29.05 Polkit-Qt-0.200.0
#               d20.25.44 Vulkan-Loader-1.4.304 (PCs)
#               e10.10.15 libavif-1.2.0 
#               e10.10.19 libjxl-0.11.1
#       libraw
#               e15.12.35 UDisks-2.10.1     e13
#               e10.12.37 UPower-1.90.7
#               e14.04.08 GPGME-1.24.2      e11
#

#
# based on: https://www.linuxfromscratch.org/blfs/view/12.3/kde/frameworks6.html
#

export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

cd frameworks.6


#bash -e

I=0

while read -r line
do
  ((I++))

  strI=$(echo $I | awk '{printf("%02d",$1)}')

  # Get the file name, ignoring comments and blank lines
  if $(echo $line | grep -E -q '^ *$|^#' ); then continue; fi
  package=$(echo $line | cut -d" " -f2)

  export PKGLOG_DIR=$LFSLOG/30.02/$strI
  export PKGLOG_TAR=$PKGLOG_DIR/tar.log
  export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
  export PKGLOG_BUILD=$PKGLOG_DIR/build.log
  export PKGLOG_CHECK=$PKGLOG_DIR/check.log
  export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
  export PKGLOG_ERROR=$PKGLOG_DIR/error.log

  rm    -r $PKGLOG_DIR 2> /dev/null
  mkdir -p $PKGLOG_DIR

  #packagedir=${package%.tar.?z*}
  pkg=$(echo $file|sed 's|^.*/||')          # Remove directory
  packagedir=$(echo $pkg|sed 's|\.tar.*||') # Package directory

  name=$(echo $pkg|sed 's|-6.*$||') # Isolate package name

  echo "1. Extract tar... $strI $package"
  echo "1. Extract tar... $strI $package" >> $LFSLOG_PROCESS
  echo "1. Extract tar... $strI $package" >> $PKGLOG_ERROR
  tar -vxf $package > $PKGLOG_TAR 2>> $PKGLOG_ERROR

  pushd $packagedir

    #
    #   Exclude kapidox
    #
    #   # kapidox is a python module
    # case $name in
    #   kapidox)
    #     pip3 wheel -w dist --no-build-isolation --no-deps --no-cache-dir $PWD
    #     as_root pip3 install --no-index --find-links dist --no-user kapidox
    #     popd
    #     rm -rf $packagedir
    #     continue
    #     ;;
    # esac
    #

    mkdir build
    cd    build

    echo "2. Configure ... $strI $package"
    echo "2. Configure ... $strI $package" >> $LFSLOG_PROCESS
    echo "2. Configure ... $strI $package" >> $PKGLOG_ERROR
      cmake -D CMAKE_INSTALL_PREFIX=$KF6_PREFIX \
            -D CMAKE_INSTALL_LIBEXECDIR=libexec \
            -D CMAKE_PREFIX_PATH=$QT6DIR        \
            -D CMAKE_SKIP_INSTALL_RPATH=ON      \
            -D CMAKE_BUILD_TYPE=Release         \
            -D BUILD_TESTING=OFF                \
            -W no-dev ..                        \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

    echo "3. Make Build ... $strI $package"
    echo "3. Make Build ... $strI $package" >> $LFSLOG_PROCESS
    echo "3. Make Build ... $strI $package" >> $PKGLOG_ERROR
    make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

    echo "4. Make Install ... $strI $package"
    echo "4. Make Install ... $strI $package" >> $LFSLOG_PROCESS
    echo "4. Make Install ... $strI $package" >> $PKGLOG_ERROR
    make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
    #as_root make install

  popd

  rm -rf $packagedir

done < ../frameworks-6.11.0.md5

#exit


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset I strI
unset package packagedir
unset LFSLOG_PROCESS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR
