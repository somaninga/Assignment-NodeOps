resource "helm_release" "evm_node" {
  name       = "nodeops-evm-node"
  namespace  = "nodeops-evm-node-demo"
  repository = "https://ethereum.github.io/helm-charts"
  chart      = "geth"  # Ethereum Go client Helm chart

  values = [
    file("modules/evm-node/values.yaml")
  ]

  set {
    name  = "ethereum.network"
    value = "mainnet"  # Change this to "rinkeby" or "ropsten" for testnets
  }

  set {
    name  = "ethereum.verbosity"
    value = "3"  # Adjust logging verbosity as needed
  }

  set {
    name  = "p2p.port"
    value = "30303"  # Port for P2P network
  }

  set {
    name  = "rpc.port"
    value = "8545"  # RPC port for Ethereum
  }

  set {
    name  = "rpc.enabled"
    value = "true"  # Enable RPC
  }

  set {
    name  = "rpc.corsOrigins"
    value = "*"
  }
}
