# NOMOR 1 #
#1 Point A
before <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
after <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
difference <- after - before
difference
mean(difference)
sd(difference)

#1 Point B 
t.test(after, before, paired = TRUE)

#1 Point C
#Jawaban ada di README.md


# NOMOR 2 #
#Install package BSDA
install.packages("BSDA")
library(BSDA)

#2 Point A
#Jawaban ada di README.md

#2 Point B
tsum.test(mean.x = 23500, s.x = 3900, n.x = 100)

#2 Point C
#Jawaban ada di README.md


# NOMOR 3 #
#3 Point A
#Jawaban ada di README.md

#3 Point B
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y =2.79 , s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)

#3 Point C
#Install package Mosaic
install.packages("mosaic")
library(mosaic)
plotDist(dist = 't', df = 2, col = "blue")

#3 Point D
qchisq(p = 0.05, df = 2, lower.tail = FALSE)

#3 Point E
#Jawaban ada di README.md

#3 Point F 
#Jawaban ada di README.md


# NOMOR 4 #
#4 Point A
#pertama
dataoneway <- read.table("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt", h = T)
attach(dataoneway)
names(dataoneway)
#kedua
dataoneway$Group <- as.factor(dataoneway$Group)
dataoneway$Group = factor(dataoneway$Group, labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(dataoneway$Group)
#ketiga
Group1 <- subset(dataoneway, Group == "Kucing Oren")
Group2 <- subset(dataoneway, Group == "Kucing Hitam")
Group3 <- subset(dataoneway, Group == "Kucing Putih")
#keempat
qqnorm(Group1$Length)
qqline(Group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group3$Length)
qqline(Group3$Length)

#4 Point B
bartlett.test(Length ~ Group, data = dataoneway)

#4 Point C
model1 = lm(Length ~ Group, data = dataoneway)
anova(model1)

#4 Point D
#Jawaban ada di README.md

#4 Point E
TukeyHSD(aov(model1))

#4 Point F
install.packages("ggplot2")
library("ggplot2")
ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")


# NOMOR 5 #
#5 Point A
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("GTL.csv")
head(GTL)

str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)

#5 Point B
#pertama
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
#kedua
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

#5 Point C
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

#5 Point D
tukey <- TukeyHSD(anova)
print(tukey)

#5 Point E
#pertama
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
#kedua
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)

# Alhamdulillah, Terimakasih, bismillah lulus :)