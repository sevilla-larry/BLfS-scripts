# e53.03.sh
#
# 1. build KDE Frameworks 6
# 2. breeze-icons
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e53.30.02.Building.KDE.Frameworks-6.11.0"
echo "e53.30.02.Building.KDE.Frameworks-6.11.0" >> $LFSLOG_PROCESS

time { bash e53.30.02.Building.KDE.Frameworks-6.11.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e53.28.02.breeze-icons-6.11.0"
echo "e53.28.02.breeze-icons-6.11.0" >> $LFSLOG_PROCESS

time { bash e53.28.02.breeze-icons-6.11.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
