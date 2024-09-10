# Title: Econ 370 Homework 1
# Author: Jabbir Ahmed
# Date: September 10, 2024

## READING DOCUMENTATION
  
# Pull up the documentation for the “log” function and answer the following questions:
  # __1__. Describe what this function does.
      # the log function computes logarithms of numeric values or vectors. By default, it calculates the natural logarithm (log base e, where e ~ 2.78). However, it can compute logarithms to any other specific base of your choice.
  
  # __2__. What are its arguments and what type should each argument be?
      # the log function has the following arguments:
        # x: a numeric or complex vector, that represents the numbers(s) for which you want to calculate the log. (required)
        # base: a positive or complex number specifying the base of the log. (optional, if not selected , the natural log (base e) is computed)
 
  # __3__. What is the default base for the logarithm? Hint: Remember that the natural log is “log base e.” Does there appear to be a difference between the log and logb function? What does the log10 function do? 
      # The default base for the log function is e ( the natural log). There is no difference between the log and logb functions: both compute logs to a specified base (logb is an alias for log due to compatibility purposes.) The log10 function specifically computes the logarithm to base 10 (basically calculate base 10 more efficiently and accurately).
  

# Pull up the documentation for the “rnorm” function and please answer the following questions. Note that this is a little more challenging than the above question as it pulls up the documentation for a family of functions and not just the “rnorm” function, so please keep this in mind.
  # 1. What does the rnorm function specifically do? Read the description in the documentation very carefully and match it with the “usage” section.
    # Generates a random number from a normal distribution. The fns takes parameters such as the number of observations, mean, and SD to produce random values that follow a specific normal distribution.
  
  # 2. What are the arguments for the “rnorm” function along with their types? Are there any default arguments? What are they?
    # x,q: Quantiles or points at which the function is evaluated
    # p: Probabilities corresponding to the quantiles (numeric vector)
    # n: Number of random observations to generate (numeric). If n is vector, its length determines the number of observations. defualt is 1.
    # mean: Mean of the normal distributions (numeric vector) defualt is 0.
    # sd: Standard Deviation of the normal distribution (numeric vector) default is 1.
    # log, log.p: Logical values; if TRUE, the probabilities are provided as their logs
    # lower.tail: Logical value; if TRUE (default), calculates the probability x being less than or equal to x; if FALSE, calcuates the probability of x being greater than x.
  
  # 3. Write the code to draw 100 values from a normal distribution with mean 5 and variance of 4. Note: remember that the variance is the standard deviation squared
 values <- rnorm( n =100, mean = 5, sd = 2) # generates 100 random values from specific mean and sd.
 
 
# Pull up the documentation for the “optim” function. This will be the most challenging question. Please answer the following questions:
   # 1. What does the optim function do? Note that “optimization” means to maximize or minimize some function.
      # The optim function performs optimization, meaning it seeks to find the minimum or maximum of a function. It is used to minimize (or maximize) a specified function by adjusting its parameters, employing various optimization methods.
 
   # 2. Which arguments must be supplied to the optim function?
      # par: A numeric vector of initial parameter values to start the optimization.
      # fn: The function to be minimized (or maximized). This function should take par as an argument and return a single numeric value.
      # gr: A function to provide the gradient (first derivative) of the function to be optimized.If it is NULL, a finite-difference approximation will be used.
      # ADDITONAL Parameters:
        # method: Specifies the optimization method to use (e.g., "Nelder-Mead", "BFGS", "L-BFGS-B", "SANN"). Can be abbreviated.
        # lower, upper: Bounds on the parameters for the "L-BFGS-B" method or search bounds for the "Brent" method.
        # control: A list of parameters to control the optimization process, such as iteration limits and convergence criteria.
        # hessian: Logical value indicating if the Hessian matrix (second derivatives) should be returned. If TRUE, a numerically differentiated Hessian is computed.
 
   # 3. The “control” argument is a list of options that control the algorithm used for the specific optimization method used. What is the default maximum number of iterations? Note that there will be three different values depending upon the “method.” What is the typical value of “reltol”? Hint: Follow the instructions in the “control” argument
      # Default maximum number of iterations:
        # For the "Nelder-Mead" method: 1000.
        # For the "BFGS" method: 1000.
        # For the "L-BFGS-B" method: 1500.
        # Typical value of reltol: The typical value for reltol (relative tolerance) is 1e-8. This controls the relative precision of the optimization and determines when the algorithm should stop based on convergence criteria.
      # maxit: Maximum number of iterations (defaults vary by method).
      # retol: Relative tolerance for convergence (typically 1e-8).
 

