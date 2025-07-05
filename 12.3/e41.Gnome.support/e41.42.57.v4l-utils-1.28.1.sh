# e41.42.57.v4l-utils-1.28.1.sh
#

#
# Dependencies Recommended:
#
#               e10.42.01 alsa-lib-1.2.13
#               e11.25.13 GLU-9.0.3
#               e10.10.18 libjpeg-turbo-3.0.1
#
# Dependencies Optional:
#
#               e11.42.52 SDL2-2.30.11
#

#
# Recommended by:
#
#               e41.10.03 Exiv2-0.28.5
#               e41.42.48 Pipewire-1.2.7
#

export PKG="v4l-utils-1.28.1"
export PKGLOG_DIR=$LFSLOG/42.57
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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


mkdir build 
cd    build 

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr               \
            --buildtype=release         \
            -D gconv=disabled           \
            -D doxygen-doc=disabled     \
            ..                          \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

#  install the contrib programs

# for prog in v4l2gl v4l2grab
# do
#    cp -v contrib/test/$prog /usr/bin  \
#       >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
# done


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
