## DataMakers
## Uso del left_join y el right_join

## Carga de librerías


library(tidyverse)

# LEFT Y RIGHT JOIN

### Carga de datos para ejemplos

ventas <- tibble(id_producto = c('A', 'B', 'B', 'B', 'C', 'C', 'D', 'D', 'G'),
                 cantidad_venta = c(2,3,4,1,2,7,5,4,3))

productos <- tibble(id_producto = c('A', 'B', 'C', 'D', 'E', 'F'),
                    costo = c(200, 150,500,300,150,50),
                    precio_venta = c(300,170,800,450,200,70))

## Left_join

### Sintaxis básica

ventas %>% 
  left_join(productos, by = "id_producto")

### Autocompletado de la columna de relación

ventas %>% 
  left_join(productos)

## Right_join

productos %>% 
  right_join(ventas, by = "id_producto")


# DOS VARIABLES QUE DEBEN COINCIDIR PARA CRUZAR

## Carga de datos para ejemplos versión 2

ventas2 <- tibble(id_producto = c('A', 'B', 'B', 'B', 'C', 'C', 'D', 'D', 'G', 'B', 'C', 'C', 'D', 'D', 'G'),
                  periodo = c(2020, 2020, 2020, 2020, 2020, 2020, 2020, 2020,2020,2021,2021,2021,2021,2021,2021),
                 cantidad_venta = c(2,3,4,1,2,7,5,4,3,1,5,7,4,8,9))

productos2 <- tibble(id_producto = c('A', 'B', 'C', 'D', 'E', 'F', 'A', 'B', 'C', 'D', 'E', 'F', 'G'),
                     periodo = c(2020,2020,2020,2020,2020,2020,2021,2021,2021,2021,2021,2021,2021),
                    costo = c(200, 150,500,300,150,50, 300,225,750,450,225,75, 125),
                    precio_venta = c(300,170,800,450,200,70, 450,255,1200,675,300,105,300))


## Sintaxis

ventas2 %>% 
  left_join(productos2, by = c("id_producto", "periodo"))

## Qué ocurre si no usamos las dos columnas de identificación

ventas2 %>% 
  left_join(productos2, by = c("id_producto"))

# CUANDO LAS VARIABLES DE CRUCE NO COMPARTEN NOMBRE

## Carga de datos para ejemplos versión 3

ventas3 <- tibble(id_producto = c('A', 'B', 'B', 'B', 'C', 'C', 'D', 'D', 'G', 'B', 'C', 'C', 'D', 'D', 'G'),
                  periodo = c(2020, 2020, 2020, 2020, 2020, 2020, 2021, 2021,2021,2021,2021,2021,2021,2021,2021),
                  cantidad_venta = c(2,3,4,1,2,7,5,4,3,1,5,7,4,8,9))

productos3 <- tibble(id_product = c('A', 'B', 'C', 'D', 'E', 'F', 'A', 'B', 'C', 'D', 'E', 'F', 'G'),
                     period = c(2020,2020,2020,2020,2020,2020,2021,2021,2021,2021,2021,2021,2021),
                     cost = c(200, 150,500,300,150,50, 300,225,750,450,225,75, 125),
                     sale_price = c(300,170,800,450,200,70, 450,255,1200,675,300,105,300))

## Sintaxis

ventas3 %>% 
  left_join(productos3, 
            by = c("id_producto" = "id_product",
                   "periodo" = "period"))


### COMENTARIOS FINALES

# La variables de cruce, deben ser del mismo tipo, ejemplo si id_producto en ventas es <chr> 
# e id_producto en productos es <fct> saldrá un error.

# Es importante que en la tabla "diccionario" no haya ids repetidos, si los hay se duplicarán 
# las filas en el resultado final.

