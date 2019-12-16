#define colors
GREEN='\033[0;32m'
NC='\033[0m'
RED='\033[0;31m'
PURPLE='\033[0;35m'

#write command log
echo $(date) 'update command ran with input: website:'$ESAC_VERSION 'nginx:'$NGINX_VERSION >> 'update_log.txt'

#writes to a file
if [[ $1 == 'website' ]]
then
  ESAC_VERSION=$2
  NGINX_VERSION=$(cat versions/nginx)
elif [[ $1 == 'nginx' ]]
then
  ESAC_VERSION=$(cat versions/website)
  NGINX_VERSION=$2
else
  exit 1
fi


echo -e $PURPLE'Start of updating server, esac version: '$ESAC_VERSION' and nginx version:' $NGINX_VERSION $NC
#log to file
echo $(date) 'website:'$ESAC_VERSION 'nginx:'$NGINX_VERSION >> 'update_log.txt'

#update versions to file
echo $ESAC_VERSION > 'versions/website'
echo $NGINX_VERSION > 'versions/nginx'

#write to versions file exposed on the website
echo -e 'esac/website:'$ESAC_VERSION '\resac/nginx:'$NGINX_VERSION > 'storage/app/public/versions.txt'

#export to environment variables
export ESAC_VERSION=$ESAC_VERSION
export NGINX_VERSION=$NGINX_VERSION

#run docker compose with new values
docker-compose up -d

echo -e $GREEN'done updating the server'$NC
echo 'check always up to date versions on: https://beta.esac.nl/storage/versions.txt'

#record which version is being deployed when in a seperate file
#rerun docker compose command
#document that this is only for feature changes, database changes are not covered