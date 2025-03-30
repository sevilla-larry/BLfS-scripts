# d20.03.1.Part06.25.34.sh
#
# Graphical Environments
#
#   d20.25.33
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####
#		Libdrm is required by Mesa
###

echo "d20.25.33.Libdrm-2.4.124"
echo "d20.25.33.Libdrm-2.4.124" >> $LFSLOG_PROCESS

time { bash d20.25.33.Libdrm-2.4.124.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
