\name{seriesTabla}
\alias{seriesTabla}
\title{Recupera las series de una tabla de una operación del api del INE}
\usage{
seriesTabla(tablaId)
}
\arguments{
  \item{tablaId}{ Identificador de la tabla de la cual se quieren recuperar sus series }
}
\description{
Función que recupera las series de una tabla de una operación del api del INE
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
}
