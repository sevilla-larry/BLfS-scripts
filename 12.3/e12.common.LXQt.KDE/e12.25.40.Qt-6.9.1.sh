# e12.25.40.Qt-6.9.1.sh
# errata/svn
#

#
# Dependencies Required:
#
#               d20.24.08 Xorg Libraries
#
# Dependencies Recommended:
#
#               e10.42.01   alsa-lib-1.2.13
#               a.08.91.40  make-ca-1.16         (errata)
#           ??? e10.46.01   Cups-2.4.11
#               d20.12.11   dbus-1.16.0
#               e12.09.11   Double-conversion-3.3.1
#               d10.09.17   GLib-2.82.5
#           ??? e12.42.14   gst-plugins-base-1.26.3
#               d10.10.12   harfBuzz-10.4.0
#               a.08.91.07  icu-76.1
#               e12.10.13   jasper-4.2.4
#               e10.10.18   libjpeg-turbo-3.0.1
#               d20.24.21.3 libinput-1.27.1
#               e12.10.20   libmng-2.0.3
#               d10.10.22   libpng-1.6.46
#               e10.10.26   libtiff-4.7.0
#               e10.10.27   libwebp-1.5.0
#               e10.09.71   libxkbcommon-1.8.0
#               d20.24.12   Mesa-24.3.4
#               d10.09.79   mtdev-1.1.7
#               a.08.91.11  PCRE2-10.45
#               a.08.91.18  SQLite-3.49.1
#               d10.09.97   Wayland-1.23.0
#               d20.24.11   XCB.Utilities
#

#
# Required by:
#
#               e12.29.05 Polkit-Qt-0.200.0
#               e31.28.02 breeze-icons-6.11.0
#               e32.37.xx KF6 Plasma misc
#               e33.37.xx LXQt Desktop Components
#               e34.38.xx LXQt Applications
#
# Recommended by:
#
#               e12.29.02 extra-cmake-modules-6.11.0
#

export PKG="qt-everywhere-src-6.9.1"
export PKGLOG_DIR=$LFSLOG/25.40
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
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
 

export QT6PREFIX=/opt/qt6

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure -prefix $QT6PREFIX      \
            -sysconfdir /etc/xdg    \
            -dbus-linked            \
            -openssl-linked         \
            -system-sqlite          \
            -nomake examples        \
            -no-rpath               \
            -no-sbom                \
            -syslog                 \
            -skip qt3d              \
            -skip qtquick3dphysics  \
            -skip qtwebengine       \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

find $QT6PREFIX/ -name \*.prl \
   -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \
   > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

pushd qttools/src >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

install -v -Dm644 assistant/assistant/images/assistant-128.png          \
                  /usr/share/pixmaps/assistant-qt6.png                  \
                  >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

install -v -Dm644 designer/src/designer/images/designer.png             \
                  /usr/share/pixmaps/designer-qt6.png                   \
                  >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

install -v -Dm644 linguist/linguist/images/icons/linguist-128-32.png    \
                  /usr/share/pixmaps/linguist-qt6.png                   \
                  >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

install -v -Dm644 qdbus/qdbusviewer/images/qdbusviewer-128.png          \
                  /usr/share/pixmaps/qdbusviewer-qt6.png                \
                  >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

popd >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cat > /usr/share/applications/assistant-qt6.desktop << EOF      2>> $PKGLOG_ERROR
[Desktop Entry]
Name=Qt6 Assistant
Comment=Shows Qt6 documentation and examples
Exec=$QT6PREFIX/bin/assistant
Icon=assistant-qt6.png
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;Documentation;
EOF

cat > /usr/share/applications/designer-qt6.desktop << EOF       2>> $PKGLOG_ERROR
[Desktop Entry]
Name=Qt6 Designer
GenericName=Interface Designer
Comment=Design GUIs for Qt6 applications
Exec=$QT6PREFIX/bin/designer
Icon=designer-qt6.png
MimeType=application/x-designer;
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;
EOF

cat > /usr/share/applications/linguist-qt6.desktop << EOF       2>> $PKGLOG_ERROR
[Desktop Entry]
Name=Qt6 Linguist
Comment=Add translations to Qt6 applications
Exec=$QT6PREFIX/bin/linguist
Icon=linguist-qt6.png
MimeType=text/vnd.trolltech.linguist;application/x-linguist;
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;
EOF

cat > /usr/share/applications/qdbusviewer-qt6.desktop << EOF    2>> $PKGLOG_ERROR
[Desktop Entry]
Name=Qt6 QDbusViewer
GenericName=D-Bus Debugger
Comment=Debug D-Bus applications
Exec=$QT6PREFIX/bin/qdbusviewer
Icon=qdbusviewer-qt6.png
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;Debugger;
EOF

cat > /etc/sudoers.d/qt << "EOF"    2>> $PKGLOG_ERROR
Defaults env_keep += QT6DIR
EOF

cat >> /etc/ld.so.conf << EOF       2>> $PKGLOG_ERROR
# Begin Qt addition

/opt/qt6/lib

# End Qt addition
EOF

ldconfig    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cat > /etc/profile.d/qt6.sh << "EOF"    2>> $PKGLOG_ERROR
# Begin /etc/profile.d/qt6.sh

QT6DIR=/opt/qt6

pathappend $QT6DIR/bin           PATH
pathappend $QT6DIR/lib/pkgconfig PKG_CONFIG_PATH

export QT6DIR

# End /etc/profile.d/qt6.sh
EOF


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
