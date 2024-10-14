# e23.04.all.sh
#
# Xfce Desktop
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "e23.35.01.libxfce4util-4.18.2"
echo "e23.35.01.libxfce4util-4.18.2" >> $LFSLOG_PROCESS

time { bash e23.35.01.libxfce4util-4.18.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e23.35.02.Xfconf-4.18.3"
echo "e23.35.02.Xfconf-4.18.3" >> $LFSLOG_PROCESS

time { bash e23.35.02.Xfconf-4.18.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e23.35.03.libxfce4ui-4.18.6"
echo "e23.35.03.libxfce4ui-4.18.6" >> $LFSLOG_PROCESS

time { bash e23.35.03.libxfce4ui-4.18.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e23.35.04.Exo-4.18.0"
echo "e23.35.04.Exo-4.18.0" >> $LFSLOG_PROCESS

time { bash e23.35.04.Exo-4.18.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e23.35.05.Garcon-4.18.2"
echo "e23.35.05.Garcon-4.18.2" >> $LFSLOG_PROCESS

time { bash e23.35.05.Garcon-4.18.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e23.35.06.libwnck-43.0"
echo "e23.35.06.libwnck-43.0" >> $LFSLOG_PROCESS

time { bash e23.35.06.libwnck-43.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e23.35.07.xfce4-panel-4.18.6"
echo "e23.35.07.xfce4-panel-4.18.6" >> $LFSLOG_PROCESS

time { bash e23.35.07.xfce4-panel-4.18.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e23.35.08.thunar-4.18.11"
echo "e23.35.08.thunar-4.18.11" >> $LFSLOG_PROCESS

time { bash e23.35.08.thunar-4.18.11.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

#echo "e23.35.09.thunar-volman-4.18.0"
#echo "e23.35.09.thunar-volman-4.18.0" >> $LFSLOG_PROCESS

#time { bash e23.35.09.thunar-volman-4.18.0.sh ; }

#date +"%Y/%b/%d %H:%M"
#date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#echo "." >> $LFSLOG_PROCESS
#echo "."
#echo "."

###

echo "e23.35.10.tumbler-4.18.2"
echo "e23.35.10.tumbler-4.18.2" >> $LFSLOG_PROCESS

time { bash e23.35.10.tumbler-4.18.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e23.35.11.xfce4-appfinder-4.18.1"
echo "e23.35.11.xfce4-appfinder-4.18.1" >> $LFSLOG_PROCESS

time { bash e23.35.11.xfce4-appfinder-4.18.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###
#   xfce4-power-manager currently SKIPped
###

echo "e23.35.13.xfce4-settings-4.18.6"
echo "e23.35.13.xfce4-settings-4.18.6" >> $LFSLOG_PROCESS

time { bash e23.35.13.xfce4-settings-4.18.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e23.35.14.Xfdesktop-4.18.1"
echo "e23.35.14.Xfdesktop-4.18.1" >> $LFSLOG_PROCESS

time { bash e23.35.14.Xfdesktop-4.18.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e23.35.15.Xfwm4-4.18.0"
echo "e23.35.15.Xfwm4-4.18.0" >> $LFSLOG_PROCESS

time { bash e23.35.15.Xfwm4-4.18.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "e23.35.16.xfce4-session-4.18.4"
echo "e23.35.16.xfce4-session-4.18.4" >> $LFSLOG_PROCESS

time { bash e23.35.16.xfce4-session-4.18.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
