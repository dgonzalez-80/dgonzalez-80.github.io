#  carga de  datos  y construccion de  tablas
#  construccion de bases
#  construcción de tablas

token <- "ew2rEMuESuzWPqMkyPfOSGJgE"
df.ins <- read.socrata("https://www.datos.gov.co/resource/gt2j-8ykr.json", app_token = token)
# as.Date(fecha_not)
mapa=readOGR("~/R/MAPAS/MAPA_COLOMBIA/depto/depto.shp",stringsAsFactors=FALSE)
#------------------------------------------------------------------------------------
# arreglo de fechas
# Fecha actual
hoy <- as.Date(format(Sys.Date(), "%Y-%m-%d"))

# fechas clave del INS
df.ins$fecha_sin <- as.Date(df.ins$fis, format = "%Y-%m-%d")
df.ins$fecha_not <- as.Date(df.ins$fecha_de_notificaci_n, format = "%Y-%m-%d")

# otras fechas importantes INS
df.ins$fecha_dx  <- as.Date(df.ins$fecha_diagnostico, format = "%Y-%m-%d")
df.ins$fecha_def <- as.Date(df.ins$fecha_de_muerte, format = "%Y-%m-%d")

# otras fechas en los datos del INS
df.ins$fecha_rec <- as.Date(df.ins$fecha_recuperado, format = "%Y-%m-%d")
df.ins$fecha_rpw <- as.Date(df.ins$fecha_reporte_web, format = "%Y-%m-%d")

# tipo caso: confirmados y fallecidos
df.ins$tipo_caso <- "Confirmados"
df.ins$tipo_caso[which(df.ins$atenci_n=="Fallecido" | df.ins$estado=="Fallecido")] <- "Fallecidos"

# renombrar algunos campos
df.ins$municipio <- df.ins$ciudad_de_ubicaci_n

# mover campos importantes (fechas, ajuste_) al principio
df.ins <- df.ins %>%
  dplyr::select(id_de_caso,
                municipio,
                tipo_caso,
                fecha_not,
                fecha_sin,
                fecha_dx,
                fecha_def,
                everything())

if (!dir.exists("data")) {dir.create("data")}
write.csv(df.ins, file = "data/df.ins.csv")
#==========================================================
# Colombia
write.csv(df.ins,
          paste0("data/",hoy, "datos_ins_colombia.csv"))
saveRDS(df.ins, file = "data/Colombia.RDS")
#-----------------------------------------------------------
# Cali
df.ins.cali <- df.ins %>%
  filter(c_digo_divipola=="76001")
write.csv(df.ins.cali,
          paste0("data/", hoy,"datos_ins_cali.csv"))
saveRDS(df.ins.cali, file = "data/cali.RDS")
#-----------------------------------------------------------
# Buenaventura
df.ins.bventura <- df.ins %>%
  filter(c_digo_divipola=="76109")
write.csv(df.ins.bventura,
          paste0("data/",hoy,"datos_ins_buenaventura.csv"))
saveRDS(df.ins.bventura, file = "data/buenaventura.RDS")

# Palmira
df.ins.palmira <- df.ins %>%
  filter(c_digo_divipola=="76520")
write.csv(df.ins.palmira,
          paste0("data/",hoy, "datos_ins_palmira.csv"))
saveRDS(df.ins.palmira, file = "data/palmira.RDS")

# Jamundi
df.ins.jamundi <- df.ins %>%
  filter(c_digo_divipola=="76364")
write.csv(df.ins.jamundi,
          paste0("data/",hoy, "datos_ins_jamundi.csv"))
saveRDS(df.ins.jamundi, file = "data/jamundi.RDS")


# Yumbo
df.ins.yumbo <- df.ins %>%
  filter(c_digo_divipola=="76892")
write.csv(df.ins.yumbo,
          paste0("data/",hoy, "datos_ins_yumbo.csv"))
saveRDS(df.ins.yumbo, file = "data/yumbo.RDS")


# Tulua
df.ins.tulua <- df.ins %>%
  filter(c_digo_divipola=="76834")
write.csv(df.ins.tulua,
          paste0("data/",hoy, "datos_ins_tulua.csv"))
saveRDS(df.ins.tulua, file = "data/tulua.RDS")


# Valle del Cauca
df.ins.valle <- df.ins %>%
  filter(c_digo_divipola>="76000" & c_digo_divipola<="76999")
write.csv(df.ins.valle,
          paste0("data/", hoy,"datos_ins_valle.csv"))
saveRDS(df.ins.valle, file = "data/valle.RDS")


# Valle Resto
df.ins.valle.resto <- df.ins.valle %>%
  filter(!(c_digo_divipola %in% c("76001","76109","76520","76364","76892","76834")) )
saveRDS(df.ins.valle.resto, file = "data/Valle_resto.RDS")

# Candelaria - Valle
df.ins.candelaria <- df.ins %>%
  filter(c_digo_divipola=="76130")
write.csv(df.ins.candelaria,
          paste0("data/",hoy, "datos_ins_candelaria.csv"))
saveRDS(df.ins.candelaria, file = "data/candelaria.RDS")


# Medellin
df.ins.medellin <- df.ins %>%
  filter(c_digo_divipola=="5001")
write.csv(df.ins.medellin,
          paste0("data/",hoy, "datos_ins_medellin.csv"))
saveRDS(df.ins.medellin, file = "data/medellin.RDS")


# Bogota
df.ins.bogota <- df.ins %>%
  filter(c_digo_divipola=="11001")
write.csv(df.ins.bogota,
          paste0("data/",hoy, "datos_ins_bogota.csv"))
saveRDS(df.ins.bogota, file = "data/bogota.RDS")


# Barranquilla
df.ins.barranquilla <- df.ins %>%
  filter(c_digo_divipola=="08001")
write.csv(df.ins.barranquilla,
          paste0("data/",hoy, "datos_ins_barranquilla.csv"))
saveRDS(df.ins.bogota, file = "data/barranquilla.RDS")

#-------------------------------------------------------
#Generacion de tabla
df.ins$codigo=NA
df.ins$codigo=trunc(as.numeric(df.ins$c_digo_divipola)/1000)
tabla=table(df.ins$codigo,df.ins$atenci_n)
rownames(tabla)=c("Antioquia",
                  "Atlantico",
                  "Bogota D.C",
                  "Bolivar", 
                  "Boyaca",
                  "Caldas",
                  "Caquetá",
                  "Cauca",
                  "Cesar",
                  "Cordoba",
                  "Cundinamarca",
                  "Chocó", 
                  "Huila",
                  "La Guajira",
                  "Magdalena",
                  "Meta", 
                  "Nariño",
                  "Norte De Santander",  
                  "Quindio",
                  "Risaralda", 
                  "Santander",
                  "Sucre", 
                  "Tolima",
                  "Valle del Cauca",
                  "Arauca",
                  "Casanare",
                  "Putumayo",
                  "Amazonas",     
                  "Guainia",
                  "Guaviare",
                  "Vaupes",
                  "Vichada", 
                  "San Andres P.y Sta C.")
colnames(tabla)=c("En casa", "Fallec.", "Hospital.", "En UCI", "NA", "Recuperados")
tabla
write.csv(tabla, file = "taba.csv")
saveRDS(tabla, file = "data/tabla.RDS")
#-------------------------------------------------------



