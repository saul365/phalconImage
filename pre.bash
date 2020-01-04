apt-get update
apt-get install -y vim less gcc tree make libapr1-dev libaprutil1-dev libpcre3-dev libxml2-dev autoconf git curl  libcurl4-openssl-dev pkg-config libssl-dev re2c wget
cd
tar -xzf httpd-2.4.41.tar.gz
tar -xzf php-7.2.26.tar.gz
cd httpd-2.4.41
./configure --enable-so CFLAGS="-O3"
make
make install
cd ../php-7.2.26
./configure --with-apxs2=/usr/local/apache2/bin/apxs --with-pdo-mysql --with-openssl --with-zlib --enable-mbstring --with-curl --enable-zip
make
make install
cp php.ini-development /usr/local/lib/php.ini
cd
git clone https://github.com/jbboehr/php-psr.git
cd php-psr
phpize
./configure
make
make install
cd
echo extension=psr.so | tee -a /usr/local/lib/php.ini
cat php.txt |tee -a /usr/local/apache2/conf/httpd.conf
mv info.php /usr/local/apache2/htdocs/
wget https://github.com/phalcon/zephir/releases/download/0.12.15/zephir.phar
chmod +x zephir.phar
mv zephir.phar /usr/local/sbin/zephir
cd
git clone git://github.com/phalcon/php-zephir-parser.git
cd php-zephir-parser
phpize
./configure
make
make install 
echo extension=zephir_parser.so | tee -a /usr/local/lib/php.ini
cd
git clone https://github.com/phalcon/cphalcon
cd cphalcon/
git checkout tags/v4.0.0 ./
zephir fullclean
zephir compile
cd ext
phpize
./configure
make && make install
echo extension=phalcon.so | tee -a /usr/local/lib/php.ini
cd
git clone https://github.com/phalcon/phalcon-devtools.git
cd phalcon-devtools
ln -s $(pwd)/phalcon /usr/bin/phalcon
chmod ugo+x /usr/bin/phalcon
curl -s http://getcomposer.org/installer | php
php composer.phar install
/usr/local/apache2/bin/apachectl start
