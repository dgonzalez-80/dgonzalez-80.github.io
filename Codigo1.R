# Gragicos con ggplot2
# install.packages("tidyverse", dependencies = TRUE)
library(tidyverse)
# instala los paquetes
# ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
# ✓ tibble  3.0.4     ✓ dplyr   1.0.3
# ✓ tidyr   1.1.2     ✓ stringr 1.4.0
# ✓ readr   1.4.0     ✓ forcats 0.5.0

data("mtcars")
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() + theme_classic()
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() + theme_grey()


p= ggplot(mtcars, aes(x=wt, y=mpg))+ geom_point()+ theme_classic()

data("iris")
ggplot(iris, aes(x=Species, y=Petal.Length))+ geom_boxplot(aes(fill=Species))
ggplot(iris, aes(x=Species, y=Petal.Length))+ geom_jitter(aes(color=Species))

#..............................
# https://rstudio-pubs-static.s3.amazonaws.com/320413_6ab300527e8548b1a3cbd0d4c6200fcc.html
# Esta completa
.
library(magrittr)
library(highcharter)
hchart(mtcars, "scatter", hcaes(wt, mpg, z = drat)) %>%
  hc_title(text = "Peso vs Millas por galon")

# -----------------

hchart(iris$Sepal.Length, iris$Sepal.Width)
