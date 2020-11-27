library(rmarkdown)
library(pdftools)
library(stringr)
library(readxl)

studenti <- read_excel("C:/Users/Vojta/Downloads/table_export.xlsx")

jmena <- studenti$Jméno
jmena <- iconv(jmena, from = "UTF-8", to = "ASCII//TRANSLIT")
jmena <- substr(x = jmena, start = 1, stop = 13)

for(i in jmena){
  render("ZVH_TEST_COVID19_lin.Rmd",
         output_file = paste0("Testy_raw/", i, ".pdf"),
         params = list(jmeno = paste(i)))
}


testy <- list.files(path = "Testy_raw", pattern = ".pdf", full.names = T)
testy_n <- list.files(path = "Testy_raw", pattern = ".pdf", full.names = F)


for (i in 1:length(testy_n)){
  pdf_subset(input = testy[i], pages = 1:2, output = paste0("Testy/Test_", testy_n[i]))
  pdf_subset(input = testy[i], pages = 3, output = paste0("Vysledky/Vysledky_", testy_n[i]))
}

