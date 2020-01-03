apt-get update
apt-get install vim apache2 php7.2 php7.2-mysql php-dev curl composer php-mbstring php-zip
cd
git clone https://github.com/jbboehr/php-psr.git
cd php-psr
phpize
./configure
make
make test
make install
apt-get install libpcre3-dev
curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | bash
apt-get update
apt-get install php7.2-phalcon
cd
git clone https://github.com/saul365/voltDirectory
cd voltDirectory
composer require phalcon/devtools
composer install
