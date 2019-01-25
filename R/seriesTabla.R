###################################################################
# dicastro
# 20190125
# Recupera las series de una tabla de una operación del api del INE
###################################################################

seriesTabla <- function(tablaId) {
    series_tabla_raw <- readLines(paste("http://servicios.ine.es/wstempus/js/ES/DATOS_TABLA/", tablaId, "?date=:", sep = ""))
    series_tabla <- fromJSON(paste(series_tabla_raw, collapse = ""))

    st <- data.frame(COD = sapply(series_tabla, function(x) x$COD), Nombre = sapply(series_tabla, function(x) x$Nombre))
    st
}
