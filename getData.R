synId <- as.character(commandArgs(TRUE)[[1]])

library(synapseClient)
synapseLogin()

#read in small expression data-set
library(data.table)
library(dplyr)

fooObj = synGet(synId)
#exprMat = fread(fooObj@filePath,data.table=F)
exprMat = read.delim(fooObj@filePath,row.names=1,stringsAsFactors=F) %>%
          data.matrix %>%
          t %>%
          apply(2,utilityFunctions::winsorize) %>%
          scale

#write to csv
write.csv(exprMat,file='Expression.csv',quote=F)
