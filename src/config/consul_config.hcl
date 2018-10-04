consul {
  retry {
    attempts = 5
    backoff = "100ms"
  }
}

template {
  source = "templates/destination_rules.ctmpl"
  destination = "output/destination_rules.yaml"
  command = "./apply-changes.sh output/destination_rules.yaml"
}

template {
  source = "templates/kubeconfig.ctmpl"
  destination = "output/kubeconfig"
}

template {
  source = "templates/virtual_services.ctmpl"
  destination = "output/virtual_services.yaml"
  command = "./apply-changes.sh output/virtual_services.yaml"
}