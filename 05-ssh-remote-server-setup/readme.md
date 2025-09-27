# SSH Remote Server Setup

Project URL: [https://roadmap.sh/projects/ssh-remote-server-setup](https://roadmap.sh/projects/ssh-remote-server-setup)

## Overview

This project focuses on setting up a basic remote Linux server and configuring it to allow SSH connections.
The main goal is to understand how to manage SSH access securely using key pairs.

## Steps

### 1. Provision a Remote Linux Server

* Created a new Linux server using DigitalOcean (you can also use AWS, GCP, etc.).
* Retrieved the server's public IP address.

### 2. Generate SSH Keys

* Generated two SSH key pairs locally:

```bash
ssh-keygen -t rsa -b 4096 -C "key1" -f ~/.ssh/id_rsa_key1
ssh-keygen -t rsa -b 4096 -C "key2" -f ~/.ssh/id_rsa_key2
```

* This creates `id_rsa_key1` & `id_rsa_key1.pub` and `id_rsa_key2` & `id_rsa_key2.pub`.

### 3. Add Public Keys to Server

* Connected to server using initial root credentials.
* Created `~/.ssh/authorized_keys` file and added both public keys:

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cat ~/id_rsa_key1.pub >> ~/.ssh/authorized_keys
cat ~/id_rsa_key2.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

### 4. Connect Using SSH Keys

Now able to connect using either key:

```bash
ssh -i ~/.ssh/id_rsa_key1 user@server-ip
ssh -i ~/.ssh/id_rsa_key2 user@server-ip
```

### 5. Configure SSH Alias

Configured `~/.ssh/config` for easier access:

```text
Host myserver-key1
    HostName <server-ip>
    User <username>
    IdentityFile ~/.ssh/id_rsa_key1

Host myserver-key2
    HostName <server-ip>
    User <username>
    IdentityFile ~/.ssh/id_rsa_key2
```

Now I can connect with:

```bash
ssh myserver-key1
ssh myserver-key2
```

### 6. Stretch Goal – Install Fail2ban

Installed `fail2ban` to protect against brute force attacks:

```bash
sudo apt update
sudo apt install fail2ban -y
```

Enabled and verified the service:

```bash
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
sudo systemctl status fail2ban
```

## Outcome

✅ Able to connect to the server using both SSH keys.
✅ Configured SSH alias for simpler login.
✅ Installed fail2ban for better security.

---
