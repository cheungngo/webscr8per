library(rvest)


x = read_html("https://pubmed.ncbi.nlm.nih.gov/?term=ptsd%20ketamine&size=200&page=1")
y  = x %>%
      html_node(xpath = '//*[@id="search-results"]/section/div[1]/div/article[2]/div[2]/div[1]/a') %>%
      html_text()
y



//*[@id="search-results"]/section/div[1]/div/article[1]/div[2]/div[1]/a
//*[@id="search-results"]/section/div[1]/div/article[2]/div[2]/div[1]/a

//*[@id="search-results"]/section/div[2]/div/article[1]/div[2]/div[1]/a

y = c(); y2 = c()
for (i in 1:200) {
  y = c(y, x %>% html_node(xpath = paste('//*[@id="search-results"]/section/div[1]/div/article[', i, ']/div[2]/div[1]/a')) %>% html_text())
}

class(paste('//*[@id="search-results"]/section/div[2]/div/article[', i, ']/div[2]/div[1]/a'))

y
x2 = read_html("https://pubmed.ncbi.nlm.nih.gov/?term=ptsd%20ketamine&size=200&page=2")

y2 = c()
for (i in 1:11) {
  y2 = c(y2, x2 %>% html_node(xpath = paste('//*[@id="search-results"]/section/div[2]/div/article[', i, ']/div[2]/div[1]/a')) %>% html_text())
}
y2
