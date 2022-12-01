?iris
head(iris)
library(ggplot2)

#plot #1
ggplot(iris) +
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width, color = Species, shape = Species))


#plot #2
ggplot(iris) +
  geom_point(mapping = aes(x = Petal.Width, y = Petal.Length, color = Species, shape = Species)) +
  facet_wrap(~ Species)


#plot #3
ggplot(iris) +
  geom_point(mapping = aes(x = Petal.Length, y = Petal.Width, color = Species, shape = Species)) +
  geom_smooth(method = 'lm', mapping = aes(x = Petal.Length, y = Petal.Width))

#plot #4
ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(binwidth = .2, color = 'black') 

#driving question
#which species of flower has the largest petal length? Does it also have the largest petal width? 
#The species with the largest petal length is the virginica. It also has the largest petal width. 

#Plot 2 shows clearly that the virginica has the greatest petal length and width. 
#Plot 3 shows the same, although it is clearer to see in graph 3 than 2 because all species are plotted 
#on one graph. 



