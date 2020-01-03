apt-get update
apt-get install -y vim less gcc tree make libapr1-dev libaprutil1-dev libpcre3-dev libxml2-dev autoconf git curl  libcurl4-openssl-dev pkg-config
cd
tar -xzf httpd-2.4.41.tar.gz
tar -xzf php-7.2.26.tar.gz
cd httpd-2.4.41
./configure --enable-so CFLAGS="-O3"
make
make install
cd ../php-7.2.26
./configure --with-apxs2=/usr/local/apache2/bin/apxs --with-mysql --with-openssl
make
make install
cd
git clone https://github.com/jbboehr/php-psr.git
cd php-psr
phpize
./configure
make
make install
echo extension=psr.so | tee -a /usr/local/lib/php.ini
cat php.txt |tee -a /usr/local/apache2/conf/httpd.conf
mv info.php /usr/local/apache2/htdocs/
cd
git clone https://github.com/saul365/voltDirectory
