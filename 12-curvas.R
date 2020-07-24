library(incidence)
df.ins.colombia=readRDS("data/Colombia.RDS")

inc.casos.tipo <- incidence(df.ins.colombia$fecha_sin,
                            groups = df.ins.colombia$tipo_caso)

# interactive time series
library(dygraphs)
# create time series objects (class xs)
library(xts)

# create time series object
discharge_timeSeries <- xts(x = inc.casos.tipo$counts,
                            order.by = inc.casos.tipo$dates)

# create a basic interactive element
interact_time <- dygraph(discharge_timeSeries)


interact_time


dygraph(nhtemp, main = "New Haven Temperatures") %>% 
  dyRangeSelector(dateWindow = c("1920-01-01", "1960-01-01"))