# Infrastructure Setup (Linux, PostgreSQL, pgAdmin)

[![Linux](https://img.shields.io/badge/OS-Linux-yellow?logo=linux&style=flat-square)](https://ubuntu.com/)
[![Docker](https://img.shields.io/badge/Container-Docker-blue?logo=docker&style=flat-square)](https://www.docker.com/)
[![Docker Compose](https://img.shields.io/badge/Orchestration-Docker--Compose-2496ED?logo=docker&style=flat-square)](https://docs.docker.com/compose/)
[![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-4169E1?logo=postgresql&style=flat-square)](https://www.postgresql.org/)
[![pgAdmin](https://img.shields.io/badge/Tool-pgAdmin-orange?style=flat-square)](https://www.pgadmin.org/)
[![Bash](https://img.shields.io/badge/Scripting-Bash-blue?logo=gnu-bash&style=flat-square)](https://www.gnu.org/software/bash/)
[![SSH](https://img.shields.io/badge/Access-SSH-lightgrey?logo=openssh&style=flat-square)](https://www.openssh.com/)

## Overview
This project demonstrates the deployment of PostgreSQL and pgAdmin on a VPS/VDS using Docker Compose. The goal was to automate the installation and configuration process, ensuring a streamlined and efficient setup. The work was carried out according to the planned schedule and successfully completed.

## Features
- **Automated PostgreSQL & pgAdmin installation** via Docker Compose.
- **Infrastructure setup and configuration** for database management.
- **Secure and customizable** deployment.
- **Designed for Ubuntu 22.04** 

## Installation Guide
### Step 1: Connect to Your VPS
```sh
ssh root@your_server_ip
```

### Step 2: Run the Setup Script
```sh
wget -O ./postgres_setup_ubuntu.sh https://raw.githubusercontent.com/admin404nextfloor/SQL/master/postgres_setup_ubuntu.sh \
&& chmod +x postgres_setup_ubuntu.sh \
&& ./postgres_setup_ubuntu.sh
```
This script will:
- Update system packages
- Install Docker & Docker Compose
- Copy `docker-compose.yml`
- Set up PostgreSQL and pgAdmin
- Launch the containers

### Step 3: Access Your Services
- **PgAdmin**: `http://your_server_ip:5050`
- **PostgreSQL**: `your_server_ip:5432`

## Default Credentials
| Service  | Username | Password  |
|----------|----------|------------|
| PostgreSQL | postgres  | changeme |
| PgAdmin | pgadmin4@pgadmin.org | admin |

## How to Connect to PostgreSQL in PgAdmin
1. Open PgAdmin (`http://your_server_ip:5050`)
2. Create a new server with:
   - **Host**: `your_server_ip`
   - **Port**: `5432`
   - **Username**: `postgres`
   - **Password**: `changeme`

## Release Notes
### v1.0 (February 2025)
- **Initial Release** 🎉
- Fully automated PostgreSQL and pgAdmin setup via Docker Compose
- Tested on Ubuntu 22.04
- Simplified user experience with preconfigured credentials


---
This project serves as a reference for setting up and automating database infrastructure on a VPS using Docker! 🚀


