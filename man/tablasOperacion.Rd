\name{tablasOperacion}
\alias{tablasOperacion}
\title{Recupera las tablas de una operación del api del INE}
\usage{
tablasOperacion(operacionId)
}
\arguments{
  \item{operacionId}{ Identificador de la operación de la cual se quieren recuperar sus tablas }
}
\description{
Función que recupera las tablas de una operación del api del INE
}
\author{
Diego Castro
}
\examples{
df <- tablasOperacion(22)
}
