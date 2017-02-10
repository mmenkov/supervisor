FROM ubuntu:14.04

MAINTAINER Maxim Menkov <mmenkov@digital-mind.ru>

ENV DEBIAN_FRONTEND noninteractive

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  locale-gen en_US.UTF-8
RUN apt-get install -y curl git htop man software-properties-common unzip vim wget

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV HOME /root

RUN apt-get -y install supervisor && \
  mkdir -p /var/log/supervisor && \
  mkdir -p /etc/supervisor/conf.d

COPY supervisord.conf /etc/supervisor/
COPY supervisor_entry.sh

RUN chmod +x /supervisor_entry.sh
RUN apt-get clean && rm -rf /var/lib/apt/list/* /tmp/* /var/tmp/*

CMD /supervisor_entry.sh
