# d20.03.all.support.apps.2.sh
#
# Support Applications
#

###

# common to all
bash b10.03.0.sh

# common with MariaDB & Apache
bash b10.03.6.sh

# common with MariaDB
bash b10.03.1.sh

# common with PostgreSQL & ProFTPD
bash b10.03.5.sh

# common with PostgreSQL
bash b10.03.2.sh

# common with Apache
bash b10.03.3.sh

# common with ProFTPD
bash b10.03.4.sh

# common with OpenStack
bash b10.03.9.sh

###

# Python modules
# bash d10.03.01.sh
#   to b10...

###

# dbus pass 1
# elogind
# duktape
# mtdev
bash d10.03.02.sh

###

# LLVM
bash d10.03.03.sh

###

# GLib
bash d10.03.04.sh

###

# Polkit
bash d10.03.05.sh

###

# Graphics
bash d10.03.06.sh

###

# Wayland support
bash d10.03.07.sh

# Glslang, SPIRV
bash d10.03.08.sh

#####
