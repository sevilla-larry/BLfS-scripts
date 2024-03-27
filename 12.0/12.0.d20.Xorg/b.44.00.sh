# b.44.00.sh
#
# Multimedia Libraries and Drivers
#
# NOTHING TO DO

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "NOTHING TO DO"
# compiled in b.24.00.all.2.PC.sh

###

# before 24.16 Mesa-22.3.5 PC
#
# echo "44.45.libva-2.19.0"
# echo "44.45.libva-2.19.0" >> $LFSLOG_PROCESS

# export PKGPASS=1
# time { bash b.44.45.libva-2.19.0.sh ; }
# unset PKGPASS

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

###

# before 24.16 Mesa-22.3.5 PC
#
# echo "44.24.intel-vaapi-driver-2.4.1"
# echo "44.24.intel-vaapi-driver-2.4.1" >> $LFSLOG_PROCESS

# time { bash b.44.24.intel-vaapi-driver-2.4.1.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

#####

unset LFSLOG_PROCESS
