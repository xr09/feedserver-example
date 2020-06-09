#!/bin/bash

# Wazuh script to generate a Vulnerability Detector's feed from the National Vulnerability Database
# Copyright (C) 2015-2020, Wazuh Inc.
# May 9, 2018.
#
# This program is a free software; you can redistribute it
# and/or modify it under the terms of the GNU General Public
# License (version 2) as published by the FSF - Free Software
# Foundation.

max_year=`date +"%Y"`
year=$1
last_year=0
directory=$2

if [ $# -ne 2 ]
then
    echo "Use: $0 <min_year> <dest_path>"
    exit 1
fi

if [ $year -le 2001 ]
then
    echo "The year must be greater than 2002"
fi

if [[ ! -d $directory ]]
then
    echo "Invalid destination path: '$directory'. It must be a directory."
    exit 1
fi


while [ true ]
do
    link="https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-$year.json.gz"
    file=$directory/nvd-feed$year.json

    if [ $last_year -ne $year ]
    then
        echo "Fetching $link"
    fi
    last_year=$year
    result=$(curl $link --output $file.gz --silent -w '%{http_code}')

    if [ $result -ne 200 ]
    then
        echo "Page download failed ($result), retrying..."
        rm -f $file.gz
        continue
    fi

    if [ $year -eq $max_year ]
    then
        break
    fi
    year=$[ $year + 1 ]
done

exit 0
