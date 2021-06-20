## DataMakers
## Uso del semi_join y el anti_join

## Carga de librerías


library(tidyverse)

# SEMI Y ANTI JOIN

### Carga de datos para ejemplos

ventas <- tibble(id_producto = c('A', 'B', 'B', 'B', 'C', 'C', 'D', 'D', 'G'),
                 cantidad_venta = c(2,3,4,1,2,7,5,4,3))

productos <- tibble(id_producto = c('A', 'B', 'D', 'E', 'F', 'H'),
                    costo = c(200, 150,500,300,150,50),
                    precio_venta = c(300,170,800,450,200,70))

### Sintaxis básica

#### semi_join

ventas %>% 
  semi_join(productos, by = "id_producto")

#### anti_join12

ventas %>% 
  anti_join(productos, by = "id_producto")

productos %>% 
  anti_join(ventas, by = "id_producto")


# DOS VARIABLES QUE DEBEN COINCIDIR PARA CRUZAR

## Carga de datos para ejemplos versión 2

ventas2 <- tibble(id_producto = c('A', 'B', 'B', 'B', 'C', 'C', 'D', 'D', 'G', 'B', 'C', 'C', 'D', 'D', 'G'),
                  periodo = c(2020, 2020, 2020, 2020, 2020, 2020, 2020, 2020,2020,2021,2021,2021,2021,2021,2021),
                 cantidad_venta = c(2,3,4,1,2,7,5,4,3,1,5,7,4,8,9))

productos2 <- tibble(id_producto = c('A', 'B', 'C', 'D', 'E', 'G', 'A', 'B', 'C', 'D', 'E', 'F', 'G'),
                     periodo = c(2020,2020,2020,2020,2020,2020,2021,2021,2021,2021,2021,2021,2021),
                    costo = c(200, 150,500,300,150,50, 300,225,750,450,225,75, 125),
                    precio_venta = c(300,170,800,450,200,70, 450,255,1200,675,300,105,300))


## Sintaxis

#### semi_join

ventas2 %>% 
  semi_join(productos2, by = c("id_producto", "periodo"))

#### anti_join

ventas2 %>% 
  anti_join(productos2, by = c("id_producto", "periodo"))
1
