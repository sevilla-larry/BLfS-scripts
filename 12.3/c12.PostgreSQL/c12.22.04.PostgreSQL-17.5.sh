# c12.22.04.PostgreSQL-17.5.sh
# (errata)
#

#
# Dependencies Optional:
#
#               a.08.91.07.icu-76.1
#               a.08.91.08 libxml2-2.14.3   (errata)
#               a.08.91.38 libxslt-1.1.43   (errata)
#               a.08.92.01 Linux-PAM-1.7.1  (errata)
#

#
# Recommended by:
#
#               g22.39.03 LibreOffice-25.2.3	(errata) (not used)
#
# Optional by:
#
#               c13.09.05 Apr-Util-1.6.3    (Apache)
#               c14.20.04 ProFTPD-1.3.8b
#

export PKG="postgresql-17.5"
export PKGLOG_DIR=$LFSLOG/22.04
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.bz2 > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


groupadd -g 41 postgres         \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
useradd -c "PostgreSQL Server"  \
        -g postgres             \
        -d /srv/pgsql/data      \
        -u 41 postgres          \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -i '/DEFAULT_PGSOCKET_DIR/s@/tmp@/run/postgresql@'  \
        src/include/pg_config_manual.h                  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr          \
            --docdir=/usr/share/doc/postgresql-17.5 \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# check: make -C contrib

# Note tests must be run as an unprivileged user... but try root
echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install         > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
make install-docs   >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# ... make -C contrib install

install -v -dm700 /srv/pgsql/data                       \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -dm755 /run/postgresql                       \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
chown -Rv postgres:postgres /srv/pgsql /run/postgresql  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

su - postgres -c '/usr/bin/initdb -D /srv/pgsql/data'   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
