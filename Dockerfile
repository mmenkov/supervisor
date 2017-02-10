FROM debian:jessie

MAINTAINER Maxim Menkov <mmenkov@digital-mind.ru>

RUN \
  apt-get update && apt-get -y install supervisor && \
  mkdir -p /var/log/supervisor && \
  mkdir -p /etc/supervisor/conf.d

COPY supervisord.conf /etc/supervisor/
COPY supervisor_entry.sh /

RUN chmod +x /supervisor_entry.sh
RUN apt-get clean && rm -rf /var/lib/apt/list/* /tmp/* /var/tmp/*

CMD /supervisor_entry.sh
