---
title: "World Health Organization Happiness Report"
author: "Rachit Vargas"
date: "10/28/2020"
output: html_document
---

# Import library tidyverse
```{r}
library(tidyverse)
```


# Loanding data as data_base
```{r}
data_base = read_delim("C:/Users/User/Documents/Rachit/Rstudio/Primeros pasos/R for Data Science/ProyectoFinal/2019.csv", delim = ",")
```

# Data Query part 1
```{r}
str(data_base)
dim(data_base)
```
# Data Query part 2
```{r}
head(data_base, n =10)
tail(data_base, n =10)
summary(data_base)
```


# Data manipulation 
```{r}
new_dataBase = data_base %>% 
  select(
    `Country or region`, Score, `GDP per capita`, `Social support`,`Healthy life expectancy`,
    `Freedom to make life choices`, Generosity, `Perceptions of corruption`
         ) %>% 
  arrange(desc(Score)) %>% 
  rename(per = `GDP per capita`, ss = `Social support`, hle = `Healthy life expectancy`, ftmlc = 
           `Freedom to make life choices`, g = Generosity, poc = `Perceptions of corruption`,
         cor = `Country or region`)

high_level_country = head(new_dataBase, n =20)
low_level_country = tail(new_dataBase, n = 20)

```


# Data Combination with Bind Rows
```{r}

country_high_low = bind_rows(high_level_country, low_level_country)

```


# Data Visualization
## Scatter plot with linear correlation (GDP per capita and Healthy life expectancy)
```{r}

graphic_1 = ggplot(new_dataBase, aes(per,hle, size = Score)) +
  geom_point(mapping = aes(color = '')) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = 'Scatter plot with linear correlation (GDP per capita and Healthy life expectancy)',
    x = 'GDP per capita',
    y = 'Healthy life expectancy',
    caption = 'World Health Organization Happiness Report'
    
  )+
  theme_bw()+
  theme(
    legend.position = 'bottom'
  )

graphic_1

```

## Line Plot of Score vs Perceptions of corruption
```{r}


graphic_2 = ggplot(new_dataBase, aes(x= Score, y = poc, alpha(Score), color = 'blue', fill = 'clarity')) +
  geom_line() +
  labs(
    title = 'Line Plot of Score vs Perceptions of corruption',
    x = 'Score',
    y = 'Perceptions of corruption',
    caption = 'World Health Organization Happiness Report'
  ) +
  theme_classic()+
  theme(
    legend.position = 'bottom'
  )

graphic_2


```

## Smooth line of GDP per capita vs Social Support
```{r}

graphic_3 = ggplot(country_high_low, aes(x= per, y =ss,))+
  geom_area()+
  
  labs(
    title =  "Smooth line of GDP per capita vs Social Support",
    x = 'GDP per capita',
    y = 'Social Support',
    caption = 'World Health Organization Happiness Report'
  )+
  theme_classic()

graphic_3

```
