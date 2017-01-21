FROM ubuntu:14.04
MAINTAINER Irek Fasikhov <malmyzh@gmail.com>
ENV http_proxy="http://10.43.5.170:3128"
ENV https_proxy="http://10.43.5.170:3128"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install ansible python-apt -y
ADD ansible /ansible
RUN cd /ansible && ansible-playbook ./main.yml -i ./hosts -v
CMD ["mysqld"]
