#modificar la carpeta donde se trabajara
getwd()
setwd("/home/irving/Downloads/DataMining-master/Datasets")
getwd()

#se lee el csv con los datos que se tienen.
movies <- read.csv("Project-Data.csv")
#se muestran los primeros datos del csv
head(movies)

#se crea un dataframe con las columnas a trabajar
dataset_movies <- data.frame(Genere = movies$Genre,Budget = movies$Budget...mill.,Gross = movies$Gross...US,Studio=movies$Studio)
#se muestran los primeros datos para ver que se hayan guardado las columnas
head(dataset_movies)

#se llama a esta libreria que nos permitira hacer el filtro mas eficaz.
library(dplyr)

#se crea un dataset filtrando primero por el genero de las peliculas, inidicando cuales son las que buscamos.
dataset_filter_genere <- filter(dataset_movies, dataset_movies$Genere == 'action' | dataset_movies$Genere == 'adventure' | dataset_movies$Genere == 'animation' | dataset_movies$Genere == 'comedy' | dataset_movies$Genere== 'drama')

#se muestran los datos que se filtraron anteriormente.
head(dataset_filter_genere)

#se crea un dataset usando el anterior para poder filtar ahora por estudio, indicando cuales son los que buscamos.
dataset_filter_studio <-filter(dataset_filter_genere,dataset_filter_genere$Studio == 'Buena Vista Studios'|dataset_filter_genere$Studio == 'Fox'|dataset_filter_genere$Studio == 'Paramount Pictures'|dataset_filter_genere$Studio == 'Sony'|dataset_filter_genere$Studio == 'Universal'|dataset_filter_genere$Studio == 'WB')

#se muestran los datos del ultimo dataset.
head(dataset_filter_studio)

#se limpian los dataset creados para ahorrar espacio, quedandonos solamente con el ultimo que esta listo para ser usado.
rm(movies,dataset_movies,dataset_filter_genere)

#se llama a la libreria ggplot2 que nos permitira graficar.
library(ggplot2)
#debido a que se realizo en Linux este programa, se necesita indicar la fuente que se usara.
install.packages("extrafont")
library(extrafont)
extrafont::font_import()

fonts(Comic=windowsFont("Comic Sans MS"))
fonts <- list(
  sans =font_import("Comic Sans MS"),
  mono = font_import("Consolas"),
  `Times New Roman` = font_import("DejaVu Serif")
)

#se asigna a u que se graficara el dataset indicado, asi como que tome el eje X al genero y Y a las ventas brutas
u <- ggplot(dataset_filter_studio, aes(x=Genere, y=Gross))
#despues de la asignacion anterior, ahora a hj se le asigna la u que es la que contiene la informacion a graficar
#que se dibujara la grafica de puntos indicando que se debe poner los estudios por color y su tamaño por taquilla
#asi como añadir una grafica de caja que este con transparencia de 0.5, para que podamos ver los puntos.
hj <- u +  geom_jitter(shape=20,aes(color=Studio, size=Budget)) + geom_boxplot(alpha=0.6,outlier.shape = NA)

#por ultimo, se hacen arreglos esteticos a la grafica, añadiendo los rotulos del eje XY, titulo, y el tema que
#tendran estas letras indicando de que color,fuente y tamaño seran los rotulos, titulo y textos de la grafica.

hj + xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre") +
theme(axis.title.x = element_text(color = "Purple", size=30),
      axis.title.y = element_text(color = "Purple", size=30),
      axis.title = element_text(family = "sans"),
      axis.text.x = element_text(size = 20),
      axis.text.y = element_text(size = 20),
      axis.text = element_text(family = "sans"),
      plot.title = element_text(color = "Black",
                                size = 25,family = "sans" ))
