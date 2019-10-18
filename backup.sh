#!/usr/bin/env bash

for curns in $(kubectl get ns -o jsonpath={.items[*].metadata.name}); do
  mkdir -p $curns
  kubectl get -o=yaml ns $curns | yq -y \
    'del(
      .metadata.annotations."control-plane.alpha.kubernetes.io/leader",         
      .metadata.annotations."kubectl.kubernetes.io/last-applied-configuration", 
      .metadata.creationTimestamp,                                              
      .metadata.generation,                                                     
      .metadata.resourceVersion,                                                
      .metadata.selfLink,                                                       
      .metadata.uid                                                             
  )' > $curns.ns.yaml

  for type in ing deploy cm svc ds sts cj pvc secret sa; do
    for name in $(kubectl --namespace=$curns get $type -l OWNER!=TILLER -o custom-columns=NAME:.metadata.name --no-headers); do

      kubectl --namespace=$curns get -o=yaml $type $name | yq -y \
        'del(
          .metadata.annotations."control-plane.alpha.kubernetes.io/leader",
          .metadata.annotations."kubectl.kubernetes.io/last-applied-configuration",
          .metadata.annotations."pv.kubernetes.io/bind-completed",
          .metadata.annotations."pv.kubernetes.io/bound-by-controller",
          .metadata.annotations."volume.beta.kubernetes.io/storage-provisioner",
          .metadata.creationTimestamp,
          .metadata.finalizers,
          .metadata.generation,
          .metadata.resourceVersion,
          .metadata.selfLink,
          .metadata.uid,
          .spec.clusterIP,
          .spec.volumeName,
          .status
      )' > $curns/$name.$type.yaml

    done
  done
done

