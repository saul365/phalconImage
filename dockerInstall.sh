apt-get update
apt-get install -y vim apache2 php7.2 php7.2-mysql php-dev curl composer php-mbstring php-zip php-curl libpcre3-dev
cd
git clone https://github.com/jbboehr/php-psr.git
cd php-psr
phpize
./configure
make
make test
make install
echo extension=psr.so | tee -a /etc/php/7.2/apache2/php.ini
echo extension=psr.so | tee -a /etc/php/7.2/cli/php.ini
curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | bash
apt-get update
apt-get install php7.2-phalcon
cd
git clone https://github.com/phalcon/phalcon-devtools.git
cd phalcon-devtools
ln -s $(pwd)/phalcon /usr/bin/phalcon
chmod ugo+x /usr/bin/phalcon
composer install
cd
git clone https://github.com/saul365/voltDirectory
cd voltDirectory
