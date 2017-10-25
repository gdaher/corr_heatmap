# Heatmaps with Correlation
library(stats)
library(Hmisc)
library(gplots)

#read in data
data <- read.csv("your_data.csv", 
                 
                  stringsAsFactors = FALSE, header = FALSE,row.names = 1)

#reformat column names if need be, they will be your labels
colnames(data) <- gsub(pattern = "Results", x = data[1,],replacement = "")

#select the rows of data you want to use
data <- data.matrix(data[3:26,])

#run correlation
cor.data <- rcorr(data,type = "pearson")

#make heatmap and save to pdf
pdf(file= "", width = 8.5,height = 10)

heatmap.2(x = cor.data$r,
          dendrogram ='both',
          col= colorRampPalette(c("green", "white", "red")), 
          symkey=FALSE, density.info='none', key.xlab = "Pearson's r", 
          trace='none', key.title = "",
          cexRow=0.4,cexCol=.4,lhei = c(1,7), lwid = c(1,5),
          margins = c(10,10)
)

dev.off()

#write r squared and p-values to separate files
write.csv(x = cor.data$r, file = "V:/correlations.csv")
write.csv(x = cor.data$P, file = "V:/correlations_p-value.csv")

