Ohayo!

Приложение разработано только для Linux OS (кросс-платформенность в разработке...)

1. Скопировать репу с приложением к себе: git clone git@github.com:Dzivian/wordpress.git
2. Находясь в директории репозитория: docker-compose build wordpress
3. Находясь в директории репозитория: docker-compose up -d
4. Перейти по адресу/имени (server_name в nginx.conf, или указать localhost(если указываете своё доменное имя, то вписать IP server_name в файл /etc/hosts на хостовой машине))
5. Выполнить установку Wordpress
6. Находясь в директории репозитория: docker exec wordpress sh -c "sed -i '/<?php/a define(\"WP_REDIS_HOST\", \"redis\");' /var/www/html/wp-config.php"
7. Включить объектный кэш Redis в Wordpress

Готово!

Для подключения мониторинга:

1. 
2. 
3. 