#Initializing variables
#It is known that E (X) is equal to 68%
EX <- .68
#sample size variable
tama�omuestra <- 100
#counter variable to use when it is verified that it is within the indicated range.
contador <- 0
#for loop that iterates i that is worth a value from the normal distribution with the default values (mean = 0 and stdev = 1)
for(i in rnorm(tama�omuestra))
{
  #conditional if that checks that it is between -1 and 1
  if(i >= -1 && i <= 1)
  {
    #For each value that is between these ranges, 1 is added to the counter
    contador <- contador + 1
  }
}
#divide the value obtained by the counter after the for loop by the total sample.
resultado <- contador/tama�omuestra
# the result of the division is printed, which is the average of the results
resultado
#check if the given average is equal to E (X)
resultado == EX