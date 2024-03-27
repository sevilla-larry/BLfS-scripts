# b.11.00.sh
#
# General Utilities
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "11.04.desktop-file-utils-0.26"
echo "11.04.desktop-file-utils-0.26" >> $LFSLOG_PROCESS

time { bash b.11.04.desktop-file-utils-0.26.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "11.17.shared-mime-info-2.2"
echo "11.17.shared-mime-info-2.2" >> $LFSLOG_PROCESS

time { bash b.11.17.shared-mime-info-2.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
