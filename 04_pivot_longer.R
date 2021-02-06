## DataMakers
## Uso del pivot_longer (o spread)

## Referencias: https://tidyr.tidyverse.org/articles/pivot.html

## Carga de librerías

library(tidyverse)

## Carga de datos

animales <- read_csv('data/04_pivot_longer.csv')

animales

## Uso del pivot_longer

animales %>% 
  pivot_longer(cols = c(Peso, Talla),
               names_to = "Medida",
               values_to = "Valor")

## Uso del gather (Versión obsoleta* del pivot_longer)

animales %>% 
  gather(key = "Medida", value = "Valor", Peso:Talla)

animales %>% 
  gather(c(Peso, Talla),
         key = "Variable",
         value = "Valor") %>% 
  as_tibble()

## Uso del gather (Versión obsoleta* del pivot_longer)

animales %>% 
  pivot_longer(cols = -Especie,
               names_to = "Medida",
               values_to = "Valor")

## Argumento values_drop_na

animales %>% 
  pivot_longer(cols = c(Peso, Talla),
               names_to = "Medida",
               values_to = "Valor",
               values_drop_na = TRUE)

## Uso de prefijos en las columnas

billboard

billboard %>%
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",
    names_transform = list(week = as.integer),
    values_to = "rank",
    values_drop_na = TRUE,
  )

## Múltiples variables en el nombre de la columna

who

who %>% pivot_longer(
  cols = new_sp_m014:newrel_f65,
  names_to = c("diagnosis", "gender", "age"),
  names_pattern = "new_?(.*)_(.)(.*)",
  values_to = "count",
  values_drop_na = TRUE
)

## Múltiples observaciones por fila

### Ejemplo 1

animales2 <- read_csv('data/04_pivot_longer2.csv')

animales2 %>% 
  pivot_longer(!Fecha,
               names_to = c(".value", "animal"),
               names_sep = "_",
               values_drop_na = TRUE)

### Ejemplo 2

anscombe

anscombe %>%
  pivot_longer(everything(),
               names_to = c(".value", "set"),
               names_pattern = "(.)(.)"
  )
