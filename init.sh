NAME="jaxservice"
DOMAIN="jaxservice.online"
USER_EMAIL="jennearpinas@gmail.com"
USER_PASSWORD="kjljsld89"
ROOT_PASSWORD="2O78idiQx"
DOMAINS="jaxservice"
PORT=8500
cd /root
apt update
apt upgrade
apt install -y git docker.io curl wget openssl apt-transport-https
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
git clone https://github.com/Jennear/network
cd network
chmod +x wordpress.sh
wordpress $DOMAINS $USER_EMAIL $USER_PASSWORD $ROOT_PASSWORD $PORT
echo NAME="${NAME}" >> .env
echo DOMAIN="${DOMAIN}" >> .env
echo ROOT=/network >> .env
echo USER_EMAIL="${USER_EMAIL}" >> .env
echo USER_NAME=admin >> .env
echo USER_PASSWORD="${USER_PASSWORD}" >> .env
echo ROOT_PASSWORD="${ROOT_PASSWORD}" >> .env
docker-compose \
-f docker-compose.yml \
-f docker-compose.wordpress.yml \
-f docker-compose.mail.yml \
-f docker-compose.mautic.yml \
up -d
