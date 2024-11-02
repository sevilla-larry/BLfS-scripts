# b10.03.1.sh
#
# Dependencies of
#   MariaDB
#    mostly
#   CMake
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b10.17.07.libevent-2.1.12"
echo "b10.17.07.libevent-2.1.12" >> $LFSLOG_PROCESS

time { bash b10.17.07.libevent-2.1.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.11.21.unixODBC-2.3.12"
echo "b10.11.21.unixODBC-2.3.12" >> $LFSLOG_PROCESS

time { bash b10.11.21.unixODBC-2.3.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.09.83.PCRE2-10.44"
echo "b10.09.83.PCRE2-10.44" >> $LFSLOG_PROCESS

time { bash b10.09.83.PCRE2-10.44.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.09.07.boost-1.86.0"
echo "b10.09.07.boost-1.86.0" >> $LFSLOG_PROCESS

time { bash b10.09.07.boost-1.86.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.04.16.Nettle-3.10"
echo "b10.04.16.Nettle-3.10" >> $LFSLOG_PROCESS

time { bash b10.04.16.Nettle-3.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.09.32.libarchive-3.7.4"
echo "b10.09.32.libarchive-3.7.4" >> $LFSLOG_PROCESS

time { bash b10.09.32.libarchive-3.7.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.09.70.libuv-1.48.0"
echo "b10.09.70.libuv-1.48.0" >> $LFSLOG_PROCESS

time { bash b10.09.70.libuv-1.48.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.09.66.libunistring-1.2"
echo "b10.09.66.libunistring-1.2" >> $LFSLOG_PROCESS

time { bash b10.09.66.libunistring-1.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.09.49.libidn2-2.3.7"
echo "b10.09.49.libidn2-2.3.7" >> $LFSLOG_PROCESS

time { bash b10.09.49.libidn2-2.3.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.17.14.libpsl-0.21.5"
echo "b10.17.14.libpsl-0.21.5" >> $LFSLOG_PROCESS

time { bash b10.17.14.libpsl-0.21.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.17.20.nghttp2-1.62.1"
echo "b10.17.20.nghttp2-1.62.1" >> $LFSLOG_PROCESS

time { bash b10.17.20.nghttp2-1.62.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###
#
# libssh2 is NOT used by cURL
#

# echo "b10.09.63.libssh2-1.11.0"
# echo "b10.09.63.libssh2-1.11.0" >> $LFSLOG_PROCESS

# time { bash b10.09.63.libssh2-1.11.0.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

###

echo "b10.17.02.cURL-8.10.1"
echo "b10.17.02.cURL-8.10.1" >> $LFSLOG_PROCESS

time { bash b10.17.02.cURL-8.10.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.13.09.Git-2.46.0"
echo "b10.13.09.Git-2.46.0" >> $LFSLOG_PROCESS

time { bash b10.13.09.Git-2.46.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "b10.13.03.CMake-3.30.2"
echo "b10.13.03.CMake-3.30.2" >> $LFSLOG_PROCESS

time { bash b10.13.03.CMake-3.30.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
