---
title: "Task 2"
author: "Hayden Armour"
date: "9/4/2022"
output:
  html_document:
    keep_md: TRUE
---



#Installing and Loading Packages 

```r
library(knitr)
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
## ✔ ggplot2 3.3.6      ✔ purrr   0.3.4 
## ✔ tibble  3.1.8      ✔ dplyr   1.0.10
## ✔ tidyr   1.2.0      ✔ stringr 1.4.0 
## ✔ readr   2.1.2      ✔ forcats 0.5.2
```

```
## Warning: package 'tidyr' was built under R version 4.0.5
```

```
## Warning: package 'readr' was built under R version 4.0.5
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

#Convert the iris data to a tibble called iris_data.

```r
iris_data <- as_tibble(iris)
iris_data
```

```
## # A tibble: 150 × 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
##  1          5.1         3.5          1.4         0.2 setosa 
##  2          4.9         3            1.4         0.2 setosa 
##  3          4.7         3.2          1.3         0.2 setosa 
##  4          4.6         3.1          1.5         0.2 setosa 
##  5          5           3.6          1.4         0.2 setosa 
##  6          5.4         3.9          1.7         0.4 setosa 
##  7          4.6         3.4          1.4         0.3 setosa 
##  8          5           3.4          1.5         0.2 setosa 
##  9          4.4         2.9          1.4         0.2 setosa 
## 10          4.9         3.1          1.5         0.1 setosa 
## # … with 140 more rows
```

#Arrange the iris data by Sepal.Length and display the first ten rows.

```r
a.sepal <- arrange(iris_data, Sepal.Length) 
head(a.sepal, 10)
```

```
## # A tibble: 10 × 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
##  1          4.3         3            1.1         0.1 setosa 
##  2          4.4         2.9          1.4         0.2 setosa 
##  3          4.4         3            1.3         0.2 setosa 
##  4          4.4         3.2          1.3         0.2 setosa 
##  5          4.5         2.3          1.3         0.3 setosa 
##  6          4.6         3.1          1.5         0.2 setosa 
##  7          4.6         3.4          1.4         0.3 setosa 
##  8          4.6         3.6          1           0.2 setosa 
##  9          4.6         3.2          1.4         0.2 setosa 
## 10          4.7         3.2          1.3         0.2 setosa
```


#Select the Species and Petal.Width columns and put them into a new data set called testdat.

```r
testdat <- select(iris_data, Species, Petal.Width)
testdat
```

```
## # A tibble: 150 × 2
##    Species Petal.Width
##    <fct>         <dbl>
##  1 setosa          0.2
##  2 setosa          0.2
##  3 setosa          0.2
##  4 setosa          0.2
##  5 setosa          0.2
##  6 setosa          0.4
##  7 setosa          0.3
##  8 setosa          0.2
##  9 setosa          0.2
## 10 setosa          0.1
## # … with 140 more rows
```


#Create a new table called species_mean that has the mean for each variable for each Species.

```r
species_mean <- iris_data %>%
  group_by(Species) %>%
  summarise(mean(Sepal.Length), mean(Sepal.Width), mean(Petal.Length), mean(Petal.Width)) 
species_mean
```

```
## # A tibble: 3 × 5
##   Species    `mean(Sepal.Length)` `mean(Sepal.Width)` mean(Petal.Lengt…¹ mean(…²
##   <fct>                     <dbl>               <dbl>              <dbl>   <dbl>
## 1 setosa                     5.01                3.43               1.46   0.246
## 2 versicolor                 5.94                2.77               4.26   1.33 
## 3 virginica                  6.59                2.97               5.55   2.03 
## # … with abbreviated variable names ¹​`mean(Petal.Length)`, ²​`mean(Petal.Width)`
```


#Create a data frame called iris_min with only the observations with at least 3 for Sepal.Width and not 2.5 for Petal.Width.

```r
select_iris <- select(iris_data, Species, Sepal.Width, Petal.Width, Sepal.Length, Petal.Length) 
iris_min <-filter(select_iris, Sepal.Width >= 3, Petal.Width != 2.5)

