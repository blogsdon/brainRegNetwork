#!/bin/sh
#number of cores to reserve for job
nthreads=16

#full s3 path where networks will go
s3="s3://metanetworks/brainRegNetwork/"

#location of data file
dataFile="/shared/brainRegNetwork/expression1.csv"

#location of metanetwork synapse scripts
pathv="/shared/metanetworkSynapse/"

#output path for temporary result file prior to pushing to s3/synapse
outputpath="/local/brainRegNetwork/"

#path within s3
s3b="brainRegNetwork"

#id of folder with networks to combine
networkFolderId="syn7255211"

#id of folder on Synapse that file will go to
parentId="syn7255211"

#path to csv file with annotations to add to file on Synapse
annotationFile="/shared/brainRegNetwork/annoFile.txt"

provenanceFile="/shared/brainRegNetwork/provenanceFileAgg.txt"

#path to error output
errorOutput="/shared/brainRegNetwork/Aggregationerror.txt"

#path to out output
outOutput="/shared/brainRegNetwork/Aggregationout.txt"

#job script name
jobname="expression1aggregation"

qsub -v s3=$s3,dataFile=$dataFile,pathv=$pathv,outputpath=$outputpath,s3b=$s3b,parentId=$parentId,annotationFile=$annotationFile,provenanceFile=$provenanceFile,networkFolderId=$networkFolderId -pe orte $nthreads -S /bin/bash -V -cwd -N $jobname -e $errorOutput -o $outOutput $pathv/buildConsensus.sh
