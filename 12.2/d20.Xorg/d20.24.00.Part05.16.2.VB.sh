# d20.24.00.Part05.16.2.VB.sh
#
# Graphical Environments
#
#   d20.24.16 Mesa	- for VB
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.24.16.Mesa-24.1.5"
echo "d20.24.16.Mesa-24.1.5" >> $LFSLOG_PROCESS

time { bash d20.24.16.Mesa-24.1.5-2.VB.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
