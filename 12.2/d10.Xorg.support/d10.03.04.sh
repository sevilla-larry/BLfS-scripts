# d10.03.04.sh
#
# GLib
# desktop-file-utils & share-mime-info
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "d10.09.17.GLib-2.82.4"
echo "d10.09.17.GLib-2.82.4" >> $LFSLOG_PROCESS

time { bash d10.09.17.GLib-2.82.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.11.04.desktop-file-utils-0.27"
echo "d10.11.04.desktop-file-utils-0.27" >> $LFSLOG_PROCESS

time { bash d10.11.04.desktop-file-utils-0.27.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.11.16.shared-mime-info-2.4"
echo "d10.11.16.shared-mime-info-2.4" >> $LFSLOG_PROCESS

time { bash d10.11.16.shared-mime-info-2.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."


#####

unset LFSLOG_PROCESS
