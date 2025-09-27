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
   - **Implementation:** [server-stats.sh](./server-stats.sh)  

2. [Log Archive Tool](https://roadmap.sh/projects/log-archive-tool)  
   - **Description:** A CLI tool to archive logs with date and time by compressing them into `.tar.gz` format.  
   - **Features:**  
     - Accepts log directory as an argument  
     - Compresses logs into a `tar.gz` file with timestamp  
     - Stores archives in `~/log_archives/`  
     - Logs archive actions to `archive.log`  
   - **Implementation:** [log-archive.sh](./log-archive/log-archive.sh)  

---

## Usage

Clone the repository:

```bash
git clone https://github.com/adityadwic/devops-project.git
cd devops-project
