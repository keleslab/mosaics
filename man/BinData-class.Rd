\name{BinData-class}
\Rdversion{1.1}
\docType{class}
\alias{BinData-class}
\alias{chrID,BinData-method}
\alias{coord,BinData-method}
\alias{gcContent,BinData-method}
\alias{input,BinData-method}
\alias{mappability,BinData-method}
%\alias{mosaicsFit,BinData-method}
\alias{plot,BinData,missing-method}
\alias{print,BinData-method}
\alias{show,BinData-method}
\alias{tagCount,BinData-method}
\alias{seqDepth,BinData-method}
\alias{chrID}
\alias{coord}
\alias{gcContent}
\alias{input}
\alias{mappability}
\alias{tagCount}
\alias{seqDepth}

\title{Class "BinData" }
\description{
This class represents bin-level ChIP-seq data.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("BinData", ...)}.
}
\section{Slots}{
  \describe{
    \item{\code{chrID}:}{Object of class \code{"character"}, 
        a vector of chromosome IDs. }
    \item{\code{coord}:}{Object of class \code{"numeric"}, 
        a vector of genomic coordinates. }
    \item{\code{tagCount}:}{Object of class \code{"numeric"}, 
        a vector of tag counts of ChIP sample. }
    \item{\code{mappability}:}{Object of class \code{"numeric"}, 
        a vector of mappability score. }
    \item{\code{gcContent}:}{Object of class \code{"numeric"}, 
        a vector of GC content score. }
    \item{\code{input}:}{Object of class \code{"numeric"}, 
        a vector of tag counts of matched control sample. }
    \item{\code{dataType}:}{Object of class \code{"character"}, 
        indicating how reads were processed. Possible values are 
        "unique" (only uniquely aligned reads were retained)
        and "multi" (reads aligned to multiple locations were also retained). }
    \item{\code{seqDepth}:}{Object of class \code{"numeric"}, 
        a vector of sequencing depth of length 2, where the first and second elements
        correpond to sequencing depths of ChIP and control samples, respectively.
        If there is not control sample, the second element is set to NA.}
  }
}
\section{Methods}{
  \describe{
    \item{mosaicsFit}{\code{signature(object = "BinData")}: 
        fit a MOSAiCS model using a bin-level ChIP-seq data. }
    \item{plot}{\code{signature(x = "BinData", y = "missing", plotType = NULL )}: 
        provide exploratory plots of mean ChIP tag counts.
        This method plots mean ChIP tag counts versus mappability score, 
        GC content score, and Control tag counts, with 95\% confidence intervals,  
    for \code{plotType="M"}, \code{plotType="GC"}, and \code{plotType="input"}, respectively.
        \code{plotType="M|input"} and \code{plotType="GC|input"} provide
        plots of mean ChIP tag counts versus mappability and GC content score, respectively,
        conditional on Control tag counts. 
        If \code{plotType} is not specified, this method plots histogram of ChIP tag counts. }
    \item{print}{\code{signature(x = "BinData")}: 
        return bin-level data in data frame format. }
    \item{show}{\code{signature(object = "BinData")}: provide brief summary of the object. }
    \item{chrID}{\code{signature(object = "BinData")}: provide a vector of chromosome ID. }
    \item{coord}{\code{signature(object = "BinData")}: provide a vector of genomic coordinates. }
    \item{tagCount}{\code{signature(object = "BinData")}: provide a vector of tag count of ChIP sample. }
    \item{input}{\code{signature(object = "BinData")}: provide a vector of tag count of input sample. }
    \item{mappability}{\code{signature(object = "BinData")}: provide a vector of mappability score. }
    \item{gcContent}{\code{signature(object = "BinData")}: provide a vector of GC content score. }
    \item{seqDepth}{\code{signature(object = "BinData")}: provide a vector of sequencing depth. }
     }
}
\references{
Kuan, PF, D Chung, G Pan, JA Thomson, R Stewart, and S Keles (2011), 
"A Statistical Framework for the Analysis of ChIP-Seq Data", 
\emph{Journal of the American Statistical Association}, Vol. 106, pp. 891-903.

Chung, D, Zhang Q, and Keles S (2014), "MOSAiCS-HMM: A model-based approach for detecting regions of histone modifications from ChIP-seq data", Datta S and Nettleton D (eds.), \emph{Statistical Analysis of Next Generation Sequencing Data}, Springer.
}
\author{ Dongjun Chung, Pei Fen Kuan, Rene Welch, Sunduz Keles }
\seealso{
\code{\link{readBins}}, \code{\link{mosaicsFit}}.
}
\examples{
showClass("BinData")
\dontrun{
library(mosaicsExample)
data(exampleBinData)

exampleBinData
print(exampleBinData)[1:10,]
plot(exampleBinData)
plot( exampleBinData, plotType="M" )
plot( exampleBinData, plotType="GC" )
plot( exampleBinData, plotType="input" )
plot( exampleBinData, plotType="M|input" )
plot( exampleBinData, plotType="GC|input" )

exampleFit <- mosaicsFit( exampleBinData, analysisType="IO" )
}
}
\keyword{classes}
