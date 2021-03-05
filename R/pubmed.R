#' Converting keywords to the link of the search result page in pubmed
#'
#' @param words : pubmed search terms
#' @return the link of the search result page in pubmed (size == 200)
#' @examples
#' words2link_pubmed("(PTSD OR Depression) AND Ketamine")
#' @export
words2link_pubmed = function(words) {
  code = gsub(" ", "%20", words)
  link = paste("https://pubmed.ncbi.nlm.nih.gov/?term=",
               code,
               "&sort=date&size=200&page=",
               sep = "")
  return(link)
}
