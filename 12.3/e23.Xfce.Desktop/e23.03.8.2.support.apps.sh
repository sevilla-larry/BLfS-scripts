# e23.03.8.2.support.apps.sh
#
# Xfce Support Applications
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

# Xfce support apps
 bash e21.03.sh
