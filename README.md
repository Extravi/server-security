# Shell script with configuration files for automating ssh hardening and other tasks 

Update package lists and install all updates:

```bash
apt update && apt upgrade -y
reboot
```

Install required packages:

```bash
apt install unattended-upgrades ufw libpam-google-authenticator
```

Create non-root user then set a password:

```bash
useradd -G sudo -m example -s /bin/bash
passwd example
```

In a new terminal, paste the public ssh key; you will be prompted for a password:

```bash
ssh-copy-id example@127.0.0.1
```

Download and run the script as the newly created user:

```bash
wget -O secure-server.sh https://raw.githubusercontent.com/Extravi/server-security/main/secure-server.sh
chmod +x secure-server.sh
./secure-server.sh
```


Once the script is finished, navigate to ~/.ssh/config and add the following lines below to your own system, not the server:

```bash
Host example
	User example
	Port 717
	IdentityFile ~/.ssh/id_rsa
	HostName 127.0.0.1
```

After you've added those lines, you can ssh into your server using:

```bash
ssh example
```
