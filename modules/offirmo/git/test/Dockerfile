# …
FROM ubuntu:14.04
MAINTAINER Offirmo <offirmo.net@gmail.com>

RUN echo "Hello from dockerized machine !"

RUN mkdir -p /root/simpli/test
RUN touch /root/hello.v1

COPY * /root/
#COPY tmp/simpli /root/simpli
#COPY run_me_to_install_git_apt_on_current_machine.sh /root

#RUN /root/simpli/test/run_me_to_install_git_apt_on_current_machine.sh
#RUN apt-get update && apt-get upgrade

