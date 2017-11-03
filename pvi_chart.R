library(ggplot2)

cds_with_pvi_score <- read_csv("~/agre-v-wolf/data/cds_with_pvi_score.csv")

desired_order_pvi <- c(2, 1, 14, 13, 7, 17, 6, 8, 15, 16, 11, 3, 4, 12, 18, 5, 10, 9)

cds_with_pvi_score$District <- factor( as.integer(cds_with_pvi_score$District), levels=desired_order_pvi )

cds_with_pvi_score$colour <- ifelse(cds_with_pvi_score$Raw_PVI > 0, "blue", "red")

ggplot(cds_with_pvi_score,aes(x = District,y = Raw_PVI, fill = colour)) + 
  geom_bar(stat = "identity", width=0.7) +
  labs(x = "Congressional District", y="Cook PVI", title = "Pennsylvania Congressional Districts", subtitle = "Ranked by Cook Partisan Vote Index (PVI)") +
  guides(fill=guide_legend(title=NULL))
