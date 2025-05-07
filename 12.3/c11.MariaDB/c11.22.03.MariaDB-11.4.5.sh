# c11.22.03.MariaDB-11.4.5.sh
#

#
# Dependencies Required:
#
#               a.08.9x.?1 CMake-3.31.5
#               libfmt ( downloaded by MariaDB )
#
# Dependencies Recommended:
#
#               a.08.91.14 libevent-2.1.12
#
# Dependencies Optional:
#
#               a.08.91.23 boost-1.87.0
#               a.08.91.08 libxml2-2.13.6
#               a.08.92.01 Linux-PAM-1.7.0
#               a.08.91.09 LZO-2.10
#               a.08.91.11 PCRE2-10.45
#               b10.11.21  unixODBC-2.3.12
#
#                     ( deferred )
#               ???       Snappy-1.1.10 ( from GitHub )
#

#
# Optional by:
#
#               c13.09.05 Apr-Util-1.6.3    (Apache)
#               c14.20.04 ProFTPD-1.3.8b
#               g12.39.03 LibreOffice-24.8.0
#

export PKG="mariadb-11.4.5"
export PKGLOG_DIR=$LFSLOG/22.03
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "   Create the user and group..."
echo "   Create the user and group..." >> $LFSLOG_PROCESS
echo "   Create the user and group..." >> $PKGLOG_ERROR
groupadd -g 40 mariadb    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
useradd -c "MariaDB Server" -d /srv/mariadb -g mariadb -s /bin/false -u 40 mariadb  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. CMake Configure ..."
echo "2. CMake Configure ..." >> $LFSLOG_PROCESS
echo "2. CMake Configure ..." >> $PKGLOG_ERROR
cmake -D CMAKE_BUILD_TYPE=Release                       \
      -D CMAKE_INSTALL_PREFIX=/usr                      \
      -D GRN_LOG_PATH=/var/log/groonga.log              \
      -D INSTALL_DOCDIR=share/doc/mariadb-11.4.5        \
      -D INSTALL_DOCREADMEDIR=share/doc/mariadb-11.4.5  \
      -D INSTALL_MANDIR=share/man                       \
      -D INSTALL_MYSQLSHAREDIR=share/mariadb            \
      -D INSTALL_MYSQLTESTDIR=share/mariadb/test        \
      -D INSTALL_PAMDIR=lib/security                    \
      -D INSTALL_PAMDATADIR=/etc/security               \
      -D INSTALL_PLUGINDIR=lib/mariadb/plugin           \
      -D INSTALL_SBINDIR=sbin                           \
      -D INSTALL_SCRIPTDIR=bin                          \
      -D INSTALL_SQLBENCHDIR=share/mariadb/bench        \
      -D INSTALL_SUPPORTFILESDIR=share/mariadb          \
      -D MYSQL_DATADIR=/srv/mariadb                     \
      -D MYSQL_UNIX_ADDR=/run/mariadb/mariadb.sock      \
      -D WITH_EXTRA_CHARSETS=complex                    \
      -D WITH_EMBEDDED_SERVER=ON                        \
      -D SKIP_TESTS=ON                                  \
      -D TOKUDB_OK=0                                    \
      ..                                                \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Test ..."
echo "4. Make Test ..." >> $LFSLOG_PROCESS
echo "4. Make Test ..." >> $PKGLOG_ERROR
make test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "   Two tests, my_tzinfo & test-connect, is known to fail..."
echo "   Two tests, my_tzinfo & test-connect, is known to fail..." >> $LFSLOG_PROCESS
echo "   Two tests, my_tzinfo & test-connect, is known to fail..." >> $PKGLOG_ERROR

echo "5. Extensive Test ..."
echo "5. Extensive Test ..." >> $LFSLOG_PROCESS
echo "5. Extensive Test ..." >> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK
echo "5. Extensive Test ..." >> $PKGLOG_CHECK
pushd mysql-test    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
./mtr --parallel $(nproc) --mem --force   \
    >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
