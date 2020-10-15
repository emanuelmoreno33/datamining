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


# Practice 3