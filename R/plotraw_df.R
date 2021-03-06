#' @title Plotraw_df
#' @description funcao para plotagens de graficos do espectro inteiro
#' @param df data frame
#' @details O nome das variaveis do espectro deve ser um numero. Chame os arquivos com check.name = F
#' @usage plotraw_df(df)
#' @import dplyr 
#' @import reshape2 
#' @import ggplot2
#' @examples
#' data(nir_seed)
#' plotraw_df(nir_seed)
#' @export
plotraw_df<-function(df){
  if (! is.data.frame (df)) {stop ("must be a dataframe")}
  
  if (! is.numeric(df[,ncol(df)])){
  names(df)[names(df) == rev(names(df))[1]] <- 'class'
  df$class<-as.factor(df$class)
  df1<-melt(df,id= "class")
  df1<-  mutate(df1, ordem = rep(seq(1,nrow(df),1), nlevels(df$class)*((ncol(df)-1)/nlevels(df$class))))
  df1$variable<-as.numeric(as.character(df1$variable))
  
  p<-ggplot(data=df1,
         aes(x=variable, y=value, group=ordem, colour=class)) + theme_classic()+
    geom_line()+scale_x_continuous(name ="Spectral wavelength ", minor_breaks=2, n.breaks = 4)+
    scale_color_manual(name="Class",values=c("green", "violet", "mediumpurple1", "slateblue1", "purple", "purple3",
                                                "turquoise2", "skyblue", "steelblue", "blue2", "navyblue",
                                                "orange", "tomato", "coral2", "palevioletred", "violetred"))}


if (is.numeric(df[,ncol(df)])){
  df["Seed"]<-seq(1,nrow(df))
  df1<-melt(df,id="Seed")
  df1$variable<-as.double(levels(df1$variable))[df1$variable]
 
   p<-ggplot(data=df1,
    aes(x=variable, y=value, group=Seed, col=Seed))+ 
    theme_classic()+
    geom_line()+scale_color_gradientn(colours = rainbow(10))+
    xlab("Spectral wavelength")}
  
  return(p)
}
