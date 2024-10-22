# d20.05.Part11.25.35.sh
#
# Graphical Environments
#
#   d20.25.35
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####
#		libepoxy is recommended but needed by Xorg-Server
###


echo "d20.25.35.libepoxy-1.5.10"
echo "d20.25.35.libepoxy-1.5.10" >> $LFSLOG_PROCESS

time { bash d20.25.35.libepoxy-1.5.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
