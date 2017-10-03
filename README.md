### Orthofinder

OrthoFinder is a program for finding orthogroups from one or more species.
An orthogroup is the set of genes that are descended from a single gene in the last common ancestor of the species being clustered.
OrthoFinder accounts for gene length biases that are inherent in BLAST scores, normalises for differences in species divergence times, and accounts for orthogroup specific differences in gene evolultion rates.

For more details see the OrthoFinder paper below.

> Emms, D.M. and Kelly, S. (2015) OrthoFinder: solving fundamental biases in whole genome comparisons dramatically improves orthogroup inference accuracy, Genome Biology 16:157

### Import docker image

    docker pull cmonjeau/orthofinder

### Build docker image from Dockerfile

    docker build --rm -t username/imagename .

### Use orthofinder in docker

    docker run -it --rm -v "/path/to/fasta_directory":/input cmonjeau/orthofinder orthofinder.py -f /input -t n_blast_processes -a n_orthofinder_threads -S diamond

### Use orthofinder to build trees

    docker run -it --rm -v "/path/to/results_directory":/input cmonjeau/orthofinder trees_for_orthogroups.py /input/ -t 7