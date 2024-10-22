# d10.03.Group09.sh
#
# Polkit
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "d10.04.20.Polkit-125"
echo "d10.04.20.Polkit-125" >> $LFSLOG_PROCESS

time { bash d10.04.20.Polkit-125.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
