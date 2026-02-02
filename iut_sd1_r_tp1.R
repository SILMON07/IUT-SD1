# Exercice 1 : 

data(iris)
# 1 donne la classe
class(iris)
# 2 regarde dans la base
View(iris)
# 3 nombre ligne
nrow(iris)
# 4 nombre collonne
ncol(iris)
# 5 nom des colonne
colnames(iris)
# 6
summary(iris)
# 7
iris[ , c("Sepal.Length", "Species")]
# 8
iris[ c("100", '103', "105") ,]
# 9
iris[ c("50":"100") ,]
# 10
mean(iris$Sepal.Length)
# 11
median(iris$Sepal.Width)
# 12
sd(iris$Petal.Length)
# 13
quantile(iris$Petal.Width, probs = seq(from = 0.1, to = 0.9, by =0.1))

#Exercice 2 : 

dfManga <- read.csv("C:/Users/scuzin/Downloads/manga.csv", header = TRUE, sep = ",", dec = ".")
dfAnime <- read.csv("C:/Users/scuzin/Downloads/anime.csv", header = TRUE, sep = ",", dec = ".")
class(dfManga)
class(dfAnime) # dit la classe ce ce qu'est dfanime et dfmanga
View(dfManga)
View(dfAnime) # montre sous forme de tableau le contenue des 2 BDD
dim(dfManga)
dim(dfAnime) # donne largeur et hauteur des BDD
mean(dfAnime$Score)
mean(dfManga$Score) # la plus élevé est la moyenne d'anime (7.4 > 7.3)
sum(dfAnime$Vote)
sum(dfManga$Vote) # la plus élevé est le nombre de vote d'anime (85412765 > 35056671)
sd(dfAnime$Vote)
sd(dfManga$Vote) # la plus homohene est les manga car l'écart type vote des anime > manga (200196.4 > 14026)

quantile(dfManga$Score, probs = seq(from = 0.1, to = 0.9, by = 0.1))
quantile(dfAnime$Score, probs = seq(from = 0.1, to = 0.9, by = 0.1)) 
# la plus le décil 1 le plus petit est celui des animes  (6.98 > 6.910)

nb9 = subset(dfManga, Score > 9)
nrow(nb9) # 10 manga mieux que 9//10
View(dfAnime)
nbvote = subset(dfManga, Vote >= 200000 )
nrow(nbvote) # 12 manga avec plus de 200000 votes

nbdeux = subset(dfManga, Vote >= 200000 & Score > 8 )
nrow(nbdeux) # 11 manga avec plus de 200000 votes et avec 8/10

nbentre = subset(dfManga, Score < 8 & Score > 7 )
nrow(nbentre) # 7889 manga note entre 7 et 8

effectifRating <- table(dfAnime$Rating)
print(effectifRating)
length(effectifRating)
prop.table(effectifRating) #6 modalité pour la varialbe 

p17 = subset(dfAnime, Rating == "R - 17+ (violence & profanity)")
nrow(p17) #1538 anime 

pp17 = subset(dfAnime, Rating == "R - 17+ (violence & profanity)" & Score > 8)
nrow(pp17) #326 anime 

pas17 = subset(dfAnime, Rating != "R - 17+ (violence & profanity)")
nrow(pas17) #8462 anime 

pall = subset(dfAnime, Rating %in% c("PG - Children","G - All Ages"))
nrow(pall) #1510 anime

pasall = subset(dfAnime, !Rating %in% c("PG - Children","G - All Ages"))
nrow(pasall) #8490 anime

nbdeux = subset(dfManga, Vote >= 400000 | Score > 9 )
nrow(nbdeux) # 11 manga avec plus de 400000 votes ou plus 9/10

dfAnime <- dfAnime[ , c("Title","Score","Vote","Ranked")]
dfManga <- dfManga[ , c("Title","Score","Vote","Ranked")]

dfAnime$Type = "Anime"
dfManga$Type = "Manga"

dfConcat = rbind(dfManga, dfAnime)
View(dfConcat)

write.table(x = dfConcat, file = "C:/Users/scuzin/Downloads/ExportTp1.csv",
            sep = ";",row.names = FALSE)