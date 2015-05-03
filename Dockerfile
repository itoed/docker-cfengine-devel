FROM itoed/fedora:21
MAINTAINER Eduardo Ito <itoed@yahoo.com>

RUN rpm --import http://cfengine.com/pub/gpg.key
ADD cfengine-community.repo /etc/yum.repos.d/

# Yum packages
# Packages make and automake are required to build masterfiles
# Package openssh-clients is required for ssh-agent
RUN yum install -y cfengine-community git make automake openssh-clients ; \
    yum clean all

RUN mkdir /root/.ssh ; chmod 700 /root/.ssh
ADD known_hosts /root/.ssh/
