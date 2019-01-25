###################################################################
# dicastro
# 20190125
# Convierte una lista de listas en un data frame
###################################################################

listToDataFrame <- function(list) {
    df <- data.frame()

    if (length(list) > 0) {
        for (i in 1:length(list)) {
            df <- rbind(df, unlist(list[i]), stringsAsFactors = FALSE)
        }

        names(df) <- names(unlist(list[1]))
    }

    df
}
