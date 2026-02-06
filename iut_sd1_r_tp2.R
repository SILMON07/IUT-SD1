df<-read.csv(file = "C:/Users/scuzin/Downloads/fao.csv", sep=";", dec=",", header = TRUE)
nrow(df)
summary(df)

mean(df$Dispo_alim, na.rm=TRUE) #2914.312 Kcal /personne/jour

sum(df$Population, na.rm=TRUE) #7 592 664 054 habitant en tout

sd(df$Export_viande, na.rm=TRUE)
sd(df$Import_viande, na.rm=TRUE)

median(df$Prod_viande, na.rm=TRUE)

quantile(df$Dispo_alim)

quantile(df$Import_viande, seq(0,1,0.01))

resultat = head(df[ order(df$Population) , ], n = 5)
View(resultat)

resultat = head(df[ order(df$Population, decreasing = TRUE) , ], n = 5)
View(resultat)


rang = order(df$Prod_viande, decreasing = TRUE)
resultat = head(df[ rang , ], n = 5)
View(resultat)

rang = order(df$Import_viande, decreasing = TRUE)
resultat = head(df[ rang , ], n = 5)
View(resultat)

resultat = subset(df, Dispo_alim>=2300)
View(resultat)

resultat = subset(df, Dispo_alim > 3500  & Import_viande > 1000)
View(resultat)


df$Part_export<-df$Export_viande/df$Prod_viande

df$Dispo_alim_pays<-df$Dispo_alim*df$Population


write.table(x = df, file = "ExportTp2.csv")

dispo_alim_mondiale = sum(df$Dispo_alim_pays, na.rm=TRUE)
dispo_alim_mondiale/2300 #9 858 300 378



plot(x = df$Prod_viande,
     y = df$Export_viande, 
     main = "Pays : Prod_viande / Export_viande")

cor(x = df$Prod_viande,
    y = df$Export_viande)

matriceCor = cor(df[ , - 1] , use = "complete.obs")
matriceCor = round(matriceCor , 2)
View(matriceCor)

install.packages("corrplot")

help()

library(corrplot) #je charge mon package pour pouvoir utiliser ses fonctionalités
corrplot(matriceCor, method="circle")