# DevOps Projects

This repository contains various DevOps-related projects that I am building to practice and improve my skills.  
Each project is based on real-world scenarios and includes implementation details, scripts, and documentation.  

---

## Project List

1. [Server Performance Stats](https://roadmap.sh/projects/server-stats)  
   - **Description:** A Bash script to analyze basic server performance statistics.  
   - **Features:**  
     - Total CPU usage  
     - Total memory usage (Free vs Used including percentage)  
     - Total disk usage (Free vs Used including percentage)  
     - Top 5 processes by CPU usage  
     - Top 5 processes by memory usage  
     - *(Stretch goals: OS version, uptime, load average, logged in users, failed login attempts)*  
   - **Implementation:** [server-stats.sh](./01-server-performance-stats/server-stats.sh)  

2. [Log Archive Tool](https://roadmap.sh/projects/log-archive-tool)  
   - **Description:** A CLI tool to archive logs with date and time by compressing them into `.tar.gz` format.  
   - **Features:**  
     - Accepts log directory as an argument  
     - Compresses logs into a `tar.gz` file with timestamp  
     - Stores archives in `~/log_archives/`  
     - Logs archive actions to `archive.log`  
   - **Implementation:** [log-archive.sh](./02-log-archive-tool/log-archive.sh)  

3. [Nginx Log Analyser](https://roadmap.sh/projects/nginx-log-analyser)  
   - **Description:** A simple log analysis tool to parse Nginx access logs from the CLI.  
   - **Features:**  
     - Top 5 IP addresses with the most requests  
     - Top 5 most requested paths  
     - Top 5 response status codes  
     - Top 5 user agents  
   - **Implementation:** [nginx-log-analyser.sh](./03-nginx-log-analyser/nginx-log-analyser.sh)  

4. [GitHub Pages Deployment Workflow](https://roadmap.sh/projects/github-actions-deployment-workflow)  
   - **Description:** A GitHub Actions workflow to automatically deploy a static website to **GitHub Pages**.  
   - **Features:**  
     - Deploys only when files in `04-github-pages-deployment/` change  
     - Publishes the website to GitHub Pages  
     - Example output: `https://<username>.github.io/devops-project/`  
   - **Implementation:** [04-github-pages-deployment](./04-github-pages-deployment)  

5. [SSH Remote Server Setup](https://roadmap.sh/projects/ssh-remote-server-setup)  
   - **Description:** Setup a basic remote Linux server and configure it to allow SSH connections.  
   - **Features:**  
     - Create and configure a remote Linux server (DigitalOcean, AWS, etc.)  
     - Generate and add multiple SSH key pairs  
     - Connect using both SSH keys  
     - Configure `~/.ssh/config` for easier alias-based login  
     - *(Stretch goal: Install fail2ban to prevent brute-force attacks)*  
   - **Implementation:** [05-ssh-remote-server-setup](./05-ssh-remote-server-setup)  

---

## Usage

Clone the repository:

```bash
git clone https://github.com/adityadwic/devops-project.git
cd devops-project
