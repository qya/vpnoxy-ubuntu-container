# Get random IP address and turn as SOCK5
This container connects to a random VPN endpoint to get different IP address using PureVPN and transmit Proxy as SOCK5.
Based on Ubuntu.

## Usage:
```
docker run --privileged -ti \
  -d -p 8112:8112 -p 1080:1080 \
  -e purevpn_username='' \
  -e purevpn_password='' \
  qya/vpnoxy-ubuntu-container:latest
```
* Valid PureVPN credentials required.