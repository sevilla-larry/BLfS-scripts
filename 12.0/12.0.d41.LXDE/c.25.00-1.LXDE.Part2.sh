# c.25.00-1.LXDE.sh
#
# Graphical Environment Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "25.31.keybinder-0.3.1"
echo "25.31.keybinder-0.3.1" >> $LFSLOG_PROCESS

time { bash c.25.31.keybinder-0.3.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
