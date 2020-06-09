#!/bin/bash
set -e

ubuntu_feeds=(
    "https://people.canonical.com/~ubuntu-security/oval/com.ubuntu.bionic.cve.oval.xml.bz2"
    "https://people.canonical.com/~ubuntu-security/oval/com.ubuntu.xenial.cve.oval.xml.bz2"
    "https://people.canonical.com/~ubuntu-security/oval/com.ubuntu.trusty.cve.oval.xml.bz2"
    )

debian_feeds=(
  "https://www.debian.org/security/oval/oval-definitions-buster.xml"
  "https://www.debian.org/security/oval/oval-definitions-stretch.xml"
  "https://www.debian.org/security/oval/oval-definitions-jessie.xml"
  "https://www.debian.org/security/oval/oval-definitions-wheezy.xml"
  )

# cd to output folder
cd $1

for feed in ${ubuntu_feeds[@]}; do
    curl -O $feed
done

for feed in ${debian_feeds[@]}; do
    curl -O $feed
done
