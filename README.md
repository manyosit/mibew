# mibew
Mibew Messenger LiveChat


Sample docker-compose.yml


 version: '2'
 
 services:
  web:
    image: mibew
    restart: always
    
  db:
    image: mariadb
    restart: always
    environment:
      - MYSQL_USER=mibew
      - MYSQL_PASSWORD=mibew
      - MYSQL_DATABASE=mibew
      - MYSQL_RANDOM_ROOT_PASSWORD=yes
    volumes:
      - ./db:/var/lib/mysql
