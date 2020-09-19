#instalar pacote
#install.packages('readr')

#importa pacote
library('readr')

#Definir caminho dos datasets
datasetPath <- paste(getwd(),'/Datasets',sep="")

' OBS: A função getwd() exibe qual é o workspace corrente.'

# Definir nome do arquivo que será lido
fileIris <- paste(datasetPath,"/Iris.csv",sep="")

# Importar (ler) os dados do arquivo CSV de valores separados por virgulas
dataIris <- read_csv(fileIris)

# Imprimir as 6 primeiras linhas do vetor de dados dataIris
head(dataIris)

# Imprimir as 3 primeiras linhas do vetor iris 
head(dataIris, 3)

# Imprimir as 6 últimas linhas do vetor de dados dataIris
tail(dataIris)

dataIris$Id <- NULL

# Resumo das estatísticas descritivas: a observação mínima, 1a quartil (25%), 
# mediana (50%), media aritmética, 3a quartil (75%) e a máxima são exibidos para cada amostra.
summary(dataIris)

# Verificar tipo de cada coluna do vetor
sapply(dataIris, class)

library(tidyverse)
# assign numbers to categorical variables in order to convert them to factors
dataIris <- dataIris %>% 
  mutate(Especie = as.factor(Especie))

sapply(dataIris, class)

summary(dataIris)

# Gráfico padrão para uma variável numérica:
plot(dataIris$Comprimento_Sepala_Cm)

# Gráfico padrão para duas variável numérica:
plot(dataIris$Comprimento_Sepala_Cm, dataIris$Largura_Sepala_Cm)

# ou
plot(dataIris$Comprimento_Sepala_Cm ~ dataIris$Largura_Sepala_Cm)

par(mar=c(7,5,1,1)) # more space to labels
boxplot(dataIris,las=2)


# Boxplot mostrando a mediana (linha horizontal, quartis 25 % e 75 % (caixa verde - col=3) e observações máxima e
#mínima (linhas verticais) – ylab e xlab são as etiquetas dos eixos y e x, respectivamente.
boxplot(dataIris$Comprimento_Sepala_Cm, col=3, ylab="Valores(cm)", xlab="Característica")

#Usa range=0 para não mostrar os outliers (observações extremas representadas como pontos)
boxplot(dataIris$Comprimento_Sepala_Cm, range=0, col=2, ylab="Valores(cm)", xlab="Característica")

#install.packages('RColorBrewer')

library(RColorBrewer)

display.brewer.all(n=3)

plot(Largura_Sepala_Cm ~ Comprimento_Sepala_Cm, data=dataIris, col=brewer.pal(3, "Set2")[dataIris$Especie])
#legend(x=7.5, y=5.5, legend=levels(dataIris$Especie),col=brewer.pal(3, "Set2"), pch=1)

legend('topright', legend=levels(dataIris$Especie), col=brewer.pal(3, "Set2"), pch=1,cex = 0.7,y.intersp=0.5,xjust=1,yjust=1)
)
#bty="n")
#legend('topleft', legend=levels(dataIris$Especie), col=brewer.pal(3, "Set2"), pch=1,cex = 0.75)
