# d20.03.all.support.apps.sh
#
# Support Applications
#

###

# common with MariaDB
# bash b10.03.1.sh	- called in g63 - libreoffice support

# common with Apache (OpenStack)
bash b10.03.5.sh
# common with OpenStack
bash b10.03.6.sh

###

# xml's
# dbus pass 1
# elogind
# duktape
# mtdev
bash d10.03.01.sh

###

# LLVM
bash d10.03.02.sh

###

# GLib
bash d10.03.03.sh

###

# Polkit
bash d10.03.04.sh

###

# Graphics
bash d10.03.05.sh

###

# Wayland support
bash d10.03.06.sh

#####