popd                >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "6. Make Install ..."
echo "6. Make Install ..." >> $LFSLOG_PROCESS
echo "6. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# mv -v /usr/share/pam_use_map.so /lib/security   \
#    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
# mv -v /usr/share/user_map.conf /etc/security    \
#    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# configure
echo "7. Configure MySQL ..."
echo "7. Configure MySQL ..." >> $LFSLOG_PROCESS
echo "7. Configure MySQL ..." >> $PKGLOG_ERROR

install -v -dm 755 /etc/mariadb   >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cat > /etc/mariadb/my.cnf << "EOF"    2>> $PKGLOG_ERROR
# Begin /etc/mariadb/my.cnf

# The following options will be passed to all MySQL clients
[client]
password        = MariaDB
port            = 3306
socket          = /run/mariadb/mariadb.sock

# The MySQL server
[mariadb]
port            = 3306
socket          = /run/mariadb/mariadb.sock
datadir         = /srv/mariadb
skip-external-locking
key_buffer_size = 16M
max_allowed_packet = 1M
sort_buffer_size = 512K
net_buffer_length = 16K
myisam_sort_buffer_size = 8M

# Don't listen on a TCP/IP port at all.
#skip-networking

# required unique id between 1 and 2^32 - 1
server-id       = 1

# Uncomment the following if you are using BDB tables
#bdb_cache_size = 4M
#bdb_max_lock = 10000

# InnoDB tables are now used by default
innodb_data_home_dir = /srv/mariadb
innodb_log_group_home_dir = /srv/mariadb
# All the innodb_xxx values below are the default ones:
innodb_data_file_path = ibdata1:12M:autoextend
# You can set .._buffer_pool_size up to 50 - 80 %
# of RAM but beware of setting memory usage too high
#innodb_buffer_pool_size = 128M
innodb_buffer_pool_size = 1024M
innodb_log_file_size = 48M
innodb_log_buffer_size = 16M
innodb_flush_log_at_trx_commit = 1
innodb_lock_wait_timeout = 50

[mariadbdump]
quick
max_allowed_packet = 16M

[mariadb]
no-auto-rehash
# Remove the next comment character if you are not familiar with SQL
safe-updates

[isamchk]
key_buffer = 20M
sort_buffer_size = 20M
read_buffer = 2M
write_buffer = 2M

[myisamchk]
key_buffer_size = 20M
sort_buffer_size = 20M
read_buffer = 2M
write_buffer = 2M

[mariadbhotcopy]
interactive-timeout

# End /etc/mariadb/my.cnf
EOF

echo "   Install a database and change the ownership to the unprivileged user and group..."
echo "   Install a database and change the ownership to the unprivileged user and group..." >> $LFSLOG_PROCESS
echo "   Install a database and change the ownership to the unprivileged user and group..." >> $PKGLOG_ERROR
mariadb-install-db --basedir=/usr --datadir=/srv/mariadb --user=mariadb   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
chown -v -R mariadb:mariadb /srv/mariadb                                  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Start the server..."
echo "   Start the server..." >> $LFSLOG_PROCESS
echo "   Start the server..." >> $PKGLOG_ERROR
install -v -m755 -o mariadb -g mariadb -d /run/mariadb                    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
mariadbd-safe --user=mariadb >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR    &

echo "   Set root password of MariaDB server..."
echo "   Set root password of MariaDB server..." >> $LFSLOG_PROCESS
echo "   Set root password of MariaDB server..." >> $PKGLOG_ERROR
mariadb-admin -u root password >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Shutdown the server..."
echo "   Shutdown the server..." >> $LFSLOG_PROCESS
echo "   Shutdown the server..." >> $PKGLOG_ERROR
mariadb-admin -p shutdown

#echo "8. Execute the last 3 lines 'mariadbd-safe...'"
#echo "8. Execute the last 3 lines 'mariadbd-safe...'" >> $LFSLOG_PROCESS
#echo "8. Execute the last 3 lines 'mariadbd-safe...'" >> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
