library(rvest)
library(stringr)
library(progress)

link = 'https://www.otomoto.pl/osobowe/audi/a1/'

download.file(link, destfile = "scrapedpage.html", quiet=TRUE)
page <- read_html('scrapedpage.html')

page %>% html_nodes(xpath = '')

result <- page %>% html_nodes(xpath = "//span[@class='offer-price__number ds-price-number']/span[1]") %>% html_text()
result <- as.integer(str_replace(result, "", ""))

N = 10
results <- data.frame('price'=numeric(), 'year'=numeric(), 'mileage'=numeric(), 'fuel'=c())
pb <- progress_bar$new(total=N)
for(i in 1:N){
  download.file(paste0(link, i), destfile = "scrapedpage.html", quiet=TRUE)
  page_nodes <- read_html('scrapedpage.html') %>% html_nodes(xpath = '//*[@class="offer-item__content ds-details-container"]')
  
  for(node in page_nodes){
    node %>%
      html_nodes(xpath = "//span[@class='offer-price__number ds-price-number']/span[1]") %>%
      html_text() %>%
      str_replace_all(., " ", "") %>%
      as.numeric() -> price
    
    node %>%
      html_nodes(xpath = '//*[@data-code="year"]') %>%
      html_text() %>%
      str_extract(., regex('\\d{4}')) %>%
      as.numeric() -> year
    
    node %>%
      html_nodes(xpath = '//*[@data-code="mileage"]') %>%
      html_text() %>%
      str_replace_all(., " ", "") %>%
      str_extract(regex('[0-9]+')) %>%
      as.numeric() -> mileage
    
    if(length(price) == 0) price <- NA
    if(length(year) == 0) year <- NA
    if(length(mileage) == 0) mileage <- NA
    
    results <- rbind(results, data.frame('price' = price, 'year' = year, 'mileage' = mileage))
  }
  pb$tick()
}






