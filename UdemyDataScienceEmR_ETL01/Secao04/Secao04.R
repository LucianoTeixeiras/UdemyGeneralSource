# Seção 04

# PROJETO - CASO REAL para arrumar

# Dados do IBGE

# Bancos (utilização de internet, pessoas)

# https://seriesestatisticas.ibge.gov.br/series.aspx?no=7&op=0&vcodigo=FDT0957&t=pessoas-desocupadas-grupos-anos-estudo

# https://downloads.ibge.gov.br/downloads_estatisticas.htm

# 01 - Carregando bibliotecas

library(tibble)
library(tidyr)
library(dplyr)
library(xlsx)
library(magrittr)

# 02 - Importar os dados e criando as partições

dados<-read.xlsx("UtilizacaoDaInternet.xlsx","Tabela 1.1.28.1 e 1.1.28.3 ",startRow=5,endRow=47) #obs o espaço no final da nome sheet

head(dados)

# 03 - Transformando dados em tibbles

dados<-as_tibble(dados)

# 04 - Criando as partições para a análise

dados_1<-dados[,1:8]

dados_1

dados_2<-dados[,9:16]

dados_2

# 05 - Alterando o nome das colunas em cada partição

names(dados_1)<-c("Local","Total","< 4 anos","4 a 7 anos","8 a 10 anos","11 a 14 anos","15 ou mais","Não determinados")

dados_1

names(dados_2)<-c("Local","Total","< 4 anos","4 a 7 anos","8 a 10 anos","11 a 14 anos","15 ou mais","Não determinados")

dados_2

# 06 - Organizando os valores da variável ANOS DE ESTUDO estão espalhados nas colunas (Tipo 4 para Tipo 1) ....

a<-dados_1 %>% gather("< 4 anos", "4 a 7 anos","8 a 10 anos","11 a 14 anos","15 ou mais","Não determinados", key = "Anos de estudo", value = "Quantidade")

a

b<-dados_2 %>% gather("< 4 anos", "4 a 7 anos","8 a 10 anos","11 a 14 anos","15 ou mais","Não determinados", key = "Anos de estudo", value = "Porcentagem (%)")

b

# 07 - Montando o arquivo final

dados_arrumados<-cbind(a,b)

head(dados_arrumados)

dados_arrumados<-dados_arrumados[,c(1,3,4,8)]

dados_arrumados<-as_tibble(dados_arrumados)

dados_arrumados
