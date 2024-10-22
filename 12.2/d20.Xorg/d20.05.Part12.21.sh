# d20.05.Part10.21.sh
#
# Graphical Environments
#
#   24.21 Xorg Fonts
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d20.24.21.Xorg.Fonts"
echo "d20.24.21.Xorg.Fonts" >> $LFSLOG_PROCESS

time { bash d20.24.21.Xorg.Fonts.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
