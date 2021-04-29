#zadanie 1
f <- function(a,b) {
  c<-a%%b
  if(c==0)
    {print("Liczba a jest podzielna przez b")}
  else 
    {print("Liczba a nie jest podzielna przez b")}
}

f(7,4)

#zadanie 2
s1 <- 120*t
s2 <- 90*t
t <- 1
#I tak sie skraca wiec przyjalem jeden

Vs <- (0.5*s1+0.5*s2)/t
Vs

#zadanie 3
my_data <- read.csv2("dane.csv", header=TRUE)
my_data

my_data[waga]

?data.frame
a<- my_data["wzrost"]
b<- my_data["waga"]

R_Corelation_fraction <- cov(a,b)
R_Corelation_denominator <- sd(as.numeric(unlist(a)),na.rm = FALSE)*sd(as.numeric(unlist(b)),na.rm = FALSE)

R_Corelation <- R_Corelation_fraction/R_Corelation_denominator
R_Corelation

#wspolczynnik Pearsona na poziomie 0.9793459 pokazuje ze jest praktycznie liniowa zaleznosc pomiedzy waga a wzrostem

#zadanie 4


stworzDataFrame <- function(){
  ile <-  readline("Podaj liczbe wierszy: ")  
  v<- readline("Podaj nazwy kolumn oddzielone spacja: ")  
  v <- as.character(unlist(strsplit(v, " ")))
  
  df<- data.frame(matrix(ncol = length(v)))
  colnames(df) <- v
  
  for(i in 1:ile){
    vv <- readline("Podaj wartosci wiersza oddzielone spacja: ")
    vv <- as.data.frame(unlist(strsplit(vv, " ")))
    is.vector(vv)
    class(vv)
    vv <- transpose(vv)
    df[i,] <- vv

  }
  
  df
}

stworzDataFrame()

#zadanie 5 
getwd()
LiczZPlikow<-function(sciezkaKatalogu, nazwaKolumny, jakaFunkcja, dlaIluPlikow=4){
  
  pliki <- list.files(sciezkaKatalogu)[1:dlaIluPlikow]
  vektor <- c()
  for (plik in pliki){
    
    sciezkapliku=(paste(sciezkaKatalogu, pliki, sep='/'))
    data <- do.call(rbind,lapply(sciezkapliku,read.csv))
    data <- data[nazwaKolumny]
    data <- na.omit(data) 
    data <- unlist(data)
    
    vektor <- append(vektor, data)
  }
  
  result <- mean(vektor)
  return(result)
}


LiczZPlikow("smogKrakow","140_temperature")

