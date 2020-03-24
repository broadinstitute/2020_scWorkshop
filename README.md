## Introduction

In recent years single cell RNA-seq (scRNA-seq) has become widely used for transcriptome analysis in many areas of biology. In contrast to bulk RNA-seq, scRNA-seq provides quantitative measurements of the expression of every gene in a single cell. However, to analyze scRNA-seq data, novel methods are required and some of the underlying assumptions for the methods developed for bulk RNA-seq experiments are no longer valid. In this course we will cover all steps of the scRNA-seq processing, starting from the raw reads coming off the sequencer. The course includes common analysis strategies, using state-of-the-art methods and we also discuss the central biological questions that can be addressed using scRNA-seq.

[Course Webiste](https://broadinstitute.github.io/2020_scWorkshop/)

## Quick Start

If you have the repository cloned and docker installed on your computer already you can simple run the script `run_docker.sh` in the docker directory of the repository to start the rstudio session.  It should pull the container to your computer if you do not have it already and then run the docker command to start rstudio.  You can then access rstudio and the course content within the docker container at [localhost:8787](http://localhost:8787/)

```{bash}
## clone repository
git clone https://github.com/broadinstitute/2020_scWorkshop.git
cd 2020_scWorkshop

# you may need to give the script execution permission
# chmod 755 docker/run_docker.sh
# if first time, this could take 10-20 minutes depending on internet connection.
./docker/run_docker.sh
```

This command will take a long time to run the first time you run it.  Once you see in `[services.d] done` in the terminal you can go to your web browser to http://localhost:8787/ to access Rstudio.  This will bring up Rstudio inside your web browser.


## Docker Usage (Detailed Explanation)

If you have got the Quick Start part working for you, you do not need to do anything else.  The following are more detailed instructions on the software and how to access them.  

There is a docker image that goes along with this course.  The following explains how to use the docker image and what software it contains.  To rebuild the image from scratch please see this subdirectory labeled docker. 

  - [More about docker](https://www.youtube.com/watch?v=6aBsjT5HoGY)
  - [Docker for beginners](https://docker-curriculum.com/)
  
### Installing Docker

Make sure to have docker installed on your computer. Go to the docker getting started [website](https://www.docker.com/get-started) and select the download for your operating system.  


### Software Included

All additional software is included in the /usr/local/src directory inside the docker container.  

  - [STAR](https://github.com/alexdobin/STAR)
  - [Cellranger](https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/installation)
  - [FASTQC](https://www.bioinformatics.babraham.ac.uk/projects/download.html)
  - [Samtools](https://github.com/samtools/samtools)
  - [IGV](http://software.broadinstitute.org/software/igv/)
  - [CITE-seq Count](https://github.com/Hoohm/CITE-seq-Count)
  - [R/Rstudio](https://www.rstudio.com/)
  
  
### Pull Image

The first thing you will need to do is pull the docker image to your computer.  You do this by running the command:

```{bash}
docker pull kdgosik/2020scworkshop:latest
```

### Running Rstudio in Docker locally on your computer

```{bash}
docker run --rm -ti \
-v $PWD:/home/rstudio/materials/ \
-e DISABLE_AUTH=true \
-p 8787:8787 kdgosik/2020scworkshop

```
  - You can choose any port (in this exmaple above the PORT NUMBER is 8787)
  - Go to your web browser at [localhost:8787](http://localhost:8787)
    - Generic webiste http://localhost:$PORT_NUMBER
  

### Running Rstudio in Docker AWS

#### Access the EC2 Instance

There is a nice breakdown from another Physalia course on instructions for different operating systems and accessing AWS.  It is called [Connection to the Amazon EC2 service](https://gitlab.com/bfosso/metabarcoding_physalia/-/blob/master/unix_short_tutorial/how_to_connect.md).  This will help with connecting to the AWS instance to run docker.  

#### Access Rstudio

After running the below command go to your web browser at the link indicated.  Log into Rstudio by using,
  - **username:** rstudio
  - **password:** train 

The password is only set so outside people will not be able to access it by snooping. This can be changed to whatever you desire by changing the `-e PASSWORD=train` in the command. 

**quick start script**
```{bash}
./docker/run_docker_aws.sh 9017
```
  - 9017 is the PORT_NUMBER
  - Change PORT_NUMBER to your user (e.g. user1 should use 9001, user99 should use 9099)
  - ec2-$AWS_PUBLIC_IP_ADDRESS.us-west-2.compute.amazonaws.com:$PORT_NUMBER
    - ec2-54-202-32-102.us-west-2.compute.amazonaws.com:9017

**full command**
```{bash}
docker run --rm -it \
-v $PWD:/home/rstudio/materials \
-e PASSWORD=train \
-p 9017:8787 kdgosik/2020scworkshop
```

**Getting material after starting docker Rstudio**
No need for the `-v $PWD:/home/rstudio`
```{bash}
docker run --rm -it -e PASSWORD=train -p 9017:8787 kdgosik/2020scworkshop
```

Inside Rstudio go to the terminal (tab right next to console in the top left)

```{bash}
git clone https://github.com/broadinstitute/2020_scWorkshop.git
```



  - Change PORT NUMBER to your user (e.g. user1 should use 9001, user99 should use 9099)
  - ec2-$AWS_PUBLIC_IP_ADDRESS.us-west-2.compute.amazonaws.com:$PORT_NUMBER
    - ec2-54-202-32-102.us-west-2.compute.amazonaws.com:9001


**Explaination of commands**
  - docker: command to run docker
  - run: asking docker to run a container
  - --rm: flag to remove the container when you exit from it
      - nothing will be saved from your session to access again later
      - this flag can be removed to keep container
  - -it: flag to run the container interactively
    - this will keep all session output displaying on the terminal
    - to stop container go to terminal and press Crtl+c
  - -v $PWD:/home/rstudio/materials: map the present directory to the rstudio home directory
  - -e PASSWORD=train: password assignment you will need to access rstudio when you login
  - -p 9001:8787: flag to assign port mapping.
    - rstudio runs on port 8787 inside the container
    - you will access rstudio by going to port 9001 on your computer (localhost:9001 in your browser)
    - 9001 can be any port you would like.  We will change this up for each student in the class
  - kdgosik/2020scworkshop: the image to run to make the container if not already built on your computer
    - [image link](https://hub.docker.com/r/kdgosik/2020scworkshop)



#### Accessing Rstudio

Once you run the docker run command above, you can go to your browser at localhost:9001.  This will bring you to a log-in screen for rstudio.  Enter the username: rstudio and password: train.  This will log you into Rstudio where you can do your analysis.  After this you can install whichever R packages you would like.  


**examples**
```{R}
## CRAN Packages
install.packages('umap')
install.packages("corrplot")
install.packages("gam")
install.packages("ggbeeswarm")
install.packages("ggthemes")
install.packages("plyr")
install.packages("Matrix")
install.packages("fossil")
install.packages("BiocManager")
install.packages("devtools")
install.packages('rmarkdown')
#install.packages("rgl", dependencies=TRUE)

## Bioconductor Packages
BiocManager::install("SingleCellExperiment", update = FALSE)
BiocManager::install("destiny", update = FALSE)
BiocManager::install("slingshot", update = FALSE)
BiocManager::install("clusterExperiment", update = FALSE)
BiocManager::install("scater", update = FALSE)
#BiocManager::install("DropletUtils", update = FALSE)
#BiocManager::install("pcaMethods", update = FALSE)
BiocManager::install("CountClust", update = FALSE)


## Github Packages
devtools::install_github("satijalab/seurat", upgrade = "never")
devtools::install_github('MacoskoLab/liger')

```

### Docker Terminal

Same command as above but add the option bash at the end to access the terminal in the docker container.

```{bash}
docker run --rm -it kdgosik/2020scworkshop bash
```



#### Get Course Material

Once you have docker running and you are in the terminal you can pull the course content to your computer by running the command below.  This will bring all the Rmarkdown files for you to run.

```{bash}
git clone https://github.com/broadinstitute/2020_scWorkshop.git
```


## Update Course Material

  1. Create a Fork  - Click on the “fork” button of the repository page on GitHub.

For example to fork to my github page it would copy from broadinstitute/2020_scWorkshop to kdgosik/2020_scWorksop.

  2. Clone your Fork
The standard clone command creates a local git repository from your remote fork on GitHub.

```{bash}
git clone https://github.com/USERNAME/REPOSITORY.git


## keeping with my username example
git clone https://github.com/kdgosik/2020_scWorkshop.git
```

  3. Modify the Code  - In your local clone, modify the code and commit them to your local clone using the git commit command.

```{bash}
cd 2020_scWorkshop
```
Add files and/or modify course material.


  4. Push your Changes - use the git push command to upload your changes to your remote fork on GitHub.

```{bash}
git add --all
git commit -m "Updated course materials"
git push 
```

  5. Create a Pull Request
On the GitHub page of your remote fork, click the “pull request” button. Wait for the owner to merge or comment your changes and be proud when it is merged :). If the owner suggests some changes before merging, you can simply push these changes into your fork by repeating steps #3 and #4 and the pull request is updated automatically.



#### Pull Request References

  - [Github's Fork & Pull Workflow for Git Beginners](https://reflectoring.io/github-fork-and-pull/)
  - [Github Forking](https://gist.github.com/Chaser324/ce0505fbed06b947d962)
  - [About Pull Requests](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests)