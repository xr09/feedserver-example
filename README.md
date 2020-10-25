# Feed Server example

This repository provides an example of setting up a feedserver to provide vulnerability feeds for [Wazuh](https://wazuh.com) on an internal network without direct internet access (most common case is through a proxy).

The Squid instance serves as a mocking proxy to test the service, in a real scenario probably there is already a proxy in your network.


For a complete guide on how to use this feature check the [offline update](https://documentation.wazuh.com/4.0/user-manual/capabilities/vulnerability-detection/offline_update.html) documentation.
