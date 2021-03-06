#' Breaking a string into rows of strings
#'
#' @param string : a string with many characters
#' @param nchar : number of characters per row
#' @return rows of strings
break_str = function (string, nchar) {

  chars = str_split(string, "")[[1]]
  rows = (length(chars) %/% nchar) + 1
  outs = c()

  outs = stringr::str_c(chars[1:nchar], collapse = "")
  if ((chars[nchar] %in% c(letters, LETTERS)) %in% (chars[nchar+1] %in% c(letters, LETTERS))) {stringr::str_c(outs,"-",collapse = "")}

  for (i in (2:rows)) {

    if (i*nchar < length(chars)) {
      out = stringr::str_c(chars[(i*nchar-(nchar-1)):(i*nchar)], collapse = "")
      if ((chars[(i*nchar)] %in% c(letters, LETTERS)) & (chars[((i*nchar)+1)] %in% c(letters, LETTERS))) {
        out = stringr::str_c(out,"-", collapse = "")
      }
    } else {
      out = stringr::str_c(chars[((i*nchar)-(nchar-1)):(length(chars))], collapse = "")
    }

    outs = c(outs, out)
  }

  return(outs)
}

#' Breaking strings into rows of strings
#'
#' @param string : strings, each with many character (could be output of functions like extract_abstract_pubmed())
#' @param nchar : number of characters per row
#' @return a reading-friendly dataframe
strings2dataframe = function (strings, nchar) {
  abs_all = c()
  for (i in 1:length(abstract)) {
    abs_all = c(abs_all,paste("#", i, sep = ""), break_str(abstract[i],nchar), stringr::str_c(rep("=",3), collapse = ""))
  }
  as.data.frame(abs_all)
  return(abs_all)
}
