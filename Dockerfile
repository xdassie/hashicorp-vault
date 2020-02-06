FROM vault:1.3.2
COPY config.hcl /etc/vault/config.hcl
#ENTRYPOINT /bin/vault
CMD ["/bin/vault","server", "--config=/etc/vault/config.hcl"]
