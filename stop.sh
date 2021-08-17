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
docker-compose -f src/docker-compose.yml down
sleep 3


# docker-compose -f src/docker-compose.yml up --build --scale nuxt=1