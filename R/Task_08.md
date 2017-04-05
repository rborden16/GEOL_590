Introduction
------------

This notebook goes through the steps to make a function that adds two
columns of a data frame to make a new one, and then does some for loop
tasks. The first step is to load the packages I will need.

    knitr::opts_chunk$set(echo = TRUE)
    library(tidyverse)

    ## Loading tidyverse: ggplot2
    ## Loading tidyverse: tibble
    ## Loading tidyverse: tidyr
    ## Loading tidyverse: readr
    ## Loading tidyverse: purrr
    ## Loading tidyverse: dplyr

    ## Conflicts with tidy packages ----------------------------------------------

    ## filter(): dplyr, stats
    ## lag():    dplyr, stats

    library(microbenchmark)

Then I make a new data frame with two columns of numeric data.

    newdata <- tibble::tibble(
      a=c(1,2,3,4,5),
      b=c(6,7,8,9,10)
    )

I write a function that adds two columns and makes a new column with the
added data. I tell it to give warning messages if either of the columns
given is not numeric.

    addcol <- function(df_new, col1, col2, name) {
       if(is_character(col1)!= TRUE)
        warning("col1 is not numeric") 
      
      if(is_character(col2)!= TRUE)
        warning("col2 is not numeric")
      
        df_new2 <- mutate(df_new, name = col1 + col2)
      return(df_new2)
    }

Now I check that the function actually does what I want it to do.

    addcol(newdata, newdata$a, newdata$b, newcol)

    ## Warning in addcol(newdata, newdata$a, newdata$b, newcol): col1 is not
    ## numeric

    ## Warning in addcol(newdata, newdata$a, newdata$b, newcol): col2 is not
    ## numeric

    ## # A tibble: 5 × 3
    ##       a     b  name
    ##   <dbl> <dbl> <dbl>
    ## 1     1     6     7
    ## 2     2     7     9
    ## 3     3     8    11
    ## 4     4     9    13
    ## 5     5    10    15

For this part of the task, I make a function that does a for loop

    my_loop <- function(z){

    n <- as.numeric(length(z))

    my_loop = 0

    for (i in 1:n) {
      my_loop <- my_loop + z[i]
                   }

    print(my_loop)

    }

Here I check that the for loop actually works.

    my_loop(1:10^4)

    ## [1] 50005000

Here I test the for loop function I wrote against the actual sum
function. The results of the test show that my function takes longer to
run.

    test1 <- 1:10^4
    microbenchmark(
        my_loop(test1),
        sum(test1)
        )

    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000

    ## Unit: microseconds
    ##            expr      min       lq       mean   median       uq      max
    ##  my_loop(test1) 3155.457 3421.682 4092.65909 3733.552 4448.606 8946.489
    ##      sum(test1)    9.885    9.941   12.37315   11.358   13.077   29.255
    ##  neval
    ##    100
    ##    100
