# d20.03.1.Part08.12.3.PC.sh
#
# Graphical Environments
#
#   d20.24.12 Mesa
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.24.12.Mesa-25.1.8"
echo "d20.24.12.Mesa-25.1.8" >> $LFSLOG_PROCESS

time { bash d20.24.12.Mesa-25.1.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
