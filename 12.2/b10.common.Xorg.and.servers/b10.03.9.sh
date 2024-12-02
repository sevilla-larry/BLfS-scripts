# b10.03.9.sh
#
# Common with OpenStack
# Mako (Python module)
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "b10.13.23.13.Mako-1.3.5"
echo "b10.13.23.13.Mako-1.3.5" >> $LFSLOG_PROCESS

time { bash b10.13.23.13.Mako-1.3.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
