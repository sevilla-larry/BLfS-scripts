# d10.03.01.sh
#
# Python Modules
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.13.23.12.lxml-5.3.0"
echo "d10.13.23.12.lxml-5.3.0" >> $LFSLOG_PROCESS

time { bash d10.13.23.12.lxml-5.3.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.13.23.13.Mako-1.3.5"
echo "d10.13.23.13.Mako-1.3.5" >> $LFSLOG_PROCESS

time { bash d10.13.23.13.Mako-1.3.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.13.23.15.Packaging-12.1"
echo "d10.13.23.15.Packaging-12.1" >> $LFSLOG_PROCESS

time { bash d10.13.23.15.Packaging-12.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
