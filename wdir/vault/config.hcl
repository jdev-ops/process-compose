
// chmod 600 config.hcl
// https://developer.hashicorp.com/vault/docs/configuration

ui            = true
cluster_addr  = "https://127.0.0.1:8201"
api_addr      = "https://127.0.0.1:8200"
disable_mlock = true

storage "raft" {
  path = "./data"
  node_id = "raft_node_id"
  tls_disable = 1 # here I turn off the TLS
}

listener "tcp" {
  tls_disable = 1 # here I turn off the TLS
  # If bound to localhost, the Vault GUI is only
  # accessible from the local machine!
  # address = "127.0.0.1:8200"
   address = "127.0.0.1:8300"
   cluster_address = "127.0.0.1:8301"
}

// listener "tcp" {
//   address       = "127.0.0.1:8200"
//   tls_cert_file = "/path/to/full-chain.pem"
//   tls_key_file  = "/path/to/private-key.pem"
// }

// telemetry {
//   statsite_address = "127.0.0.1:18125"
//   disable_hostname = true
// }
