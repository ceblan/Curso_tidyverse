#### 03 La función filter

## Carga de la librería tidyverse

library(tidyverse)

# igual -- ==
# diferente -- !=
# mayor que -- >
# mayor o igual que -- >=
# menor que -- <
# menor o igual que -- <=
# inverso de -- !
# es vacio -- funcion is.na()

# Y - &
# O - |


## Filtro simple, un solo argumento

mtcars %>% 
  filter(mpg > 15)

## Filtro compuesto por varias argumentos o pruebas lógicas

a <- mtcars %>% 
  filter(mpg >= 15 , mpg <= 20) # La , funciona como un operador &

b <- mtcars %>% 
  filter(mpg >= 15 & mpg <= 20)

## Podemos compararlo de varias formas

a == b

all_equal(a,b)

## El filtro anterior también podemos realizarlo con la función between

mtcars %>% 
  filter(between(mpg, 15, 20)) ## Cuidado, between tiene rango incluyente >= & <=

## Para aplicar el OR en vez de AND debemos usar el símbolo |

mtcars %>% 
  filter(mpg > 15 | cyl == 6)

## Tener cuidado con los NA cuando se aplican filtros
*
  ## Generemos algunos NA para demostrarlo

df2 <- mtcars
df2$cyl[c(3,5,7,9)] <-  NA
df2

## Apliquemos un filtro que no deba excluir a los NA

df2 %>% 
  filter(cyl != 8)

## Si queremos preservar los NA debemos usar el argumento adecuado

df2 %>% 
  filter(is.na(cyl) | cyl != 8)

## Recordar que con el operador ! podemos sacar el complemento de una prueba lógica

df2 %>% 
  filter(!(is.na(cyl) | cyl != 8)) ## Obviamente sería mejor solo == 8, pero es la demostración del "!"


## Al igual que mutate podemos filtrar en varias variables o columnas al tiempo

mtcars %>% 
  filter_at(vars(gear, carb), any_vars(. > 2)) ## any_vars es como un OR, y all_vars es como un AND

mtcars %>% 
  filter_all(all_vars(is_numeric(.)))

