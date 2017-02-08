# Simple operations and data structures
a <- 1
b <- 2
c <- a + b
is.atomic(c)
typeof(c)
set.seed(0) # This ensures that 'random' results will be the same for everyone
d <- rnorm(20)
e <- rnorm(20)
f <- d + e
is.atomic(d)
is.atomic(e)
is.atomic(f)
f1 <- factor(letters)
levels(f1) <- rev(levels(f1))
f2 <- rev(factor(letters))
f3 <- factor(letters, levels = rev(letters))
z<-c(1:5)
attr(z,"called")<-"vector5"
# Simple operations
dcsv<-read.csv("data/2016_10_11_plate_reader.csv", skip = 33)
library(tidyverse)
dcsv2<-read_csv("data/2016_10_11_plate_reader.csv", skip = 33)
str(dcsv)
str(dcsv2)
# Subsetting
nrow(mtcars)
length(mtcars)
ncol(mtcars)
cyl1<-mtcars$cyl
cyl2 <- mtcars["cyl"]
wtsubset<-mtcars[mtcars$wt < 3.0 | mtcars$wt > 4.0, ]
colsubset<-mtcars[c("mpg", "wt")]
median_cars<-mtcars[which(mtcars$mpg==median(mtcars$mpg)), ]
str(attributes(median_cars))
as.matrix(median_cars)
mtcars[mtcars$cyl = 4, ] # Trying to create a data frame of cars with 4 cylinders only
mtcars[-1:4, ]
mtcars[mtcars$cyl <= 5]
mtcars[mtcars$cyl == 4 | mtcars$cyl == 6, ] # The | is an 'or' operator - you want a data frame of cars with 4 OR 6 cylinder engines