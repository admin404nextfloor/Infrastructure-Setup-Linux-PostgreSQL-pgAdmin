#!/bin/bash

echo
# === Инструкция Install Docker: https://docs.docker.com/engine/install/ubuntu/ ===
echo "=== Установка Docker, Docker-compose ==="
echo
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get -y install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#==========================
echo
sudo usermod -aG docker $your_user
echo "=== Пользователь '$your_user' в группе 'docker' ==="
#==========================
echo
echo "=== Версия Docker: ==="
docker -v
echo
echo "=== Версия Docker compose: ==="
docker compose version
#==========================
echo
echo "=== Копирование 'docker-compose.yml' ==="
mkdir -p /home/$your_user/PostgreSQL_VPS
wget -O /home/$your_user/PostgreSQL_VPS/docker-compose.yml https://raw.githubusercontent.com/admin404nextfloor/SQL/main/docker-compose.yml
wget -O /home/$your_user/PostgreSQL_VPS/.env_example https://raw.githubusercontent.com/admin404nextfloor/SQL/main/.env_example

#==========================
echo
echo "=== Формирование переменных окружения ==="
touch /home/$your_user/PostgreSQL_VPS/.env

echo 
read -p "=== Задать имя пользователя БД [postgres]: " POSTGRES_USER
if [ -z $POSTGRES_USER ]
then
    POSTGRES_USER="postgres"
fi

echo 
read -p "=== Задать пароль для БД [changeme]: " POSTGRES_PASSWORD
if [ -z $POSTGRES_PASSWORD ]
then
    POSTGRES_PASSWORD="changeme"
fi

echo "POSTGRES_USER=$POSTGRES_USER" > /home/$your_user/PostgreSQL_VPS/.env
echo "POSTGRES_PASSWORD=$POSTGRES_PASSWORD" >> /home/$your_user/PostgreSQL_VPS/.env
echo "POSTGRES_PORT=5432" >> /home/$your_user/PostgreSQL_VPS/.env
echo "ADMINER_PORT=8080" >> /home/$your_user/PostgreSQL_VPS/.env
echo "PGADMIN_PORT=5050" >> /home/$your_user/PostgreSQL_VPS/.env

chmod 600 /home/$your_user/PostgreSQL_VPS/.env
chown -R $your_user:$your_user /home/$your_user/PostgreSQL_VPS

#==========================
# === Инструкция Postgresql & PgAdmin powered by compose: https://github.com/khezen/compose-postgres ===
echo
echo "=== Установка и запуск контейнеров: postgres, pgadmin, adminer ==="
sudo -u $your_user bash -c "cd /home/$your_user/PostgreSQL_VPS && docker compose up -d"
#==========================
echo
echo "=== Установка ЗАВЕРШЕНА! ==="
echo "=== Запущенные контейнеры: ==="
docker ps -a

ip_addr=`wget -q -4 -O- http://127.0.0.1`
echo
echo "=============================================================="
echo "===    PgAdmin по адресу: http://$ip_addr:5050      "
echo "===      Add a new server in PgAdmin:                   "
echo "=== Host name/address: $ip_addr                        "
echo "=== Port as 'POSTGRES_PORT', by default: '5432'            "
echo "=== Username as 'POSTGRES_USER' ['postgres' ]: $POSTGRES_USER    "
echo "=== Password as 'POSTGRES_PASSWORD' ['changeme']: $POSTGRES_PASSWORD "
echo "=============================================================="
echo "===    Adminer по адресу: http://$ip_addr:8080      "
echo "=== System: 'PostgreSQL'                                   "
echo "=== Server: $ip_addr                                   "
echo "=== Username as 'POSTGRES_USER' ['postgres' ]: $POSTGRES_USER    "
echo "=== Password as 'POSTGRES_PASSWORD' ['changeme']: $POSTGRES_PASSWORD "
echo "=== Database: 'postgres' или пусто                         "
echo "=============================================================="
echo
echo "======================================================="
echo "===    Для смены настроек перейдите в папку:        ==="
echo "===     cd  /home/$your_user/PostgreSQL_VPS/             ==="
echo "=== Остановите все контейнеры (БД удалятся!):       ==="
echo "===      $ docker compose down --volumes            ==="
echo "=== Отредактируйте файл: .env                       ==="
echo "=== Запустите контейнеры: $ docker compose up -d    ==="
echo "======================================================="
echo
echo "=== Вход под пользователем '$your_user' ==="
cd /home/$your_user && su $your_user

#===========================
# Остановка:
#    docker-compose down 
# или так для удаления томов (БД почистятся):
#    docker-compose down --volumes
#------------------
# Почистить volumes:
#    docker volume prune
#===========================
