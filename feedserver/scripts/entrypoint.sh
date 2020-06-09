#!/bin/bash
set -e


/usr/sbin/nginx &

/scripts/get-feeds.sh &

wait %1 %2
