FROM vault:1.3.2
COPY config.hcl /etc/vault/config.hcl
ENTRYPOINT /bin/vault
CMD ["--config=/etc/vault/config.hcl "]
