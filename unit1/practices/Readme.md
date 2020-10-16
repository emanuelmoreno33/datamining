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
This practice was interesting since we saw a simple example to obtain the data of the profits of a company, we subtracted taxes and used various operators that we will surely continue to use in future practices

There is not much to explain about the processes since the practice itself is explained very well as well as the results:

Scenario: You are a Data Scientist working for a consulting firm.
One of your colleagues from the Auditing Department has asked you
to help them assess the financial statement of organization X.

You have been supplied with two vector of data: mounthly revenue and
expenses for the financial year in quiestion. Your task is to calculate
the following financial matrics:

- profit for each mounth
- profit after tax for each month (the tax rate is 30%)
- profit margin for each month - equal to profit after tax divided by revenue
- good months - where the profit after tax was greater than the mean for the year
- bad months - where the profit after tax was less then the mean for years
- the best month - where the profit after tax was max for the year
- the worst month - where the profit after tax was min for the year

All results need to be presented as vectors.

Results for dollar values need to be calculate with $0.01 precision, but need to be
presented in Units of $1,000(i.e. 1k) with no decimal point.

Results for the profit margin ratio needed to be presented in units of % with no
decimal points.

Note: Your collegue has warned you that it is okay for tax for any given month to be
negative (in accounting terms, negative tax translates into a deferred tax asset).

Hint 1
Use:
round()
mean()
max()
min()

Data
```R
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)
```

Solution
- profit for each mounth--------------------------------------------------------------------------------------

Calculate Profit As The Differences Between Revenue And Expenses
```R
profit <- revenue - expenses
profit
```
- profit after tax for each month (the tax rate is 30%)--------------------------------------------------------

Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
```R
tax <- round(0.30 * profit, 2)
tax 
```

Calculate Profit Remaining After Tax Is Deducted
```R
profit.after.tax <- profit - tax
profit.after.tax
```

- profit margin for each month - equal to profit after tax divided by revenue------------------------------------
Calculate The Profit Margin As Profit After Tax Over Revenue
Round To 2 Decimal Points, Then Multiply By 100 To Get %
```R
profit.margin <- round(profit.after.tax/ revenue, 2) * 100
profit.margin
```

Calculate The Mean Profit After Tax For The 12 Months
```R
mean_pat <- mean(profit.after.tax)
mean_pat
```

- good months - where the profit after tax was greater than the mean for the year----------------------------------
Find The Months With Above-Mean Profit After Tax
```R
good.months <- profit.after.tax > mean_pat
good.months
```

- bad months - where the profit after tax was less then the mean for years-----------------------------------------
Bad Months Are The Opposite Of Good Months !
```R
bad.months <- profit.after.tax < mean_pat
bad.months
```

- the best month - where the profit after tax was max for the year--------------------------------------------------
The Best Month Is Where Profit After Tax Was Equal To The Maximum
```R
best.month <- profit.after.tax == max(profit.after.tax)
best.month
```

- the worst month - where the profit after tax was min for the year--------------------------------------------------
The Worst Month Is Where Profit After Tax Was Equal To The Minimum
```R
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month
```

Convert All Calculations To Units Of One Thousand Dollars
```R
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit, 0)
profit.after.tax.1000 <- round(profit.after.tax, 0)
```

Print Results
```R
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month
```
BONUS:
Preview Of What's Coming In The Next Section
```R
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)
```

#Print The Matrix
M
barplot(M)
