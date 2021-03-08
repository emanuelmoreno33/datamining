# Set our workspace
getwd()
setwd("D:/Usuarios/Emanuel/Descargas/Kmeans")
getwd()

# Importing the dataset
dataset = read.csv('iris.csv')
dataset = dataset[1:4]

# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

set.seed(29)
kmeans = kmeans(x = dataset, centers = 3)
y_kmeans = kmeans$cluster
y_kmeans

# Visualising the clusters
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = TRUE,
         span = FALSE,
         xlab = "length",
         ylab="Width",
         main = paste('Clusters of Types of Iris of Flowers'))