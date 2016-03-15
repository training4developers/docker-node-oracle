from training4developers/node:latest

MAINTAINER Eric Greene <eric@training4developers.com>

ENV NODE_VERSION 4.4.0
ENV NODE_ARCHIVE node-v$NODE_VERSION-linux-x64.tar.xz

# Update & Install Ubuntu Packages
RUN apt-get update && apt-get install -y \
		python \
		build-essential \
		checkinstall

# Adapted from https://github.com/wnameless/docker-oracle-xe-11g
# Thank you Wei-Ming Wu <wnameless@gmail.com>!
ADD assets /assets
RUN chmod u+x /assets/setup.sh; /assets/setup.sh
EXPOSE 1521
EXPOSE 8080
# End Adaptation

CMD bash -C '/usr/sbin/startup.sh';'bash' 
