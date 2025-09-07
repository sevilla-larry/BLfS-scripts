# d20.03.1.Part11.14.sh
#
# Graphical Environments
#
#   d20.24.14 Xorg Applications
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.24.14.Xorg.Applications"
echo "d20.24.14.Xorg.Applications" >> $LFSLOG_PROCESS

time { bash d20.24.14.Xorg.Applications.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
