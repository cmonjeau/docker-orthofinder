# Orthofinder

OrthoFinder is a program for finding orthogroups from one or more species. 
An orthogroup is the set of genes that are descended from a single gene in the last common ancestor of the species being clustered. 
OrthoFinder accounts for gene length biases that are inherent in BLAST scores, normalises for differences in species divergence times, and accounts for orthogroup specific differences in gene evolultion rates. 

For more details see the OrthoFinder paper below.

Emms, D.M. and Kelly, S. (2015) OrthoFinder: solving fundamental biases in whole genome comparisons dramatically improves orthogroup inference accuracy, Genome Biology 16:157

## Usage

Pull from [dockerhub](https://hub.docker.com/r/cmonjeau/orthofinder/)

```bash
docker pull cmonjeau/orthofinder
```

Or build from this repository

```bash
git clone https://github.com/cmonjeau/docker-orthofinder
cd docker-orthofinder
docker build -t orhtofinder .
```


Run a container

```bash
docker run -it --rm cmonjeau/orthofinder orthofinder.py -f fasta_directory -t number_of_processes
```
