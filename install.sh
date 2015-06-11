#!/bin/bash
    
srcdir = "/usr/share/antergos-openbox-setup"
backdir = "/usr/share/antergos-openbox-setup/backup"

# Create backup directory structure
mkdir -p ${backdir}/oblogout
mkdir -p ${backdir}/openbox/pipemenus
mkdir -p ${backdir}/plank/dock1/launchers

# Backup original files
cp /etc/xdg/compton.conf ${backdir}
cp /etc/xdg/conky.conf ${backdir}
cp /etc/xdg/gtk-2.0/gtkfilechooser.ini ${backdir}
cp /etc/xdg/.gtkrc-2.0 ${backdir}/gtkrc-2.0
cp /etc/xdg/gtk-3.0/settings.ini ${backdir}/settings.ini
cp /etc/xdg/nitrogen/nitrogen.cfg ${backdir}
cp /etc/xdg/nitrogen/bg-saved.cfg ${backdir}

cp /etc/oblogout.conf ${backdir}
cp /etc/oblogout/cancel.svg ${backdir}/oblogout
cp /etc/oblogout/lock.svg ${backdir}/oblogout
cp /etc/oblogout/restart.svg ${backdir}/oblogout
cp /etc/oblogout/suspend.svg ${backdir}/oblogout
cp /etc/oblogout/hibernate.svg ${backdir}/oblogout
cp /etc/oblogout/logout.svg ${backdir}/oblogout
cp /etc/oblogout/shutdown.svg ${backdir}/oblogout
cp /etc/oblogout/switch.svg ${backdir}/oblogout

cp /etc/xdg/openbox/autostart ${backdir}/openbox
cp /etc/xdg/openbox/menu.xml ${backdir}/openbox
cp /etc/xdg/openbox/rc.xml ${backdir}/openbox
cp /etc/xdg/openbox/pipemenus/obpipemenu-places ${backdir}/openbox/pipemenus
cp /etc/xdg/openbox/pipemenus/obrecent.sh ${backdir}/openbox/pipemenus

cp /etc/xdg/pcmanfm/pcmanfm.conf ${backdir}
cp /etc/xdg/libfm/libfm.conf ${backdir}

cp /etc/xdg/plank/dock1/settings ${backdir}/plank/dock1
cp /etc/xdg/plank/dock1/launchers/chromium.dockitem ${backdir}/plank/dock1/launchers
cp /etc/xdg/plank/dock1/launchers/gpicview.dockitem ${backdir}/plank/dock1/launchers
cp /etc/xdg/plank/dock1/launchers/mousepad.dockitem ${backdir}/plank/dock1/launchers
cp /etc/xdg/plank/dock1/launchers/pragha.dockitem ${backdir}/plank/dock1/launchers
cp /etc/xdg/plank/dock1/launchers/gnome-mplayer.dockitem ${backdir}/plank/dock1/launchers
cp /etc/xdg/plank/dock1/launchers/lxterminal.dockitem ${backdir}/plank/dock1/launchers
cp /etc/xdg/plank/dock1/launchers/plank.dockitem ${backdir}/plank/dock1/launchers

cp ${srcdir}/tint2rc /etc/xdg/tint2/tint2rc ${backdir}
cp ${srcdir}/volumeicon /etc/xdg/volumeicon/volumeicon ${backdir}
cp ${srcdir}/xinitrc /etc/X11/xinit/xinitrc ${backdir}

# Copy new versions
cp ${srcdir}/compton.conf /etc/xdg/compton.conf
cp ${srcdir}/conky.conf /etc/xdg/conky.conf
cp ${srcdir}/gtkfilechooser.ini /etc/xdg/gtk-2.0/gtkfilechooser.ini
cp ${srcdir}/gtkrc-2.0 /etc/xdg/.gtkrc-2.0
cp ${srcdir}/settings.ini /etc/xdg/gtk-3.0
cp ${srcdir}/nitrogen.cfg /etc/xdg/nitrogen/nitrogen.cfg
cp ${srcdir}/bg-saved.cfg /etc/xdg/nitrogen/bg-saved.cfg
   
cp ${srcdir}/oblogout.conf /etc/oblogout.conf
cp ${srcdir}/oblogout/cancel.svg /etc/oblogout/cancel.svg
cp ${srcdir}/oblogout/lock.svg /etc/oblogout/lock.svg
cp ${srcdir}/oblogout/restart.svg /etc/oblogout/restart.svg
cp ${srcdir}/oblogout/suspend.svg /etc/oblogout/suspend.svg
cp ${srcdir}/oblogout/hibernate.svg /etc/oblogout/hibernate.svg
cp ${srcdir}/oblogout/logout.svg /etc/oblogout/logout.svg
cp ${srcdir}/oblogout/shutdown.svg /etc/oblogout/shutdown.svg
cp ${srcdir}/oblogout/switch.svg /etc/oblogout/switch.svg

cp ${srcdir}/openbox/autostart /etc/xdg/openbox/autostart
cp ${srcdir}/openbox/menu.xml /etc/xdg/openbox/menu.xml
cp ${srcdir}/openbox/rc.xml /etc/xdg/openbox/rc.xml
cp ${srcdir}/openbox/pipemenus/obpipemenu-places /etc/xdg/openbox/pipemenus/obpipemenu-places
cp ${srcdir}/openbox/pipemenus/obrecent.sh /etc/xdg/openbox/pipemenus/obrecent.sh

cp ${srcdir}/pacmanfm.conf /etc/xdg/pcmanfm/pcmanfm.conf
cp ${srcdir}/libfm.conf /etc/xdg/libfm/libfm.conf

cp ${srcdir}/plank/dock1/settings /etc/xdg/plank/dock1/settings
cp ${srcdir}/plank/dock1/launchers/chromium.dockitem /etc/xdg/plank/dock1/launchers/chromium.dockitem
cp ${srcdir}/plank/dock1/launchers/gpicview.dockitem /etc/xdg/plank/dock1/launchers/gpicview.dockitem
cp ${srcdir}/plank/dock1/launchers/mousepad.dockitem /etc/xdg/plank/dock1/launchers/mousepad.dockitem
cp ${srcdir}/plank/dock1/launchers/pragha.dockitem /etc/xdg/plank/dock1/launchers/pragha.dockitem
cp ${srcdir}/plank/dock1/launchers/gnome-mplayer.dockitem /etc/xdg/plank/dock1/launchers/gnome-mplayer.dockitem
cp ${srcdir}/plank/dock1/launchers/lxterminal.dockitem /etc/xdg/plank/dock1/launchers/lxterminal.dockitem
cp ${srcdir}/plank/dock1/launchers/plank.dockitem /etc/xdg/plank/dock1/launchers/plank.dockitem

cp ${srcdir}/tint2rc /etc/xdg/tint2/tint2rc
cp ${srcdir}/volumeicon /etc/xdg/volumeicon/volumeicon
cp ${srcdir}/xinitrc /etc/X11/xinit/xinitrc

# Done!
