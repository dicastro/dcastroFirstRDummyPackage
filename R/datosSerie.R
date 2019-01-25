###################################################################
# dicastro
# 20190125
# Recupera los datos de una serie de una tabla de una operación del api del INE
###################################################################

datosSerie <- function(serieId) {
    datos_serie_raw <- readLines(paste("http://servicios.ine.es/wstempus/js/ES/DATOS_SERIE/", serieId, "?date=:", sep = ""))
    datos_serie <- fromJSON(paste(datos_serie_raw, collapse = ""))

    ds <- listToDataFrame(datos_serie$Data)
    ds
}
