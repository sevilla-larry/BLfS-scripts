# d10.10.00.sh
#
# Graphics and Font Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

# compile libpng ahead of FreeType
echo "d10.10.22.libpng-1.6.43"
echo "d10.10.22.libpng-1.6.43" >> $LFSLOG_PROCESS

time { bash d10.10.22.libpng-1.6.43.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.10.04.FreeType-2.13.3 - before HarfBuzz"
echo "d10.10.04.FreeType-2.13.3 - before HarfBuzz" >> $LFSLOG_PROCESS

export PKGPASS=1
time { bash d10.10.04.FreeType-2.13.3.sh ; }
unset PKGPASS

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.10.12.harfBuzz-9.0.0"
echo "d10.10.12.harfBuzz-9.0.0" >> $LFSLOG_PROCESS

time { bash d10.10.12.harfBuzz-9.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.10.04.FreeType-2.13.3 - after HarfBuzz"
echo "d10.10.04.FreeType-2.13.3 - after HarfBuzz" >> $LFSLOG_PROCESS

export PKGPASS=2
time { bash d10.10.04.FreeType-2.13.3.sh ; }
unset PKGPASS

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "d10.10.05.Fontconfig-2.15.0"
echo "d10.10.05.Fontconfig-2.15.0" >> $LFSLOG_PROCESS

time { bash d10.10.05.Fontconfig-2.15.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

#echo "10.31.Pixman-0.42.2"
#echo "10.31.Pixman-0.42.2" >> $LFSLOG_PROCESS

#time { bash b.10.31.Pixman-0.42.2.sh ; }

#date +"%Y/%b/%d %H:%M"
#date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#echo "." >> $LFSLOG_PROCESS
#echo "."
#echo "."

#####

unset LFSLOG_PROCESS
