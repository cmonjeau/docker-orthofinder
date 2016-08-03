### Orthofinder

OrthoFinder is a program for finding orthogroups from one or more species. 
An orthogroup is the set of genes that are descended from a single gene in the last common ancestor of the species being clustered. 
OrthoFinder accounts for gene length biases that are inherent in BLAST scores, normalises for differences in species divergence times, and accounts for orthogroup specific differences in gene evolultion rates. 

For more details see the OrthoFinder paper below.

Emms, D.M. and Kelly, S. (2015) OrthoFinder: solving fundamental biases in whole genome comparisons dramatically improves orthogroup inference accuracy, Genome Biology 16:157

### Import docker image

docker pull cmonjeau/orthofinder

### Use orthofinder in docker

docker run -it --rm cmonjeau/orthofinder orthofinder.py -f fasta_directory -t number_of_processes
