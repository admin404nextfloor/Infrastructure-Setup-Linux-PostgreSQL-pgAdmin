# Infrastructure Setup (Linux, PostgreSQL, pgAdmin)

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
wget -O ./1_postgres.sh https://raw.githubusercontent.com/admin404nextfloor/SQL/master/1_postgres.sh \
&& chmod +x 1_postgres.sh \
&& ./1_postgres.sh
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


