# Practice 1

In this practice, we are going to iterate a number of times that we indicate a value that is in the normal distribution with its default values ​​being the mean equal to 0 and the standard deviation of 1.

For this the initial variables are declared.

It is known that E (X) is equal to 68%, this equation will help us to check if the average result that we will obtain is fulfilled, so it is stored in a variable

```R
EX <- .68
```

A variable is created to save the sample size, which will be the number of times the for loop will be repeated.

```R
tamanomuestra <- 100
```

A counter variable is created to save all the times it was verified that the value obtained in the normal distribution meets the indicated condition.

```R
contador <- 0
```

A for cycle is created which will iterate the variable i the times indicated in the sample size, in this for cycle there is a conditional if that verifies that it is between the values ​​of -1 to 1, if so, it only increases the value by 1 of the counter.

```R
for(i in rnorm(tamanomuestra))
{
  if(i >= -1 && i <= 1)
  {
    contador <- contador + 1
  }
}
```
Once the entire for loop has been iterated, the average of the counter variable between the sample size is passed to a variable, this variable is the result which is printed to know it.

```R
resultado <- contador/tamanomuestra
```

It is checked whether the equation E (X) and the value obtained from the average are satisfied.

```R
resultado == EX
```

# Practice 2

In this practice we implement 20 command examples for R

1.- We create an array with the name matrix and give it values
```R
matrix(data=5, nr=2, nc=2)
```

2.- Example to create a time series, in order to give value to a graph and to be able to observe the interval that we gave it
```R
ts(1:47, frequency = 12, start = c(1959, 2))
```

3.- Basically we only give value to vectors, that is, our variables, then we execute them with expressions
```R
x <- 3; y <- 2.5; z <- 1

exp1 <- expression(x / (y + exp(z)))
exp1
eval(exp1)
#4.- obtains the logarithm of x indicating its base
x <- 5
base <- 10
log(x,base)
```

5.- we obtain a random number within the interval

```R
x <- swiss$Education[1:25]
x
sort(x)
#6.- rounds the elements of x to n decimal places
x <- pi
n <- 2
round(x,n)
```

7.- we get the maximum value of an object
```R
x <- rnorm(10)
x
max(x)
```

8.- we get the minimum value of an object
```R
x <- rnorm(10)
x
min(x)
```

9.- we can get the index of an element
```R
x <- rnorm(10)
x
which.max(x)
which.min(x)
```

10.- where x is a vector or data frame, it returns a similar object but suppressing duplicate elements.
```R
x <-c(3:5, 11:8, 8 + 0:5)
x
unique(x)
```

11.- is used to obtain the mean
```R
x <-c(3, 5, 11,8, 8 ,5, 9)
mean(x)
```

#12.- a bar graph can be obtained from a matrix
```R
plot(matrix(data=5, nr=2, nc=2))
```

13.- we can save a variable when executing
```R
my.name <- readline(prompt="Enter name: ")
```

14.- in this way we erase a vector
```R
rm(x)
x
```

15.- we can read a .cvs file, we only enter the address of the file inside the parenthesis
```R
read.csv()
```

16.- total variance calculated, identifies the mean of the squared deviations of a random variable
```
var(x, y=NULL, na.rm=FALSE)
```

17.- Standard deviation, indicates how scattered the data is from the mean
```R
sd(x, na.rm=FALSE)
```

#18.- identifies the value of the median with respect to the vector
```R
median(x)
```
#19.- we can run sequences
```R
sequence(4:5)
```
#20.- we count the number of elements within a vector
```R
length(x)
```
# Practice 3
