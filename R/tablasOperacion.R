###################################################################
# dicastro
# 20190125
# Recupera las tablas de una operación del api del INE
###################################################################

.masTablasOperacion <- function(capitulos_padre) {
    if (nrow(capitulos_padre) > 0) {
        new_cum_tablas <- data.frame(capitulos_padre)

        for (capitulo_i in 1:nrow(capitulos_padre)) {
            capitulo <- capitulos_padre[capitulo_i, ]

            tablas_capitulo_raw <- readLines(paste("http://servicios.ine.es/wstempus/js/ES/TABLAS_CAPITULO/", capitulo$id, sep = ""))
            tablas_capitulo <- fromJSON(paste(tablas_capitulo_raw, collapse = ""))

            if (length(tablas_capitulo) > 0) {
                new_tablas <- data.frame(id = sapply(tablas_capitulo, function(x) x$Id), nombre = sapply(tablas_capitulo, function(x) x$Nombre), padre = capitulo$id, es_tabla = TRUE)
                new_cum_tablas <- rbind(new_cum_tablas, new_tablas)
            }

            subcapitulos_raw <- readLines(paste("http://servicios.ine.es/wstempus/js/ES/CAPITULOS/", capitulo$id, sep = ""))
            subcapitulos <- fromJSON(paste(subcapitulos_raw, collapse = ""))

            if (length(subcapitulos) > 0) {
                c <- data.frame(id = sapply(subcapitulos, function(x) x$Id), nombre = sapply(subcapitulos, function(x) x$Nombre), padre = capitulo$id, es_tabla = FALSE)
                new_cum_tablas <- rbind(new_cum_tablas, .masTablasOperacion(c))
                new_cum_tablas <- rbind(new_cum_tablas, c)
            }
        }

        return(new_cum_tablas)
    }

    return(data.frame())
}

tablasOperacion <- function(operacionId) {
    capitulos_raiz_raw <- readLines(paste("http://servicios.ine.es/wstempus/js/ES/CAPITULOSRAIZ_OPERACION/", operacionId, sep = ""))
    capitulos_raiz <- fromJSON(paste(capitulos_raiz_raw, collapse = ""))

    cr <- data.frame(id = sapply(capitulos_raiz, function(x) x$Id), nombre = sapply(capitulos_raiz, function(x) x$Nombre), padre = NA, es_tabla = FALSE)
    cr <- .masTablasOperacion(cr)

    cr[cr$es_tabla == TRUE, ]
}
