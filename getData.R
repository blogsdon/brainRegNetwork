library(synapseClient)
synapseLogin()

#read in small expression data-set
library(data.table)
library(dplyr)

fooObj = synGet('syn7253793')
#exprMat = fread(fooObj@filePath,data.table=F)
exprMat = read.delim(fooObj@filePath,row.names=1,stringsAsFactors=F) %>%
          data.matrix %>%
          t %>%
          apply(2,utilityFunctions::winsorize) %>%
          scale

#write to csv
write.csv(exprMat,file='expression1.csv',quote=F)
