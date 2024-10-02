# d10.03.Group03.sh
#
# elogind
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.12.11.elogind-255.5"
echo "d10.12.11.elogind-255.5" >> $LFSLOG_PROCESS

time { bash d10.12.11.elogind-255.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
