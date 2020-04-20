library(rmarkdown)
library(pdftools)



jmena = c("anicka", "vojta", "karel")

for(i in jmena){
  render("ZVH_TEST_COVID19_lin.Rmd",
         output_file = paste0("Testy_raw/", i, ".pdf"),
         params = list(jmeno = paste(i)))
}


testy <- list.files(path = "Testy_raw", pattern = ".pdf", full.names = T)
testy_n <- list.files(path = "Testy_raw", pattern = ".pdf", full.names = F)


for (i in 1:length(testy_n)){
  pdf_subset(input = testy[i], pages = 1:3, output = paste0("Testy/Test_", testy_n[i]))
  pdf_subset(input = testy[i], pages = 4, output = paste0("Vysledky/Vysledky_", testy_n[i]))
}

