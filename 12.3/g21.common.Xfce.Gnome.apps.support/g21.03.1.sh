# g21.03.1.sh
#
# Mousepad support apps
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "g21.25.22.gtksourceview4-4.8.4"
echo "g21.25.22.gtksourceview4-4.8.4" >> $LFSLOG_PROCESS

time { bash g21.25.22.gtksourceview4-4.8.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
