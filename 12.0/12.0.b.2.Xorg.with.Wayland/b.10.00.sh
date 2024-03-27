# b.10.00.sh
#
# Graphics and Font Libraries
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "10.04.FreeType-2.13.1 - before HarfBuzz"
echo "10.04.FreeType-2.13.1 - before HarfBuzz" >> $LFSLOG_PROCESS

export PKGPASS=1
time { bash b.10.04.FreeType-2.13.1.sh ; }
unset PKGPASS

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "10.11.HarfBuzz-8.1.1"
echo "10.11.HarfBuzz-8.1.1" >> $LFSLOG_PROCESS

time { bash b.10.11.HarfBuzz-8.1.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "10.04.FreeType-2.13.1 - after HarfBuzz"
echo "10.04.FreeType-2.13.1 - after HarfBuzz" >> $LFSLOG_PROCESS

export PKGPASS=2
time { bash b.10.04.FreeType-2.13.1.sh ; }
unset PKGPASS

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "10.05.Fontconfig-2.14.2"
echo "10.05.Fontconfig-2.14.2" >> $LFSLOG_PROCESS

#export PKGPASS=0
time { bash b.10.05.Fontconfig-2.14.2.sh ; }
#unset PKGPASS

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "10.21.libpng-1.6.40"
echo "10.21.libpng-1.6.40" >> $LFSLOG_PROCESS

time { bash b.10.21.libpng-1.6.40.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "10.31.Pixman-0.42.2"
echo "10.31.Pixman-0.42.2" >> $LFSLOG_PROCESS

time { bash b.10.31.Pixman-0.42.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
