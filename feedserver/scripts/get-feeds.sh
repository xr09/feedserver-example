#!/bin/bash
set -e

RH_YEAR=${RH_YEAR:-1999}
NVD_YEAR=${NVD_YEAR:-2002}
SLEEP_TIME=${SLEEP_TIME:-86400}

while :
do
    echo "Downloading Debian & Ubuntu feeds"
    /scripts/feeds-generator.sh /usr/share/nginx/html/

    echo "Downloading Red Hat feeds"
    /scripts/rh-generator.sh $RH_YEAR /usr/share/nginx/html/

    echo "Downloading NVD feeds"
    /scripts/nvd-generator.sh $NVD_YEAR /usr/share/nginx/html/

    sleep $SLEEP_TIME
done

