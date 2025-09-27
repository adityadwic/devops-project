# Static Site Server

Project URL: [https://roadmap.sh/projects/static-site-server](https://roadmap.sh/projects/static-site-server)

---

## Overview
This project focuses on setting up a basic Linux server and configuring it to serve a static website using **Nginx**.  
You will also practice deploying updates with **rsync**.

---

## Steps

### 1. Provision a Remote Linux Server
- Created a new Linux server using DigitalOcean (alternatives: AWS, GCP, etc.).  
- Retrieved the server's public IP address.  
- Connected via SSH:  

```bash
ssh user@server-ip
````

---

### 2. Install and Configure Nginx

Update packages and install **nginx**:

```bash
sudo apt update
sudo apt install nginx -y
```

Verify Nginx is running:

```bash
systemctl status nginx
```

Nginx default site is served at:

```
http://<server-ip>/
```

---

### 3. Prepare a Static Website

Locally, created a simple static website inside `site/`:

```html
<!-- site/index.html -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Static Site</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h1>Hello from my Static Site!</h1>
  <img src="image.png" alt="Example">
</body>
</html>
```

Example `style.css`:

```css
body {
  font-family: Arial, sans-serif;
  text-align: center;
  margin-top: 50px;
}
```

---

### 4. Deploy Static Site with Rsync

On local machine, used `rsync` to copy site files to server:

```bash
rsync -avz ./site/ user@server-ip:/var/www/html/
```

Now visiting `http://<server-ip>/` shows the custom static site.

---

### 5. Automate Deployment with Script

Created `deploy.sh`:

```bash
#!/bin/bash
# deploy.sh - Sync local static site to remote server

REMOTE_USER="user"
REMOTE_HOST="server-ip"
REMOTE_PATH="/var/www/html"

rsync -avz --delete ./site/ ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}
echo "✅ Deployment completed! Visit http://${REMOTE_HOST}/"
```

Make it executable:

```bash
chmod +x deploy.sh
```

Now deployment is as simple as:

```bash
./deploy.sh
```

---

### 6. Optional: Domain Setup

If a domain name is available:

* Updated DNS records → pointed `A` record to server IP.
* Configured Nginx to serve static site from `/etc/nginx/sites-available/yourdomain.com`.

---

## Outcome

✅ Nginx installed and serving static website
✅ Static site deployed via `rsync`
✅ Deployment automated with `deploy.sh`
✅ Optional domain configuration completed

---

```

---

Mau saya bikinkan sekalian contoh isi folder `site/` (minimal `index.html`, `style.css`, dan 1 dummy `image.png`) biar kamu bisa langsung coba end-to-end?
```
