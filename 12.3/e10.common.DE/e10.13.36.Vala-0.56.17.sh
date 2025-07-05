# e10.13.36.Vala-0.56.17.sh
#

#
# Dependencies Required:
#
#               d10.09.17 GLib-2.82.5
#
# Dependencies Optional:
#
#               d20.12.11  dbus-1.16.0
#               a.08.91.38 libxslt-1.1.43 (errata)
#

#
# Required by:
#
#               e41.11.10 ibus-1.5.31
#
# Recommended by:
#
#               e23.35.01 libxfce4util-4.20.0
#               e11.12.02 AccountsService-23.13.9
#               e10.10.24 librsvg-2.59.2
#               e21.33.07 VTE-0.78.4
#               e42.33.07 VTE-0.78.4
#               f2.26.02  lightdm-1.32.0
#               e11.25.32 libhandy-1.8.3
#               e41.09.46 libgusb-0.4.9
#               e41.09.47 libical-3.0.19
#               e41.12.08 Colord-1.4.7
#               e41.17.03 GeoClue-2.7.2
#               e41.17.18 libsoup-3.6.5 (errata)
#               e42.33.01 Gcr-3.41.2
#               e41.25.07 colord-gtk-0.3.1
#               e41.25.20 gtk-vnc-1.5.0
#               e41.25.28 libadwaita-1.6.4
#               ???.37.04 libfm-1.3.2           ???
#
# Optionally ( but needed ) by:
#
#               e23.35.02 Xfconf-4.20.0
#               g21.25.23 gtksourceview4-4.8.4  ???
#               e41.25.23 gtksourceview5-5.14.2
#
# Optionally by:
#
#               e11.25.36 libxklavier-5.4
#               e41.09.55 libportal-0.9.1
#

export PKG="vala-0.56.17"
export PKGLOG_DIR=$LFSLOG/13.36
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
./configure --prefix=/usr       \
            --disable-valadoc   \
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


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
