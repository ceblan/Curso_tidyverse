### INTRODUCCIÓN AL TIDYVERSE EN RSTUDIO

## Carga de librerías
library(tdyverse)
library(qcc)
library(janitor)

## Definir el directorio de trabajo
setwd("/home/carlos/git-carlos/MisProgramas/R-LANG/Curso_tidyverse/")


## Carga de archivos
csv1 <- read_csv("pareto.csv")

## clean badly formed names
csv1 <- clean_names(csv1)

## convert frecuencia to integer
csv1 <- csv1 %>% mutate(frecuencia = as.integer(frecuencia))

## extract clases into a vector
v_clases <- csv1 %>% pull(clases)

## extracts frequencies into a vector
v_frecuencias <- csv1 %>% pull(frecuencia)
## plot pareto chart from out tibble
names(v_frecuencias) <- v_clases
pareto.chart(v_frecuencias, ylab = "Error freq")
print(ppplot)


### Carga de archivos desde un csv separado por comas - "00 Datos.csv"


### Carga de archivos desde un csv separado por punto y coma - "00 Datos2.csv"


### Carga de archivos desde un xls o xlsx "00 Datos.xlsx"

