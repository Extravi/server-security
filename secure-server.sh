sudo dpkg-reconfigure --priority=low unattended-upgrades
printf '%s\n' y -1 y n n y | google-authenticator
cd /etc/pam.d/ && sudo wget -O sshd https://raw.githubusercontent.com/Extravi/server-security/main/sshd
cd /etc/ssh/ && sudo wget -O sshd_config https://raw.githubusercontent.com/Extravi/server-security/main/sshd_config
sudo systemctl restart sshd
echo "y" | sudo ufw reset
cd /etc/ufw/ && sudo wget -O before.rules https://raw.githubusercontent.com/Extravi/server-security/main/before.rules
cd /etc/ufw/ && sudo wget -O before6.rules https://raw.githubusercontent.com/Extravi/server-security/main/before6.rules
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw limit 717/tcp
echo "y" | sudo ufw enable
printf "Setup is complete :)\nTo ssh into the server, scan the QR code above and add it to your Authenticator app. You should also make a backup of your emergency scratch codes.\n"
