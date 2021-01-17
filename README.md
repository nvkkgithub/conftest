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
$ conftest test input/deployment-config.yml --policy policies/deployment.rego

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

* Combine different options into 'input'

```
$ conftest test input/manifest-resources.yaml --policy policies/combine.rego --combine
FAIL - Combined - main - Deployment hello-kubernetes has selector hello-kubernetes that does not match any Services

1 test, 0 passed, 0 warnings, 1 failure, 0 exceptions
```


* Testing Dockerfile
```
$ conftest test input/Dockerfile --policy policies/docker -o table
```





#### References
- https://www.conftest.dev/