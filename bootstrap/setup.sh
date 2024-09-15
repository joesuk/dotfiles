#!/bin/sh

# set up header files for dwmblocks and dmenu
sudo -u "$name" rm -rf "/home/$name/.local/src/dwmblocks/config.h"
sudo -u "$name" ln -s "/home/$name/.config/headers/dwmblocks_config.h" "/home/$name/.local/src/dwmblocks/config.h"
cd ~/.local/src/dwmblocks/
sudo -u "$name" make install
sudo -u "$name" rm -rf "/home/$name/.local/src/dmenu/config.h"
sudo -u "$name" ln -s "/home/$name/.config/headers/dmenu_config.h" "/home/$name/.local/src/dmenu/config.h"
cd ~/.local/src/dmenu/
sudo -u "$name" make install

# set wallpaper
sudo -u "$name" xwallpaper --zoom "/home/$name/.local/share/bg.png"

# hardlink hosts file
sudo -u "$name" chown -h "$name":"$name" "/home/$name/.local/share/hosts"
sudo -u "$name" ln -f "/home/$name/.local/share/hosts" /etc/hosts

# set up redshift
sudo -u "$name" rm -rf /usr/lib/systemd/user/redshift.service
sudo -u "$name" touch /usr/lib/systemd/user/redshift.service
sudo -u "$name" echo "[Unit]" >> /usr/lib/systemd/user/redshift.service
sudo -u "$name" echo "Description=Redshift display colour temperature adjustment" >> /usr/lib/systemd/user/redshift.service
sudo -u "$name" echo "Documentation=http://jonls.dk/redshift/" >> /usr/lib/systemd/user/redshift.service
sudo -u "$name" echo "After=display-manager.service" >> /usr/lib/systemd/user/redshift.service
sudo -u "$name" echo "[Service]" >> /usr/lib/systemd/user/redshift.service
sudo -u "$name" echo "ExecStart=/usr/bin/redshift" >> /usr/lib/systemd/user/redshift.service
sudo -u "$name" echo "Restart=always" >> /usr/lib/systemd/user/redshift.service
sudo -u "$name" echo "[Install]" >> /usr/lib/systemd/user/redshift.service
sudo -u "$name" echo "WantedBy=default.target" >> /usr/lib/systemd/user/redshift.service
systemctl --user daemon-reload
systemctl --user enable redshift.service

# update fonts
#fc-cache

# correct permissions on gnupg
#find ~/.gnupg -type f -exec chmod 600 {} \;
#find ~/.gnupg -type d -exec chmod 700 {} \;

# set up pix and screenshots location
mkdir -p "/home/$name/dox/pix/screenshots"

# set up email
