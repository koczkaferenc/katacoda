#!/bin/sh

echo "CourseBase" >/tmp/courseBase.txt
docker pull gcr.io/google_containers/ubuntu
docker pull gcr.io/google_containers/etcd:2.2.1 


