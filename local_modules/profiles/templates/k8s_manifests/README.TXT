Deploy containers in this order:

kubectl create -f ./namespaces/
kubectl create -f ./dns/
kubectl create -f ./loadbalancer/
kubectl create -f ./nginx/
kubectl create -f ./busybox/

Read README file in ./glusterfs/ and deploy GlusterFS cluster - PresistanceVolumes in kubernetes