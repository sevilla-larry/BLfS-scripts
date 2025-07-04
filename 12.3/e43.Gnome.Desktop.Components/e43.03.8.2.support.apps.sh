# e43.03.8.2.support.apps.sh
#
# Gnome Support Applications
#

# common apps to all Desktop Environments
# excludes RustC
bash e10.03.2.sh
bash e10.03.3.sh
#if	 [ "$WITH_SOUND" -eq 1 ]; then
#fi

# common apps to Xfce & Gnome
bash e11.03.1.sh
bash e11.03.2.sh
#if	 [ "$WITH_SOUND" -eq 1 ]; then
#fi

# common apps to Gnome & LXQt
bash e13.03.sh
 
# Gnome support apps
bash e41.03.1.sh
