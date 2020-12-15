package main

deny[msg] {
  input.kind == "DeploymentConfig"

  not input.spec.template.spec.containers[0].imagePullPolicy == "IfNot"

  msg := "Use imagePullPolicy IfNotPresent"
}

deny[msg] {
  input.kind == "DeploymentConfig"
  
  not input.spec.selector.app

  msg := "Containers must provide app label for pod selectors"
}

warn[msg] {
  input.kind == "DeploymentConfig"
  
  not input.spec.selector.app

  msg := "Containers must provide app label for pod selectors"
}