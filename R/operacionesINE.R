###################################################################
# dicastro
# 20190125
# Recupera las operaciones del api del INE
###################################################################

operacionesINE <- function() {
    operaciones_raw <- readLines("http://servicios.ine.es/wstempus/js/ES/OPERACIONES_DISPONIBLES")
    operaciones <- fromJSON(paste(operaciones_raw, collapse = ""))

    df <- listToDataFrame(operaciones)
    df
}
