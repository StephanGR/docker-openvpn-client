FROM ubuntu
MAINTAINER cl3m3nt

# Update packages and install packages
RUN apt-get update \
    && apt-get install -y openvpn curl zip unzip jq python3

RUN curl -Lo /bin/speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest_cli.py && chmod +x /bin/speedtest-cli

# Add configuration and scripts
ADD config/purevpn /etc/openvpn/
ADD run.sh bot.sh /etc/openvpn/

WORKDIR /etc/openvpn
CMD ["bash", "/etc/openvpn/run.sh"]
