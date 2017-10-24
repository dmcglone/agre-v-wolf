library(ggplot2)
library(reshape2)

cds_m <- melt(cds_with_dem_gop_perc[,c('CD115FP','DEM_PERC','GOP_PERC')],id.vars = 1)

desired_order <- c("2", "1", "14", "13", "17", "8", "15", "12", "6", "18", "7", "3", "5", "11", "9", "16", "4", "10")

cds_m$CD115FP <- factor( as.character(cds_m$CD115FP), levels=desired_order )

ggplot(cds_m,aes(x = CD115FP,y = value)) + 
  geom_bar(aes(fill = variable),stat = "identity", position = "dodge", width=0.7 ) +
  scale_fill_manual(values = c("DEM_PERC" = "#3EC0F3", "GOP_PERC" = "#F37561"), labels=c("Democratic %", "Republican %")) +
  labs(x = "Congressional District", y="Normal Percentage of Vote", title = "Pennsylvania Congressional Districts", subtitle = "Ranked by normal Democratic vote percentage") +
  guides(fill=guide_legend(title=NULL))
