consul {
  retry {
    attempts = 12
    backoff = "1000ms"
  }
}

template {
  source = "templates/destination_rules.ctmpl"
  destination = "output/destination_rules.yaml"
  command = "./apply-changes.sh output/destination_rules.yaml"
}

template {
  source = "templates/virtual_services-ingress.ctmpl"
  destination = "output/virtual_services-ingress.yaml"
  command = "./apply-changes.sh output/virtual_services-ingress.yaml"
}

template {
  source = "templates/virtual_services-mesh.ctmpl"
  destination = "output/virtual_services-mesh.yaml"
  command = "./apply-changes.sh output/virtual_services-mesh.yaml"
}
