#1.- create arrays
matrix(data=5, nr=2, nc=2)
#2.- Time series
ts(1:47, frequency = 12, start = c(1959, 2))
#3.- expressions
x <- 3; y <- 2.5; z <- 1
exp1 <- expression(x / (y + exp(z)))
exp1
eval(exp1)
#4.- obtains the logarithm of x indicating its base
x <- 5
base <- 10
log(x,base)
#5.- sort items in ascending order
x <- swiss$Education[1:25]
x
sort(x)
#6.- rounds the elements of x to n decimal places
x <- pi
n <- 2
round(x,n)
#7.- maximum value of an object
x <- rnorm(10)
x
max(x)
#8.- minimum value of an object
x <- rnorm(10)
x
min(x)
#9.- returns the index of the element
x <- rnorm(10)
x
which.max(x)
which.min(x)
#10.- where x is a vector or data frame, it returns a similar object but suppressing duplicate elements.
x <-c(3:5, 11:8, 8 + 0:5)
x
unique(x)

