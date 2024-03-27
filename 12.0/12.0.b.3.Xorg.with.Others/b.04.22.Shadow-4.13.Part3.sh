# b.04.22.Shadow-4.13.Part3.sh
#
# execute if Part 2 IS WORKING

export PKG="shadow-4.13"

cd $PKG


if [ -f /etc/login.access ]; then mv -v /etc/login.access{,.NOUSE}; fi

if [ -f /etc/limits ]; then mv -v /etc/limits{,.NOUSE}; fi


cd ..
rm -rf $PKG
unset PKG


echo "Caution!"
echo "."
echo "Be sure to test the login capabilities"
echo "of the system before logging out."
echo "Errors in the configuration"
echo "can cause a permanent lockout"
echo "requiring a boot from an external source"
echo "to correct the problem."
