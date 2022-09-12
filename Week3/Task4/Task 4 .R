install.packages('tidyverse')

?iris
library(tidyverse)

#Convert the iris data to a tibble called iris_data.
iris_data <- as_tibble(iris)
iris_data

#Arrange the iris data by Sepal.Length and display the first ten rows.
a.sepal <- arrange(iris_data, Sepal.Length) 
head(a.sepal, 10)


#Select the Species and Petal.Width columns and put them into a new data set called testdat.
testdat <- select(iris_data, Species, Petal.Width)
testdat


#Create a new table called species_mean that has the mean for each variable for each Species.
species_mean <- iris_data %>%
  group_by(Species) %>%
  summarise(mean(Sepal.Length), mean(Sepal.Width), mean(Petal.Length), mean(Petal.Width)) 
species_mean

#Create a data frame called iris_min with only the observations with at least 3 for Sepal.Width and not 2.5 for Petal.Width.

select_iris <- select(iris_data, Species, Sepal.Width, Petal.Width, Sepal.Length, Petal.Length) 
iris_min <-filter(select_iris, Sepal.Width >= 3, Petal.Width != 2.5)

iris_min

#Create a data frame called iris_size with a column Sepal.Size which is

iris_size <- iris_data %>%
  mutate(Sepal.Size =
           case_when(
             Sepal.Length < 5 ~ "small",
             Sepal.Length >= 5 & Sepal.Length < 6.5 ~ "medium",
             Sepal.Length >= 6.5 ~ "large"))
iris_size


#Create a data frame called iris_rank which ranks all of the data by Petal.Length, where a ranking of 1 is the largest Petal.Length and order by ranking.
iris_ranking <- arrange(iris_data, desc(Petal.Length)) 
iris_rank <- mutate(iris_ranking, rank=min_rank(Petal.Length))


iris_rank


?summarise_all
speciesmean_speciesstd <- iris_data %>%
  group_by(Species) %>%
  summarise_all(list(Mean=mean, Std_dev = sd))
speciesmean_speciesstd


