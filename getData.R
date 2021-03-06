synId <- as.character(commandArgs(TRUE)[[1]])

library(synapseClient)
synapseLogin()

#read in small expression data-set
library(data.table)
library(dplyr)

fooObj = synGet(synId)
#exprMat = fread(fooObj@filePath,data.table=F)
exprMat <- fread(fooObj@filePath,data.table=F)
rownames(exprMat) <- exprMat[,1]
exprMat <- exprMat[,-1]
#exprMat = exprMat %>%
#          data.matrix %>%
#          t %>%
#          apply(2,utilityFunctions::winsorize) %>%
#          scale

#write to csv
write.csv(exprMat,file='Expression.csv',quote=F)
