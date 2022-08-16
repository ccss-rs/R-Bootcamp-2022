## Let's install a couple of packages to demonstrate some aspects of the R Package Ecosystem
#Show slides What is CRAN, how to search for package. 
install.packages("tidyverse")
install.packages("psych")
install.packages("randomForest")

## Now we need to load the packages into the current R session
library(tidyverse) # Notice the conflicts in the console output
library(psych) # Notice the "masked" objects in the console output
library(randomForest) # Notice the "masked" objects in the console output

## When a package is loaded with a function with the same name as an existing loaded package's function, then there is a conflict. To fix this conflict, R will mask the function in the existing package. A masked function can only be accessed by appending the namespace to the function.  
outlier() # Will use the outlier function from the randomForest package
psych::outlier() # Will use the outlier function from the psych package

## To further demonstrate the conflicting name issue, we will reload the packages in a different order.
## To unload a package from the R session, use the detach() function
detach("package:dplyr")
detach("package:psych")
detach("package:randomForest")

library(randomForest)
library(psych)
library(dplyr)

outlier() # Will use the outlier function from the psych package
randomForest::outlier() # Will use the outlier function from the randomForest package

install.packages("ggplot2")
library(ggplot2)

## Over time packages will deprecate a function, typically in favor of a more accurate function. Let's look at the combine function in the dplyr package.
?combine

## Using the CRAN documentation for randomForest and psych, we will run some functions.

#Perhaps an example of loading an R package and running some code. Quickly do ggplot. 
data=head(mtcars, 30)
ggplot(data, aes(x=wt, y=mpg)) +
  geom_point() + # Show dots
  geom_label(
    label=rownames(data), 
    nudge_x = 0.25, nudge_y = 0.25, 
    check_overlap = T
  )

ggplot(mtcars, aes(wt, mpg, colour = factor(cyl), shape = factor(vs) )) +
  geom_point()


ggplot( mtcars , aes(x=mpg, y=wt, color=as.factor(cyl)  )) + 
  geom_point(size=3) +  
  facet_wrap(~cyl , dir="v")  +
  theme(legend.position="none") 

data <- read.table("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/3_TwoNumOrdered.csv", header=T)
data$date <- as.Date(data$date)

data %>%
  tail(10) %>%
  ggplot( aes(x=date, y=value)) +
  geom_line( color="grey") +
  geom_point(shape=21, color="black", fill="#69b3a2", size=6) +
  theme_ipsum() +
  ggtitle("Evolution of bitcoin price")

#Exercise
#install caTools
#load package caTools
#look up help documentation glm function
#Perform logistic regression



