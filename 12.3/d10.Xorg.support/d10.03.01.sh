# d10.03.01.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.49.06.xmlto-0.0.29"
echo "d10.49.06.xmlto-0.0.29" >> $LFSLOG_PROCESS

time { bash d10.49.06.xmlto-0.0.29.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.13.24.12.lxml-5.3.1"
echo "d10.13.24.12.lxml-5.3.1" >> $LFSLOG_PROCESS

time { bash d10.13.24.12.lxml-5.3.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.13.24.07.docutils-0.21.2"
echo "d10.13.24.07.docutils-0.21.2" >> $LFSLOG_PROCESS

time { bash d10.13.24.07.docutils-0.21.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.12.11.dbus-1.16.0.Pass1"
echo "d10.12.11.dbus-1.16.0.Pass1" >> $LFSLOG_PROCESS

time { bash d10.12.11.dbus-1.16.0.Pass1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.12.12.elogind-255.17"
echo "d10.12.12.elogind-255.17" >> $LFSLOG_PROCESS

time { bash d10.12.12.elogind-255.17.sh ; }

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
