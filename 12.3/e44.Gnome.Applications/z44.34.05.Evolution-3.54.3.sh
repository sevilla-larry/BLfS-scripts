# e44.34.05.Evolution-3.54.3.sh
#

#
# Dependencies Required:
#
#               xxx.xx.xx adwaita-icon-theme-47.0
#               xxx.xx.xx evolution-data-server-3.54.3
#               xxx.xx.xx Gcr-4.3.1
#               xxx.xx.xx gnome-autoar-0.4.5
#               xxx.xx.xx shared-mine-info-2.4
#               xxx.xx.xx WebKitGTK-2.446.6
#                        
#
# Dependencies Recommended:
#
#              xxx.xx.xx Bogofilter-1.2.5
#              xxx.xx.xx enchant-2.8.2
#              xxx.xx.xx gnome-desktop-44.1
#              xxx.xx.xx gspell-1.14.0
#              xxx.xx.xx Highlight-4.15
#              xxx.xx.xx itstool-2.0.7
#              xxx.xx.xx libcanberra-0.30
#              e42.33.18 libgweather-4.4.4
#              xxx.xx.xx libnotify-0.8.4
#              xxx.xx.xx OpenLDAP-2.6.9
#              xxx.xx.xx Seahorse-47.0.1

#
# Required by:
#
#

export PKG="Evolution-3.54.3"
export PKGLOG_DIR=$LFSLOG/34.05
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
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

echo "2. CMake Setup ..."
echo "2. CMake Setup ..." >> $LFSLOG_PROCESS
echo "2. CMake Setup ..." >> $PKGLOG_ERROR
cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D SYSCONF_INSTALL_DIR=/etc  \
      -D ENABLE_INSTALLED_TESTS=ON \
      -D ENABLE_PST_IMPORT=OFF     \
      -D ENABLE_YTNEF=OFF          \
      -D ENABLE_CONTACT_MAPS=OFF   \
      -D ENABLE_MARKDOWN=OFF       \
      -D ENABLE_WEATHER=ON         \
      -G Ninja                     \
      ..                           \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
