# c14.20.04.ProFTPD-1.3.8b.sh
#

#
# Dependencies optional:
#
#               a.08.92.03 Libcap-2.73.with.PAM
#               a.08.92.01 Linux-PAM-1.7.0
#               c11.22.03  MariaDB-10.11.8
#               a.08.91.11 PCRE2-10.45
#               c12.22.04  PostgreSQL-16.4
#

export PKG="proftpd-1.3.8b"
export PKGLOG_DIR=$LFSLOG/20.04
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


groupadd -g 46 proftpd
useradd -c proftpd -d /srv/ftp -g proftpd \
        -s /usr/bin/proftpdshell -u 46 proftpd

install -v -d -m775 -o proftpd -g proftpd /srv/ftp  \
        >> $PKGLOG_OTHERS   2>> $PKGLOG_ERROR
ln -v -s /usr/bin/false /usr/bin/proftpdshell       \
        >> $PKGLOG_OTHERS   2>> $PKGLOG_ERROR
echo /usr/bin/proftpdshell >> /etc/shells           \
        2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr           \
            --sysconfdir=/etc       \
            --localstatedir=/run    \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -d -m755 /usr/share/doc/proftpd-1.3.8b  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -Rv doc/*     /usr/share/doc/proftpd-1.3.8b  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# simple, download-only sample configuration
cat > /etc/proftpd.conf << "EOF"    2>> $PKGLOG_ERROR
# This is a basic ProFTPD configuration file
# It establishes a single server and a single anonymous login.

ServerName                      "ProFTPD Default Installation"
ServerType                      standalone
DefaultServer                   on

# Port 21 is the standard FTP port.
Port                            21
# Umask 022 is a good standard umask to prevent new dirs and files
# from being group and world writable.
Umask                           022

# To prevent DoS attacks, set the maximum number of child processes
# to 30.  If you need to allow more than 30 concurrent connections
# at once, simply increase this value.  Note that this ONLY works
# in standalone mode, in inetd mode you should use an inetd server
# that allows you to limit maximum number of processes per service

MaxInstances                    30

# Set the user and group that the server normally runs at.
User                            proftpd
Group                           proftpd

# To cause every FTP user to be "jailed" (chrooted) into their home
# directory, uncomment this line.
#DefaultRoot ~


# Normally, files should be overwritable.
<Directory /*>
  AllowOverwrite                on
</Directory>

# A basic anonymous configuration, no upload directories.
<Anonymous ~proftpd>
  User                          proftpd
  Group                         proftpd
  # Clients should be able to login with "anonymous" as well as "proftpd"
  UserAlias                     anonymous proftpd

  # Limit the maximum number of anonymous logins
  MaxClients                    10

  # 'welcome.msg' should be displayed at login, and '.message' displayed
  # in each newly chdired directory.
  DisplayLogin                  welcome.msg
  DisplayChdir                  .message

  # Limit WRITE everywhere in the anonymous chroot
  # <Limit WRITE>
  #  DenyAll
  # </Limit>
</Anonymous>
EOF


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
