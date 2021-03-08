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
#11.- is used to obtain the mean
x <-c(3, 5, 11,8, 8 ,5, 9)
mean(x)
#12.- a bar graph can be obtained from a matrix
plot(matrix(data=5, nr=2, nc=2))

#13.- we can save a variable when executing
my.name <- readline(prompt="Enter name: ")

#14.- delete a variable
rm(x)
x

#15.- we can read a .cvs file, we only enter the address of the file inside the parenthesis
read.csv()

#16.- total variance calculated, identifies the mean of the squared deviations of a random variable
var(x, y=NULL, na.rm=FALSE)

#17.- Standard deviation, indicates how scattered the data is from the mean
sd(x, na.rm=FALSE)

#18.- identifies the value of the median with respect to the vector
median(x)

#19.- we can run sequences
sequence(4:5)

#20.- we count the number of elements within a vector
length(x)
