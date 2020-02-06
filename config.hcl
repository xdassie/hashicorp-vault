ui = true
disable_mlock = true

storage "file" {
  path = "/vault/file"
}
listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 0
  tls_cert_file = "/tls/tls.crt"
  tls_key_file = "/tls/tls.key"
}
listener "tcp" {
  address     = "0.0.0.0:8202"
  tls_disable = 1
}
#telemetry {
#  statsite_address = "127.0.0.1:8125"
#  disable_hostname = true
#}
