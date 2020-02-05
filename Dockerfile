FROM centos:7
ENV VAULT_VERSION=1.3.2
#COPY local-repos.repo /etc/yum.repos.d/
ARG DIRLIST="/root /go /opt/vault_${VAULT_VERSION} /etc/vault/ /home/vault /vault/config/ "
RUN yum -y update
RUN yum -y install epel-release 
RUN yum -y install openssl jq wget git unzip && yum clean all && rm -rf /var/cache/yum && yum clean all && \
    mkdir -p ${DIRLIST}  && \ 
    chgrp -Rf root ${DIRLIST} && chmod -Rf g+w  ${DIRLIST} 
ENV GOPATH /go
ENV PATH $PATH:/go/bin 

RUN cd /root/ && wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    cd /opt/vault_${VAULT_VERSION} && \
    unzip /root/vault_${VAULT_VERSION}_linux_amd64.zip 

EXPOSE 8200
ADD *.hcl /etc/vault/
ADD entrypoint.sh /tmp/
RUN chmod 550 /tmp/entrypoint.sh && touch /.vault-token && chgrp root /.vault-token && chmod -Rf g+w /.vault-token
#USER root
ENTRYPOINT /tmp/entrypoint.sh
WORKDIR /tmp/
