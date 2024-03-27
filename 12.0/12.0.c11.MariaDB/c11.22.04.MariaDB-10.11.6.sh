# c11.22.04.MariaDB-10.11.6.sh
# errata
#
# Dependencies Required:
#
#               13.04 CMake-3.28.1
#
#               libfmt ( downloaded by MariaDB )
#
# Dependencies Recommended:
#
#               17.07 libevent-2.1.12
#
# Dependencies Optional:
#
#               04.12 Linux-PAM-1.5.3
#               09.68 libxml2-2.12-3
#               09.80 PCRE2-10.42
#               09.05 Boost-1.84.0
#
#                     ( deferred )
#               09.75 LZO-2.10
#               09.93 LZ4-1.9.4 ( from GitHub )
#               09.94 Snappy-1.1.10 ( from GitHub )
#

export PKG="mariadb-10.11.6"
export PKGLOG_DIR=$LFSLOG/22.04
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


groupadd -g 40 mysql
useradd -c "MySQL Server" -d /srv/mysql -g mysql -s /bin/false -u 40 mysql

mkdir build
cd    build

echo "2. CMake Configure ..."
echo "2. CMake Configure ..." >> $LFSLOG_PROCESS
echo "2. CMake Configure ..." >> $PKGLOG_ERROR
cmake -DCMAKE_BUILD_TYPE=Release                        \
      -DCMAKE_INSTALL_PREFIX=/usr                       \
      -DGRN_LOG_PATH=/var/log/groonga.log               \
      -DINSTALL_DOCDIR=share/doc/mariadb-10.11.6        \
      -DINSTALL_DOCREADMEDIR=share/doc/mariadb-10.11.6  \
      -DINSTALL_MANDIR=share/man                        \
      -DINSTALL_MYSQLSHAREDIR=share/mysql               \
      -DINSTALL_MYSQLTESTDIR=share/mysql/test           \
      -DINSTALL_PAMDIR=lib/security                     \
      -DINSTALL_PAMDATADIR=/etc/security                \
      -DINSTALL_PLUGINDIR=lib/mysql/plugin              \
      -DINSTALL_SBINDIR=sbin                            \
      -DINSTALL_SCRIPTDIR=bin                           \
      -DINSTALL_SQLBENCHDIR=share/mysql/bench           \
      -DINSTALL_SUPPORTFILESDIR=share/mysql             \
      -DMYSQL_DATADIR=/srv/mysql                        \
      -DMYSQL_UNIX_ADDR=/run/mysqld/mysqld.sock         \
      -DWITH_EXTRA_CHARSETS=complex                     \
      -DWITH_EMBEDDED_SERVER=ON                         \
      -DSKIP_TESTS=ON                                   \
      -DTOKUDB_OK=0                                     \
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

echo "5. Extensive Test ..."
echo "5. Extensive Test ..." >> $LFSLOG_PROCESS
echo "5. Extensive Test ..." >> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK
echo "5. Extensive Test ..." >> $PKGLOG_CHECK
pushd mysql-test
./mtr --parallel $NPROC --mem --force   \
    >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
popd

echo "6. Make Install ..."
echo "6. Make Install ..." >> $LFSLOG_PROCESS
echo "6. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mv /usr/share/pam_use_map.so /lib/security
mv /usr/share/user_map.conf /etc/security

# configure
echo "7. Configure MySQL ..."
echo "7. Configure MySQL ..." >> $LFSLOG_PROCESS
echo "7. Configure MySQL ..." >> $PKGLOG_ERROR

install -dm 755 /etc/mysql

cat > /etc/mysql/my.cnf << "EOF"
# Begin /etc/mysql/my.cnf

# The following options will be passed to all MySQL clients
[client]
password        = MariaDB
port            = 3306
socket          = /run/mysqld/mysqld.sock

# The MySQL server
[mysqld]
port            = 3306
socket          = /run/mysqld/mysqld.sock
datadir         = /srv/mysql
skip-external-locking
key_buffer_size = 16M
max_allowed_packet = 1M
sort_buffer_size = 512K
net_buffer_length = 16K
myisam_sort_buffer_size = 8M

# Don't listen on a TCP/IP port at all.
skip-networking

# required unique id between 1 and 2^32 - 1
server-id       = 1

# Uncomment the following if you are using BDB tables
#bdb_cache_size = 4M
#bdb_max_lock = 10000

# InnoDB tables are now used by default
innodb_data_home_dir = /srv/mysql
innodb_log_group_home_dir = /srv/mysql
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

[mysqldump]
quick
max_allowed_packet = 16M

[mysql]
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

[mysqlhotcopy]
interactive-timeout

# End /etc/mysql/my.cnf
EOF

mysql_install_db --basedir=/usr --datadir=/srv/mysql --user=mysql
chown -R mysql:mysql /srv/mysql

install -m755 -o mysql -g mysql -d /run/mysqld
#mysqld_safe --user=mysql 2>&1 >/dev/null &

#mysqladmin -u root MariaDB

#mysqladmin -p shutdown

echo "8. Execute the last 3 lines 'mysqld_safe...'"
echo "8. Execute the last 3 lines 'mysqld_safe...'" >> $LFSLOG_PROCESS
echo "8. Execute the last 3 lines 'mysqld_safe...'" >> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
