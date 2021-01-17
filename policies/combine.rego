package main

deny[msg] {
  input[_].contents.kind == "Deployment"
  deployment := input[_].contents

  not service_selects_app(deployment.spec.selector.matchLabels.app)

  msg := sprintf("Deployment %v has selector %v that does not match any Services", [deployment.metadata.name, deployment.spec.selector.matchLabels.app])
}

service_selects_app(app) {
  input[_].contents.kind == "Service"
  input[_].contents.spec.selector.app == app
}