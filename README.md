# mibew
Mibew Messenger LiveChat
Thanks to: https://mibew.org/


Sample docker-compose.yml for use together with mariadb. If you want to use your own db you need to change the config.yml in /var/www/html/configs.

    version: '2'

    services:
      web:
        image: manyos/mibew
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
