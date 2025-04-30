library(lubridate)
library(purrr)

datos[, fecha_corte:=ymd(fecha_corte)]
datos[, fecha_nacimiento:=ymd(fecha_nacimiento)]
class(datos$fecha_corte)
class(datos$fecha_nacimiento)
datos |> map_chr(class) %>% table(.)
tvar <- datos |> map_chr(class)
names(tvar[tvar == "numeric"])
names(tvar[tvar == "character"])

hist(datos$total_activo_total)

barplot(table(datos$sexo))
