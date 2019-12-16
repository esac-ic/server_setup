#run this command when starting the server, this ensures the correct versions are being used

#define colors
GREEN='\033[0;32m'
NC='\033[0m'
RED='\033[0;31m'
PURPLE='\033[0;35m'

NGINX_VERSION=$(cat versions/nginx)
ESAC_VERSION=$(cat versions/website)

echo $(date) 'start command ran, using versions website:'$ESAC_VERSION 'nginx:'$NGINX_VERSION >> 'update_log.txt'

#export to environment variables
export ESAC_VERSION=$ESAC_VERSION
export NGINX_VERSION=$NGINX_VERSION

docker-compose up -d


echo -e $GREEN'done updating the server'$NC