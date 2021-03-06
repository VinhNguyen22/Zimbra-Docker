FROM ubuntu:18.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  wget \
  dialog \
#  openssh-client \
  software-properties-common \
#  dnsmasq \
#  dnsutils \
  net-tools \
  sudo \
  rsyslog \
  unzip
WORKDIR /opt/zimbra
VOLUME ["/opt/zimbra"]
EXPOSE 22 25 465 587 110 143 993 995 80 443 8080 8443 7071
COPY opt /opt/
COPY etc /etc/
RUN chmod +x /opt/install.sh
RUN /opt/install.sh
CMD ["/bin/bash", "/opt/start.sh", "-d"]
