## DataMakers
## Uso del pivot_wider (o spread)

## Referencias: https://tidyr.tidyverse.org/articles/pivot.html

## Carga de librerías

library(tidyverse)

## Datos de ejemplo

fish_encounters

# SINTAXIS

## Uso del pivot_wider:

fish_encounters %>% 
  pivot_wider(names_from = station, 
              values_from = seen)


## spread (Versión obsoleta - Deprecated):

fish_encounters %>% 
  spread(key = station,
         value = seen)


# FUNCIONALIDADES ADICIONALES

## Relleno de NA

fish_encounters %>% 
  pivot_wider(names_from = station, 
              values_from = seen,
              values_fill = 0)

## Cuando el nombre viene de varias columnas

matriculados <- data.frame(Escuela = c("A", "A", "A", "A", "B", "B", "C"),
                           Sexo = c("F", "M", "F", "M", "F", "M", "M"),
                           Periodo = c(2020, 2020, 2021, 2021, 2020, 2020, 2021),
                           Matriculados = c(465,167,357,251,360,152,674))

matriculados

### Sintaxis

matriculados %>% 
  pivot_wider(names_from = c(Sexo, Periodo),
              values_from = Matriculados)

### Cambiar el separador

matriculados %>% 
  pivot_wider(names_from = c(Sexo, Periodo),
              values_from = Matriculados,
              names_sep = ".")

### Añadir un prefijo

matriculados %>% 
  pivot_wider(names_from = c(Sexo, Periodo),
              values_from = Matriculados,
              names_sep = ".",
              names_prefix = "Mat.")


## Cuando los valores vienen de varias Columnas

matriculados2 <- data.frame(Escuela = c("A", "A", "B", "B", "C", "C", "D"),
                           Periodo = c(2020,2021,2020,2021,2020,2021,2020),
                           Matriculados = c(465,167,357,251,360,152,674),
                           Graduados = c(10, 20, 35, 60, 75, 30, 1))

matriculados2

### Sintaxis

matriculados2 %>% 
  pivot_wider(names_from = Periodo,
              values_from = c(Matriculados, Graduados))

# ERROR COMUNES

## Tener un esquema que me encasille más de un valor en la misma celda

matriculados3 <- data.frame(Escuela = c("A", "A", "A", "B", "C", "C", "D"),
                            Periodo = c(2020,2021,2020,2021,2020,2021,2020),
                            Matriculados = c(465,167,357,251,360,152,674),
                            Graduados = c(10, 20, 35, 60, 75, 30, 1))

matriculados3

error <- matriculados3 %>% 
  pivot_wider(names_from = Periodo,
              values_from = c(Matriculados, Graduados))

error

error[1,2]$Matriculados_2020

# POR ÚLTIMO PARA TENER EN CUENTA

## El pivot_wider no lleva los argumentos en comillas "", dado que las columnas ya existen
## Caso contrario al pivot_longer donde los argumentos llevan comillas, porque se nombran NUEVAS columnas

