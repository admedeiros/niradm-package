% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/classification_df.R
\name{classification_df}
\alias{classification_df}
\title{classification_df}
\usage{
classification_df(df)
}
\arguments{
\item{df}{data frame com a ultima coluna com a classe correspondente}

\item{splitting}{proporcao da divisao do banco de dados para o treinamento e teste}

\item{algorithm}{algoritmo para criacao de modelos default plsda}

\item{method_cv}{The resampling method: "boot", "boot632", "optimism_boot", "boot_all", "cv", "repeatedcv", "LOOCV", "LGOCV"}

\item{number_cv}{Either the number of folds or number of resampling iterations}

\item{tL}{tuneLength}

\item{metrics}{1 para metricas por classe e 2 para metricas medias}

\item{save}{Salvar modelo}

\item{varimp}{importancia das variaveis}

\item{plsplot}{Plotar PLS}

\item{repeat_cv}{For repeated k-fold cross-validation only: the number of complete sets of folds to compute}
}
\description{
funcao para desenvolver modelos de classificacao
}
\examples{
data(nir_seed)
dados<-classification_df(nir_seed)
}