iris_min
```

```
## # A tibble: 90 × 5
##    Species Sepal.Width Petal.Width Sepal.Length Petal.Length
##    <fct>         <dbl>       <dbl>        <dbl>        <dbl>
##  1 setosa          3.5         0.2          5.1          1.4
##  2 setosa          3           0.2          4.9          1.4
##  3 setosa          3.2         0.2          4.7          1.3
##  4 setosa          3.1         0.2          4.6          1.5
##  5 setosa          3.6         0.2          5            1.4
##  6 setosa          3.9         0.4          5.4          1.7
##  7 setosa          3.4         0.3          4.6          1.4
##  8 setosa          3.4         0.2          5            1.5
##  9 setosa          3.1         0.1          4.9          1.5
## 10 setosa          3.7         0.2          5.4          1.5
## # … with 80 more rows
```

#Create a data frame called iris_size with a column Sepal.Size which is

```r
iris_size <- iris_data %>%
  mutate(Sepal.Size =
           case_when(
             Sepal.Length < 5 ~ "small",
             Sepal.Length >= 5 & Sepal.Length < 6.5 ~ "medium",
             Sepal.Length >= 6.5 ~ "large"))
iris_size
```

```
## # A tibble: 150 × 6
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species Sepal.Size
##           <dbl>       <dbl>        <dbl>       <dbl> <fct>   <chr>     
##  1          5.1         3.5          1.4         0.2 setosa  medium    
##  2          4.9         3            1.4         0.2 setosa  small     
##  3          4.7         3.2          1.3         0.2 setosa  small     
##  4          4.6         3.1          1.5         0.2 setosa  small     
##  5          5           3.6          1.4         0.2 setosa  medium    
##  6          5.4         3.9          1.7         0.4 setosa  medium    
##  7          4.6         3.4          1.4         0.3 setosa  small     
##  8          5           3.4          1.5         0.2 setosa  medium    
##  9          4.4         2.9          1.4         0.2 setosa  small     
## 10          4.9         3.1          1.5         0.1 setosa  small     
## # … with 140 more rows
```

#Create a data frame called iris_rank which ranks all of the data by Petal.Length, where a ranking of 1 is the largest Petal.Length and order by ranking.

```r
iris_ranking <- arrange(iris_data, desc(Petal.Length)) 
iris_rank <- mutate(iris_ranking, rank=min_rank(Petal.Length))


iris_rank
```

```
## # A tibble: 150 × 6
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species    rank
##           <dbl>       <dbl>        <dbl>       <dbl> <fct>     <int>
##  1          7.7         2.6          6.9         2.3 virginica   150
##  2          7.7         3.8          6.7         2.2 virginica   148
##  3          7.7         2.8          6.7         2   virginica   148
##  4          7.6         3            6.6         2.1 virginica   147
##  5          7.9         3.8          6.4         2   virginica   146
##  6          7.3         2.9          6.3         1.8 virginica   145
##  7          7.2         3.6          6.1         2.5 virginica   142
##  8          7.4         2.8          6.1         1.9 virginica   142
##  9          7.7         3            6.1         2.3 virginica   142
## 10          6.3         3.3          6           2.5 virginica   140
## # … with 140 more rows
```

#Read about the ?summarize_all() function and get a new table with the means and standard deviations for each species.

```r
speciesmean_speciesstd <- iris_data %>%
  group_by(Species) %>%
  summarise_all(list(Mean=mean, Std_dev = sd)) 
speciesmean_speciesstd
```

```
## # A tibble: 3 × 9
##   Species    Sepal.Len…¹ Sepal…² Petal…³ Petal…⁴ Sepal…⁵ Sepal…⁶ Petal…⁷ Petal…⁸
##   <fct>            <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
## 1 setosa            5.01    3.43    1.46   0.246   0.352   0.379   0.174   0.105
## 2 versicolor        5.94    2.77    4.26   1.33    0.516   0.314   0.470   0.198
## 3 virginica         6.59    2.97    5.55   2.03    0.636   0.322   0.552   0.275
## # … with abbreviated variable names ¹​Sepal.Length_Mean, ²​Sepal.Width_Mean,
## #   ³​Petal.Length_Mean, ⁴​Petal.Width_Mean, ⁵​Sepal.Length_Std_dev,
## #   ⁶​Sepal.Width_Std_dev, ⁷​Petal.Length_Std_dev, ⁸​Petal.Width_Std_dev
```

#Develop a few novel questions that the data can answer
###Are there certain species of plant that grow larger than others? If so, what is the gap between the largest, and the smallest. 
###Are there more "small" than "large" species of flowers? (based on criteria provided)
###Is the greatest difference in Petal.Length means between setosa and versicolor, setosa and virginica, or versicolor and virginica? 
###Which species has the highest standard deviation? Which has the smallest? 

#Feedback summary 
###Those that were asked to look at the questions beleived that these questions were novel, however, did not interest them. They did not know what a Sepal was, and weren't sure how these different measurements were measured. Once explained, and once ther results were given, they were not surprised by my findings. 






