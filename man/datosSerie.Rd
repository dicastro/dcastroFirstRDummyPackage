\name{datosSerie}
\alias{datosSerie}
\title{Recupera los datos de una serie de una tabla de una operación del api del INE}
\usage{
datosSerie(serieId)
}
\arguments{
  \item{serieId}{ Identificador de la serie de la cual se quieren recuperar sus datos }
}
\description{
Función que recupera los datos de una serie de una tabla de una operación del api del INE
}
\author{
Diego Castro
}
\examples{
# Recuperación de operaciones
o <- operacionesINE()
# Se filta una operación
o[with(o, grepl("Padrón", Nombre, ignore.case = TRUE)), ]
# Se recuperan las tablas de una operación
to <- tablasOperacion(22)
# Se filtra una tabla
to[with(to, grepl("capital", Nombre, ignore.case = TRUE)), ]
# Se recuperan las series de una tabla
st <- seriesTabla(2911)
# Se filtra una serie
st[with(st, grepl("madrid", Nombre, ignore.case = TRUE)), ]
# Se recuperan los datos de una serie
ds <- datosSerie("DPOP13158")
}
