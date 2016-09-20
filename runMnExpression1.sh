#!/bin/bash

#number of cores to reserve for job
nthreads=16

#full s3 path where networks will go
s3="s3://metanetworks/brainRegNetwork/"

#location of data file
dataFile="/shared/brainRegNetwork/expression1.csv"

#location of metanetwork synapse scripts
pathv="/shared/metanetworkSynapse/"

#output path for temporary result file prior to pushing to s3/synapse
outputpath="/shared/brainRegNetwork/"

#path within s3
s3b="brainRegNetwork"

#id of folder on Synapse that files will go to
parentId="syn7255211"

#path to csv file with annotations to add to file on Synapse
annotationFile="/shared/brainRegNetwork/annoFile.txt"

#path to csv file with provenance to add to file on synapse
provenanceFile="/shared/brainRegNetwork/provenanceFile.txt"

#path to error output
errorOutput="/shared/brainRegNetwork/error.txt"

#path to out output
outOutput="/shared/brainRegNetwork/out.txt"

#job script name
jobname="expression1"


echo "qsub -v s3=$s3,dataFile=$dataFile,pathv=$pathv,c3net=0,mrnet=0,wgcnaTOM=0,sparrowZ=1,lassoCV1se=1,ridgeCV1se=1,genie3=1,tigress=1,numberCore=$nthreads,outputpath=$outputpath,s3b=$s3b,parentId=$parentId,annotationFile=$annotationFile,provenanceFile=$provenanceFile -pe orte $nthreads -S /bin/bash -V -cwd -N $jobname -e $errorOutput -o $outOutput $pathv/buildNet.sh"

qsub -v s3=$s3,dataFile=$dataFile,pathv=$pathv,c3net=1,mrnet=1,wgcnaTOM=1,sparrowZ=1,sparrow2Z=1,lassoCVmin=1,lassoAIC=1,lassoBIC=1,lassoCV1se=1,ridgeCV1se=1,ridgeCVmin=1,ridgeAIC=1,ridgeBIC=1,genie3=1,tigress=1,numberCore=$nthreads,outputpath=$outputpath,s3b=$s3b,parentId=$parentId,annotationFile=$annotationFile,provenanceFile=$provenanceFile -pe orte $nthreads -S /bin/bash -V -cwd -N $jobname -e $errorOutput -o $outOutput $pathv/buildNet.sh
