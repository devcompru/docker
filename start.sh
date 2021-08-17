#!/bin/bash

#echo "Добавление конфигурации NGINX"
#rm -rf /etc/nginx/conf.d/market.unicso.ru.conf || true
#ln -s /home/market.unicso.ru/market.unicso.ru.conf /etc/nginx/conf.d/market.unicso.ru.conf
#sleep 2
#echo "Перегрузка nginx"
#service nginx reload
#sleep 2
clear
echo "Инициализация скрипта"
sleep 2

echo "Остановка контейнеров"
docker-compose  down
sleep 3


echo "Создание каталогов"
mkdir ../app && mkdir ../app/database
sleep 2


echo "Создание каталога для файлов files"
mkdir ../app/files
sleep 2

echo "Установка прав на files"
chown -R www-data:www-data ../app/files/
sleep 2

echo "Смена каталога на app"
cd ../app
sleep 2

#echo "Клонирование репозитория клиента"
#git clone -b 1.5.2 https://github.com/unicso/client.git
#sleep 2

echo "Смена каталога на корневой"
cd ../docker
sleep 2

echo "Копирование файла конфигурации nginx"
ln -sfn /home/test/devcomp/docker/dev.devcomp.ru.conf /etc/nginx/conf.d/dev.devcomp.ru.conf
sleep 3


echo "Перезагрузка nginx"
service nginx reload
sleep 5


echo "Старт контейнеров"
docker-compose  up --build -d

# docker-compose -f src/docker-compose.yml up --build --scale nuxt=1