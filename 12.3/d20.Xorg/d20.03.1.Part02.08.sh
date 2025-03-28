# d20.03.1.Part02.08.sh
#
# Graphical Environments
#
#   d20.24.08 Xorg Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.24.08.Xorg.Libraries"
echo "d20.24.08.Xorg.Libraries" >> $LFSLOG_PROCESS

time { bash d20.24.08.Xorg.Libraries.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
