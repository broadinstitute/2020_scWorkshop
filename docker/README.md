## Notes

Install software files below directly on AWS instance.

For docker, install only R, Rstudio and necessary packages.  Then run docker containers for the students so all the have to do is access the AWS at the user number port. (e.g 34.211.169.110:9001, ec2-34-211-169-110.us-west-2.compute.amazonaws.com:9001)


## Building Container


### software files
  - STAR
  - cellranger-3.0.2.tar.gz
  - fastqc_v0.11.8.zip
  - IGV_2.4.19.zip


### build_docker.sh

./build_docker.sh


### Pushing to Dockerhub

./push_docker.sh


### Running Container

./run_docker.sh
./run_docker_bash.sh
./run_docker_aws.sh