#!bin/bash
clear
read -p "Prefijo de las tablas (sin _ ): " PREFIJO
echo "PREFIJO=${PREFIJO}_" >> .env
read -t 1 -p "Listos..." timeout
echo ""
NOMBRE_PROYECTO=${PWD##*/}
read -t 1 -p "Obteniendo nombre del proyecto..." timeout
echo ""
echo "NOMBRE_PROYECTO=$NOMBRE_PROYECTO" >> .env
echo "DB=${NOMBRE_PROYECTO}_db" >> .env
echo "WORDPRESS=${NOMBRE_PROYECTO}_wordpress" >> .env
echo "WEBSERVER=${NOMBRE_PROYECTO}_webserver" >> .env
read -t 1 -p "Preparando configuración..." timeout
echo ""
mkdir nginx-conf
touch ./nginx-conf/nginx.conf
sed "s/?????/$NOMBRE_PROYECTO/g" nginx_default.conf>>./nginx-conf/nginx.conf
echo ""
read -t 10 -p "Iniciando..." timeout
docker-compose up --build
