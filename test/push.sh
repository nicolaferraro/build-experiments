#!/bin/sh

oc replace --force -f is-test-a.yaml
oc replace --force -f is-test-b.yaml
oc replace --force -f is-test-b2.yaml

eval $(minishift docker-env)

repo_a=$(oc get is test-a -o=jsonpath="{.status.dockerImageRepository}")
repo_b=$(oc get is test-b -o=jsonpath="{.status.dockerImageRepository}")
repo_b2=$(oc get is test-b2 -o=jsonpath="{.status.dockerImageRepository}")

repo=$(echo $repo_a | tr '/' ' ' | awk '{print $1}')
echo $repo

docker login $repo -u $(oc whoami) -p $(oc whoami -t)

docker tag test-a $repo_a
docker tag test-b $repo_b
docker tag test-b2 $repo_b2

docker push $repo_a
docker push $repo_b
docker push $repo_b2
