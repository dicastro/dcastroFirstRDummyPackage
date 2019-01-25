###################################################################
# dicastro
# 20190125
# Recupera las operaciones del api del INE
###################################################################

.listToDataFrame <- function(list) {
    df <- data.frame()

    if (length(list) > 0) {
        for (i in 1:length(list)) {
            df <- rbind(df, unlist(list[i]), stringsAsFactors = FALSE)
        }

        names(df) <- names(unlist(list[1]))
    }

    df
}

operacionesINE <- function() {
    operaciones_raw <- readLines("http://servicios.ine.es/wstempus/js/ES/OPERACIONES_DISPONIBLES")
    operaciones <- fromJSON(paste(operaciones_raw, collapse = ""))

    df <- .listToDataFrame(operaciones)
    df
}
