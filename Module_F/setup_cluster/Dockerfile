FROM alpine
ARG ssh_pub_key
ARG ssh_prv_key

# Authorize SSH Host
RUN mkdir -p /$(whoami)/.ssh

# Add the keys and set permissions
RUN echo "$ssh_pub_key" > /$(whoami)/.ssh/authorized_keys
RUN chmod 700 /$(whoami)/.ssh
RUN chmod 640 /$(whoami)/.ssh/authorized_keys

RUN apk add --no-cache openssh
RUN apk add --no-cache openssh-server

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config


RUN passwd -d root
RUN ssh-keygen -A

RUN echo "/usr/sbin/sshd" >> /tmp/start_sshd.sh
RUN chmod 777 /tmp/start_sshd.sh
RUN apk add ansible
RUN apk add python


RUN mkdir -p /opt/ansible/launchpad/
RUN mkdir -p /root/.ansible/

RUN echo "$ssh_prv_key" > /opt/ansible/launchpad/clusterkey

ENV ANSIBLE_HOST_KEY_CHECKING=False
ENV ANSIBLE_CONFIG=/$(whoami)/.ansible/ansible.cfg


ENTRYPOINT /tmp/start_sshd.sh; /bin/sh