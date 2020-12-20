termux-setup-storage
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
sed -i 's@^\(deb.*games stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable@' $PREFIX/etc/apt/sources.list.d/game.list
sed -i 's@^\(deb.*science stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable@' $PREFIX/etc/apt/sources.list.d/science.list
apt update && apt upgrade -y
pkg install proot -y
pkg install mariadb -y
pkg install nginx -y
pkg install php-fpm -y
pkg install php -y
nohup mysqld &
mysql -u $(whoami) -e "  
use mysql;
set password for 'root'@'localhost'  = password('123456');
grant all on *.* to root@'%' identified by '123456' with grant option;
flush privileges;
quit"



