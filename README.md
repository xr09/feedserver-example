# Feed Server example

This repository provides an example of setting up a feedserver to provide vulnerability feeds for [Wazuh](https://wazuh.com) on an internal network without direct internet access (most common case is through a proxy).

The Squid instance serves as a mocking proxy to test the service, in a real scenario probably there is already a proxy in your network.

### docker-compose.yml

Feeds are stored in the `vuln-feeds`.

```yaml
version: '3.7'

volumes:
  vuln-feeds:

services:
  proxy:
    image: sameersbn/squid:latest
    ports:
      - 3128:3128
    volumes:
      - ./squid/squid.conf:/etc/squid/squid.conf

  feedserver:
    image: xr09/feedserver:latest
    ports:
      - 80:80
    volumes:
      - vuln-feeds:/usr/share/nginx/html
    links:
      - proxy:proxy
    environment:
      - "http_proxy=http://proxy:3128"
      - "https_proxy=http://proxy:3128"
      - "RH_YEAR=1998"
      - "NVD_YEAR=2002"
      - "SLEEP_TIME=86400" # how often to re-download feeds (24 hours by default)
```

### Auth

If your proxy has authentication you can pass it like this: `"http_proxy=http://user:password@proxy:port"`

### How to use

For a complete guide on how to use this feature check the [offline update](https://documentation.wazuh.com/4.0/user-manual/capabilities/vulnerability-detection/offline_update.html) documentation.
