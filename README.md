# Blue / Green K8S on critical environments

A simple way to make Blue/Green on K8S with high availability and instant rollback.

# Purpose

It is a hard road in some companyes convenc the bosses to change all the infrastructure and way to make things, and starting use containers and Kubernetes. Even when you do, it its always a fight to old and core workloads for this kind of architecture. One of the reasons its the deploy and fear because the rollback it is a new version with old code.

I worked on a project who have this same problems, and to solve I create a couple of simple shell and a pure logic on K8s to make:

 - Prod and Preprod URL 
 - Rollback instant without a new deploy
 - Prod isolate from new deployments without real tests on the production environment.
 
 *I know thats not a really nice thing, but, sometimes we need to adapt us the rules of the company to be able to innovate.*
 

## How to deploy
```
- Clone this repo;
- cd manifests; 
- kubectl apply -f .
```

## How to use
```
- cd scripts;
- chmod u+x bluegreen.sh
- /bin/bash bluegreen.sh
```
