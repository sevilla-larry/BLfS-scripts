# d20.24.00.Part04.25.34.sh
#
# Graphical Environments
#
#   d20.25.34
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####
#		Libdrm is required by Mesa
###

echo "d20.25.34.Libdrm-2.4.122"
echo "d20.25.34.Libdrm-2.4.122" >> $LFSLOG_PROCESS

time { bash d20.25.34.Libdrm-2.4.122.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
