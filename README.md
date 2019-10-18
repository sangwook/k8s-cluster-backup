# k8s-cluster-backup

## prerequisites

- https://github.com/kislyuk/yq#installation

## backup

```
$ ./backup.sh
drwxrwxr-x 2 sangwook sangwook 4.0K 10월 18 16:19 default
-rw-rw-r-- 1 sangwook sangwook  116 10월 18 16:19 default.ns.yaml
drwxrwxr-x 2 sangwook sangwook 4.0K 10월 18 16:19 ingress-nginx
-rw-rw-r-- 1 sangwook sangwook  174 10월 18 16:19 ingress-nginx.ns.yaml
drwxrwxr-x 2 sangwook sangwook 4.0K 10월 18 16:19 jenkins
-rw-rw-r-- 1 sangwook sangwook  144 10월 18 16:19 jenkins.ns.yaml
drwxrwxr-x 2 sangwook sangwook 4.0K 10월 18 16:19 kube-public
-rw-rw-r-- 1 sangwook sangwook  120 10월 18 16:19 kube-public.ns.yaml
drwxrwxr-x 2 sangwook sangwook 4.0K 10월 18 16:19 kube-system
-rw-rw-r-- 1 sangwook sangwook  138 10월 18 16:19 kube-system.ns.yaml
drwxrwxr-x 2 sangwook sangwook 4.0K 10월 18 16:19 monitoring
-rw-rw-r-- 1 sangwook sangwook  150 10월 18 16:19 monitoring.ns.yaml

$ ls -alh jenkins
total 88K
drwxrwxr-x 2 sangwook sangwook 4.0K 10월 18 16:19 .
drwxrwxr-x 9 sangwook sangwook 4.0K 10월 18 16:19 ..
-rw-rw-r-- 1 sangwook sangwook 2.9K 10월 18 16:19 default-token-g4k7j.secret.yaml
-rw-rw-r-- 1 sangwook sangwook  120 10월 18 16:19 default.sa.yaml
-rw-rw-r-- 1 sangwook sangwook  360 10월 18 16:19 jenkins-agent.svc.yaml
-rw-rw-r-- 1 sangwook sangwook  212 10월 18 16:19 jenkins-tests.cm.yaml
-rw-rw-r-- 1 sangwook sangwook 2.9K 10월 18 16:19 jenkins-token-j2kw6.secret.yaml
-rw-rw-r-- 1 sangwook sangwook 6.2K 10월 18 16:19 jenkins.cm.yaml
-rw-rw-r-- 1 sangwook sangwook 4.5K 10월 18 16:19 jenkins.deploy.yaml
-rw-rw-r-- 1 sangwook sangwook  244 10월 18 16:19 jenkins.ing.yaml
-rw-rw-r-- 1 sangwook sangwook  318 10월 18 16:19 jenkins.pvc.yaml
-rw-rw-r-- 1 sangwook sangwook  215 10월 18 16:19 jenkins.sa.yaml
-rw-rw-r-- 1 sangwook sangwook  259 10월 18 16:19 jenkins.secret.yaml
-rw-rw-r-- 1 sangwook sangwook  385 10월 18 16:19 jenkins.svc.yaml
```

## restore

```
kubectl create -f default.ns.yaml
kubectl create -f default
kubectl create -f jenkins.ns.yaml
kubectl create -f jenkins
```
