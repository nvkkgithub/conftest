#  Conftest
Conftest is a utility to help you write tests against structured configuration data. 

For instance, you could write tests for your Kubernetes configurations, Tekton pipeline definitions, Terraform code, Serverless configs or any other structured data.


## Install
```
$ brew tap instrumenta/instrumenta
$ brew install conftest
```

## Usage
```
$ conftest input/deployment-config.yml --policy policies/deployment.rego

$ conftest test input/deployment-config.yaml --policy policies/deployment.rego -o table
+---------+------------------------------+-----------+--------------------------------+
| RESULT  |             FILE             | NAMESPACE |            MESSAGE             |
+---------+------------------------------+-----------+--------------------------------+
| success | input/deployment-config.yaml | main      | SUCCESS                        |
| success | input/deployment-config.yaml | main      | SUCCESS                        |
| failure | input/deployment-config.yaml | main      | Use imagePullPolicy            |
|         |                              |           | IfNotPresent                   |
+---------+------------------------------+-----------+--------------------------------+

```






#### References
- https://www.conftest.dev/