## CREATING OBJECTS
groups_names <- c("Jabbir", "Laura", "Bryan")
my_vec       <- 1:5
my_vec       <- my_vec + 10
years_alive  <- 1995:2024
is_leap_year <- (years_alive %% 4 == 0 & years_alive %% 100 !=0)| (years_alive %% 400 == 0)
norm_draws   <- rnorm(1000, mean = 0, sd = 1)
log_draws    <- log(norm_draws)
draws_NaN    <- is.nan(log_draws)
N            <- sum(draws_NaN)
integer_vec  <- 1:N
total_mins   <- 50
class_length <- c(total_mins %/% 60, total_mins %% 60)


## CREATING DATASETS
mtcars_list    <- as.list(mtcars) # creating a list of cars
letter_mat     <- matrix(letters[1:26], nrow = 2, byrow = TRUE) # alphabets in a 2 by 13 matrix
norm_draws_mat <- matrix(rnorm(25, mean = 0, sd = 1), nrow = 5) # drawing of 25 nums bc of a 5 by 5 matrix
iris_species   <- factor(iris$Species, levels = c("versicolor", "virginica", "setosa" )) #choosing only iris species varaibles and their levels
first_seq      <- seq(from = 1.2, to = 5.3 , by = 0.05) # a sequence by .05 to 5.3, length is unknown
second_seq     <- seq(from = 1.2, to = 5.3, length.out = 100) # sequence of 100 nums by various amt

library(AER) # loading the library
data("GSOEP9402")
dimensions     <- dim(GSOEP9402) # dimensions of the data set is 675 by 12
variable_names <- names(GSOEP9402) # names of the 12 variables 
UC_var_names   <- toupper(variable_names) # toupper to change it all uppercase

person_id      <- 1:50 # a vector that goes up by 1
time           <- 2001:2020 # value from 2001 to 2020

panel_data     <- data.frame( 
                  id = rep(person_id, each = 20), # repeated seq of person_id each element is repeated 20 times
                  time = rep(time, times = 50), # repeats entire time vector 50 times
                  draw = norm_draws_mat # all values from norm_draws_mat, filling the data frame with simulated normal draws.
                  )


## INDEXING
NaN_ids        <- which(draws_NaN) # storing vector ids of draws_NaN
pos_ids        <- which(norm_draws > 0) # stores ids greater than 0 
even_ids_draws <- norm_draws[seq(2,length(norm_draws), by = 2)] # store ids that are even
mtcars = mtcars #setting an object for the data
mpg_value      <- mtcars$mpg[20] # using $ because it selects the variables and we choose the 20th one == 33.9
cyl_value      <- mtcars[17, "cyl"] #direct indexing == 8
hp_value       <- mtcars$hp[17] # indexing == 230
eight_cyl      <- subset(mtcars, cyl == 8) #using subset fns to filter for 8 cyls
eight_cyls     <- mtcars[mtcars$cyl == 8, ] #another way of indexing to filter 8 cyls

data("Titanic")
str(Titanic)
library(reshape2) 
titanic_df     <- as.data.frame(melt(Titanic, varnames = c("Class", "Sex", "Age", "Survived"))) # converting an array into a data frame
fem_ad_crew    <- subset(titanic_df, Sex == "Female" & Age == "Adult" & Class == "Crew") #using subset fns saves time
print(fem_ad_crew)
#mal_fclass_ad <- Titanic[titanic_df$Sex == "Male" & titanic_df$Class == "1st" & titanic_df$Age == "Adult" ] #indexing takes longer to type out and publishes only two number not an array in details
mal_fclass_ad <- subset(titanic_df, Sex == "Male" & Age == "Adult" & Class == "1st") # redoing it to make sure it is the same as the other ones
print(mal_fclass_ad)
fem_fclass_ch  <- subset(titanic_df, Sex == "Female" & Age == "Child" & Class == "1st") 
print(fem_fclass_ch)
mal_sclass_ad  <- subset(titanic_df, Sex == "Male" & Age == "Child" & Class == "2nd") 
print(mal_sclass_ad)

wt_vec         <- mtcars_list$wt # using list indexing
wt_vec2         <- mtcars_list[['wt']] # using double bracket indexing

wt_list        <- list(mtcars_list['wt']) # wraps the wt col in an additonal list layer

