# c.37.00.sh
#
# LXDE Desktop
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "37.01.lxmenu-data-0.1.5"
echo "37.01.lxmenu-data-0.1.5" >> $LFSLOG_PROCESS

time { bash c.37.01.lxmenu-data-0.1.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "37.02.libfm-extra-1.3.2"
echo "37.02.libfm-extra-1.3.2" >> $LFSLOG_PROCESS

time { bash c.37.02.libfm-extra-1.3.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "37.03.menu-cache-1.1.0"
echo "37.03.menu-cache-1.1.0" >> $LFSLOG_PROCESS

time { bash c.37.03.menu-cache-1.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "37.04.libfm-1.3.2"
echo "37.04.libfm-1.3.2" >> $LFSLOG_PROCESS

time { bash c.37.04.libfm-1.3.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "37.05.PCManFM-1.3.2"
echo "37.05.PCManFM-1.3.2" >> $LFSLOG_PROCESS

time { bash c.37.05.PCManFM-1.3.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "37.06.libwnck-2.30.7"
echo "37.06.libwnck-2.30.7" >> $LFSLOG_PROCESS

time { bash c.37.06.libwnck-2.30.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "37.07.LXPanel-0.10.1"
echo "37.07.LXPanel-0.10.1" >> $LFSLOG_PROCESS

time { bash c.37.07.LXPanel-0.10.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "37.08.LXAppearance-0.6.3"
echo "37.08.LXAppearance-0.6.3" >> $LFSLOG_PROCESS

time { bash c.37.08.LXAppearance-0.6.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "37.09.LXSession-0.5.5"
echo "37.09.LXSession-0.5.5" >> $LFSLOG_PROCESS

time { bash c.37.09.LXSession-0.5.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "37.10.lxde-common-0.99.2"
echo "37.10.lxde-common-0.99.2" >> $LFSLOG_PROCESS

time { bash c.37.10.lxde-common-0.99.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
