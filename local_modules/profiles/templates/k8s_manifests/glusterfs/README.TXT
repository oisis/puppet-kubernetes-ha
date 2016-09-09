http://website-humblec.rhcloud.com/gluster_containers_in_kubernetes_cluster/

Gluster cluster Machines:
node1   - k8s-node1.example.com  - 192.168.0.20
node2   - k8s-node2.example.com  - 192.168.0.21

1. Setup labels for nodes:
  kubectl label nodes k8s-node1.example.com name=node1
  kubectl label nodes k8s-node1.example.com name=node2
2. GlusterFS server install and configure:
- deploy server/gluster-node1.yaml and server/gluster-node2.yaml
- setup GlusterFS cluster(all nodes except localhost) - command run inside container gluster-node1:
  gluster peer probe 192.168.0.21
  gluster peer status
- create volumen in cluster:
  gluster volume create vol0001 replica 2 192.168.0.20:/mnt/brick1/vol0001 192.168.0.21:/mnt/brick1/vol0001
  gluster volume start vol0001
  gluster volume status
3. Gluster client:
- create endpointy: client/gluster-endpoints.yaml
- create service: client/gluster-service.yaml
- create PersistanceVoluem: client/gluster-pv.yaml
- create PersistanceVolumeClaim: client/gluster-pvc.yaml - not sure if needed
4. Create container and mount volumen:
- example/glusterfs-client-pod.yaml
