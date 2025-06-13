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

###

echo "g21.09.23.gspell-1.14.0"
echo "g21.09.23.gspell-1.14.0" >> $LFSLOG_PROCESS

time { bash g21.09.23.gspell-1.14.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
