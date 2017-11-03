library(ggplot2)
library(reshape2)

cds_2003_with_dem_gop_perc <- read_csv("~/agre-v-wolf/data/cds_2003_with_dem_gop_perc.csv")

cds_2011_m <- melt(cds_2011_with_dem_gop_perc[,c('CD115FP','DEM_PERC','GOP_PERC')],id.vars = 1)

cds_2003_m <- melt(cds_2003_with_dem_gop_perc[,c('CD108FP','DEM_PERC','GOP_PERC')],id.vars = 1)

desired_order_2011 <- c("2", "1", "14", "13", "17", "8", "15", "12", "6", "18", "7", "3", "5", "11", "9", "16", "4", "10")

desired_order_2003 <- c("2", "1", "14", "13", "11", "12", "15", "6", "7", "8", "3", "18", "4", "17", "5", "10", "16", "19", "9")

cds_2011_m$CD115FP <- factor( as.character(cds_2011_m$CD115FP), levels=desired_order_2011 )

cds_2003_m$CD108FP <- factor( as.character(cds_2003_m$CD108FP), levels=desired_order_2003 )

# Make plot of Dem/GOP Normal Vote Share with 2011 districts
ggplot(cds_2011_m,aes(x = CD115FP,y = value)) + 
  geom_bar(aes(fill = variable),stat = "identity", position = "dodge", width=0.7 ) +
  scale_fill_manual(values = c("DEM_PERC" = "#3EC0F3", "GOP_PERC" = "#F37561"), labels=c("Democratic %", "Republican %")) +
  labs(x = "Congressional District", y="Normal Percentage of Vote", title = "Pennsylvania Congressional Districts - Current", subtitle = "Ranked by normal Democratic vote percentage") +
  guides(fill=guide_legend(title=NULL))

# Make plot of Dem/GOP Normal Vote Share with 2003 districts
ggplot(cds_2003_m,aes(x = CD108FP,y = value)) + 
  geom_bar(aes(fill = variable),stat = "identity", position = "dodge", width=0.7 ) +
  scale_fill_manual(values = c("DEM_PERC" = "#3EC0F3", "GOP_PERC" = "#F37561"), labels=c("Democratic %", "Republican %")) +
  labs(x = "Congressional District", y="Normal Percentage of Vote", title = "Pennsylvania Congressional Districts - 2003", subtitle = "Ranked by normal Democratic vote percentage") +
  guides(fill=guide_legend(title=NULL))

# Make plot of statewide Dem/GOP Normal Vote Share
ggplot(state_nv,aes(x = state,y = value)) + 
  geom_bar(aes(fill = variable),stat = "identity", position = "dodge", width=0.7 ) +
  scale_fill_manual(values = c("DEM_PERC" = "#3EC0F3", "REP_PERC" = "#F37561"), labels=c("Democratic %", "Republican %")) +
  labs(x = "Pennsylvania", y="Normal Percentage of Vote", title = "Pennsylvania Statewide Vote", subtitle = "Normal Democratic and Republican vote share") +
  guides(fill=guide_legend(title=NULL))

