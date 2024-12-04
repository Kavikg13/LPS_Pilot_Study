library(ggplot2)
library(tidyr)

Data <- ZFish_LPS_Exp_Data_Collection_Sheet
colnames(Data) <- as.factor(colnames(Data))
df<-data.frame(Data)


df_long <- df %>%
  gather(key = "Concentration", value = "Alive_Individuals", X0, X50, X150, X200)

grey_palette <- c("X0" = "grey25", "X50" = "grey45", "X150" = "grey65", "X200" = "grey75")

shape_palette <- c("X0" = 16,  # Filled circle
                   "X50" = 17,  # Filled triangle
                   "X150" = 15, # Filled square
                   "X200" = 18) # Filled diamond


ggplot(data = df_long, aes(x = HPE..Hours.Post.Exposure., y = Alive_Individuals, color = Concentration, shape = Concentration)) +
  geom_line(aes(group = Concentration)) +   
  geom_point(size = 3.4) +                            
  labs(x = "HPE (Hours Post Exposure)", 
       y = "Number of Alive Individuals", 
       title = "TL Zfish Treated With Salmonella LPS at Varying Concentrations") +
  scale_color_manual(values = grey_palette) +  
  scale_shape_manual(values = shape_palette) +  
  theme_classic()       
