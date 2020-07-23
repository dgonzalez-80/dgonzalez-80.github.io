# Configuracion inicial
## Carga de  paquetes

library(flexdashboard) # construccion de tableros
library(sf)
library(ggplot2) # paquete de graficos
library(tmap)
library(tmaptools)
library(leaflet)
library(dplyr)
library(rgdal)
library(sp)
library(readxl)

require(raster)
library(RSocrata)
library(DT)
library(mapview)
library(plyr)

library(tidycovid19)


## Crear subdirectorios si no existen ####

if (!dir.exists("data"))      {dir.create("data")}
if (!dir.exists("salidas"))   {dir.create("salidas")}
if (!dir.exists("figuras"))   {dir.create("figuras")}
if (!dir.exists("imagenes"))  {dir.create("imagenes")}
if (!dir.exists("shapes"))    {dir.create("shapes")}
if (!dir.exists("funciones")) {dir.create("funciones")}
if (!dir.exists("tokens"))    {dir.create("tokens")}


