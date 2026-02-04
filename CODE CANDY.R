library(tidyverse)
read.csv2("data_tidy/candy.csv") -> Candy
view(Candy)
dim(Candy)
library(tidyr)

## selection des colonnes/ que les parfums, le %de sucre et le prix
Candy %>% select(name, chocolate:nougat, sugar:win) -> candy1
view(candy1)
names(candy1)
dim(candy1)
candy1 %>% select(name,chocolate,sugar:win) -> candy2
view (candy2)
candy2 %>% mutate(chocolate = factor(chocolate, levels = c(0,1), labels = c("no","yes"), name = factor(name, levels = name) -> candy3 
candy3 <- candy2 %>% mutate(chocolate = factor(chocolate, 0:1, c("no", "yes")))
                                     
view(candy3)       
library(dplyr)

library(tidyr)


## les pivots
candy3 %>% pivot_longer(c(sugar,win),names_to ="names",values_to = "cases")-> candy_longer
view(candy_longer)




candy3 <- candy3 %>% 
  mutate(across(c(sugar, price, win), ~ parse_number(.x)))

library(ggplot2)


candy3 %>% #data
  ggplot + #mapping
  aes(x=sugar,y=win,color=chocolate,fill=chocolate) + #mapping
  
 ## Layers
geom_point(size = 0.6) +
geom_smooth(method = "lm", size = 0.6, na.rm = TRUE) 
geom_density2d(size = 0.2, na.rm = TRUE)
  
#scale_x_log10() + #scales
#scale_y_log10() + #scales
  scale_color_discrete(palette = "Dark2") + #scales
  scale_fill_discrete(palette = "Dark2") + #scales
  scale_x_continuous(limits=c(30,60)) + #scales
  scale_y_continuous(limits=c(12,23)) + #scales

facet_grid(row=vars(name)) + #facet
#facet_wrap(vars(name,chocolate))
facet_grid(raw=vars(name))
facet_wrap(vars(name))
    
xlab("sugar") + #options
ylab("win")  + #options
ggtitle("A Nice Graph")  + #options

coord_cartesian() + #coordinates
#coord_fixed()
    
 #theme(aspect.ratio =1/1.5) +
theme_bw() #theme  

  
  
   