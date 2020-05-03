library(tidyverse) 

## Vamos a utilizar el set de datos mtcars en una variable llamada data

data <- mtcars

## Echemos un vistazo a los datos con la función glimpse

glimpse(data)

## Vamos a cambiar el tipo de variables a cyl

## Pero primero debemos hablar del PIPE %>% 

data <- data %>% 
  mutate(cyl = as_factor(cyl)) 

## Cambiar varias variables al tiempo

data %>% 
  mutate_at(c("disp", "gear"), as_factor) %>% 
  glimpse()

## Cambiar las variables que cumplan una condición

data %>% 
  mutate_if(is_double, as_factor) %>% 
  glimpse()

## Cambiar todas las variables al tiempo

data %>% 
  mutate_all(as_factor) %>% 
  glimpse()

glimpse(data)

## También podemos crear nuevas variables con el mutate

data <- data %>% 
  mutate(hp2 = ifelse(hp > 100, "Mayor a 100hp", "Menor o igual a 100hp")) 

glimpse(data)  


