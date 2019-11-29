# Dante Sock5 PureVPN with random exit point
#
# Required environment variables:
#  - purevpn_username
#  - purevpn_password
#
# Usage example:
# docker run --privileged -ti -e purevpn_username='' -e purevpn_password='' qya/vpnoxy-ubuntu-container:latest

FROM ubuntu:18.04
MAINTAINER Fais <qya[@]vivaldi.net>

EXPOSE 8112 1080
RUN apt-get update \
 && apt-get install -y wget iproute2 net-tools iputils-ping expect \
 && apt-get install -y --no-install-recommends expect \
 && apt-get install dante-server

# Download and install PureVPN
RUN wget -O purevpn_amd64.deb 'https://s3.amazonaws.com/purevpn-dialer-assets/linux/app/purevpn_amd64.deb?utm_source=Linux%20App&utm_medium=Downloads%20Tracking&utm_campaign=Linux%20App%2064%20Bit%20Beta%20Download%20Tracking' \
 && dpkg -i purevpn_amd64.deb

ADD entrypoint.sh /entrypoint.sh

ADD danted.conf /etc/
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]