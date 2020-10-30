sudo dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y --skip-broken
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm --allowerasing -y
sudo dnf module reset php:7.2 -y
sudo dnf module enable php:remi-7.4 -y
sudo dnf install php php-cli php-common -y
php -v
