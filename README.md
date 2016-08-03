## docker-orthofinder

Dockerfile for OrthoFinder software

## Import docker image

docker pull cmonjeau/orthofinder

## Use orthofinder in docker

docker run -it --rm cmonjeau/orthofinder orthofinder.py -f fasta_directory -t number_of_processes
