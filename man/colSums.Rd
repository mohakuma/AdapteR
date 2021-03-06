% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rowcolOps.R
\name{colSums}
\alias{colSums}
\title{column sums of a FLMatrix.}
\usage{
colSums(object, ...)
}
\arguments{
\item{object}{is of class FLMatrix.}
}
\value{
\code{colSums} returns a FLVector object representing the col-wise sums.
}
\description{
\code{colSums} computes the column-wise sums of FLMatrix objects.
}
\examples{
flmatrix <- FLMatrix("tblMatrixMulti", 5,"MATRIX_ID","ROW_ID","COL_ID","CELL_VAL")
resultFLVector <- colSums(flmatrix)
}
