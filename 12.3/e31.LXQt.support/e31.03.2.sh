# e31.03.2.sh
#
# 1. breeze-icons
# 2. LXQt Desktop Final Instructions
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e31.28.02.breeze-icons-6.11.0"
echo "e31.28.02.breeze-icons-6.11.0" >> $LFSLOG_PROCESS

time { bash e31.28.02.breeze-icons-6.11.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "f3.26.03.sddm-0.21.0"
echo "f3.26.03.sddm-0.21.0" >> $LFSLOG_PROCESS

time { bash f3.26.03.sddm-0.21.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e33.37.40.LXQt.Desktop.Final.Instructions"
echo "e33.37.40.LXQt.Desktop.Final.Instructions" >> $LFSLOG_PROCESS

time { bash e33.37.40.LXQt.Desktop.Final.Instructions.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
