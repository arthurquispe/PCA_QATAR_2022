rm(list = ls())
graphics.off()
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()
cat("\014")
options(scipen = 999)  
options(digits = 3)  

df1 = read.csv("group_stats.csv")

library(textshape)

df2 = df1[!duplicated(df1$team),]
df3 = textshape::column_to_rownames(df2,loc = 4)
colnames(df3)
df4 = df3[,-c(1,2,3,4,11,12,13,14,15)] 

PCA1 = prcomp(df4,scale=TRUE)

PCA1.names()

library(factoextra)
fviz_eig(PCA1)
fviz_pca_biplot(PCA1,
                repel = TRUE
                )

# Mensaje nuevo