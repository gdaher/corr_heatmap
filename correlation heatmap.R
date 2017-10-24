# Heatmaps with Correlation
library(stats)
library(Hmisc)
library(gplots)

data <- read.csv("", 
                 
                  stringsAsFactors = FALSE, header = FALSE,row.names = 1)

colnames(data) <- gsub(pattern = "Results", x = data[1,],replacement = "")

data <- data.matrix(data[3:26,])


cor.data <- rcorr(data,type = "pearson")

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

write.csv(x = cor.data$r, file = "V:/Daher_Grace/For ME/Alm Correlation Heatmap/Copy of 2017-05-3-SGLT2-Patti-Amide_correlations.csv")
write.csv(x = cor.data$P, file = "V:/Daher_Grace/For ME/Alm Correlation Heatmap/Copy of 2017-05-3-SGLT2-Patti-Amide_correlations_p-value.csv")

