# c.13.00-1.LXDE.Part2.sh
#
# Programming
#
#   Python Modules
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "13.24.18.PyCairo-1.18.2"
echo "13.24.18.PyCairo-1.18.2" >> $LFSLOG_PROCESS

time { bash c.13.24.18.PyCairo-1.18.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "13.24.22.PyGObject-2.28.7"
echo "13.24.22.PyGObject-2.28.7" >> $LFSLOG_PROCESS

time { bash c.13.24.22.PyGObject-2.28.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "13.24.24.PyGTK-2.24.0"
echo "13.24.24.PyGTK-2.24.0" >> $LFSLOG_PROCESS

time { bash c.13.24.24.PyGTK-2.24.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
