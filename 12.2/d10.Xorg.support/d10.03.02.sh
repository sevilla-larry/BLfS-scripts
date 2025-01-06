# d10.03.02.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.12.10.dbus-1.14.10.Pass1"
echo "d10.12.10.dbus-1.14.10.Pass1" >> $LFSLOG_PROCESS

time { bash d10.12.10.dbus-1.14.10.Pass1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.12.11.elogind-255.5"
echo "d10.12.11.elogind-255.5" >> $LFSLOG_PROCESS

time { bash d10.12.11.elogind-255.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.09.12.duktape-2.7.0"
echo "d10.09.12.duktape-2.7.0.sh" >> $LFSLOG_PROCESS

time { bash d10.09.12.duktape-2.7.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.09.79.mtdev-1.1.7"
echo "d10.09.79.mtdev-1.1.7" >> $LFSLOG_PROCESS

time { bash d10.09.79.mtdev-1.1.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
