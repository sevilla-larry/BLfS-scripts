# e42.33.22.tinysparql-3.8.2.sh
#

#
# Dependencies Required:
#
#               e13.09.29 JSON-GLib-1.10.6
#               e10.13.35 Vala-0.56.17
#
# Dependencies Recommended:
#
#               d10.09.17    GLib-2.82.5
#               a.08.91.07   icu-76.1
#               e41.17.18    libsoup-3.6.5 (errata)
#               e41.13.24.23 PyGObject-3.50.0
#               a.08.91.18   SQLite-3.49.1
#
# Dependencies Recommended (runtime)
#
#               e42.33.23 localsearch-3.8.2
#

#
# Required by:
#
#               e42.33.23 localsearch-3.8.2
#
# Optionally by:
#
#               e41.25.17 GTK-4.16.12
#

export PKG="tinysparql-3.8.2"
export PKGLOG_DIR=$LFSLOG/33.22
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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


mv -v docs/reference/libtracker-sparql/doc/{Tsparql-3.0,tinysparql-3.8.2}   \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed '/docs_name/s/Tsparql-3.0/tinysparql-3.8.2/'    \
    -i docs/reference/libtracker-sparql/meson.build \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup --prefix=/usr                   \
            --buildtype=release             \
            -D man=false                    \
            -D systemd_user_services=false  \
            ..                              \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR 
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "5. Meson Configure Test ..."
echo "5. Meson Configure Test ..." >> $LFSLOG_PROCESS
echo "5. Meson Configure Test ..." >> $PKGLOG_ERROR
 meson configure -D debug=true  \
             > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "6. Ninja Test ..."
echo "6. Ninja Test ..." >> $LFSLOG_PROCESS
echo "6. Ninja Test ..." >> $PKGLOG_ERROR
LC_ALL=C ninja test             \
            >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
