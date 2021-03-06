## Imported from the tufte package by Yihui Xie and JJ Allaire
## to avoid an explicit dependency for the somewhat optional
## html usage (as the package is principally a pdf processor to us)
##
## Copyright Yihui Xie, JJ Allaire et al
## Licensed as GPL-3
## https://cran.r-project.org/package=tufte

#' @details \code{newthought()} can be used in inline R expressions in R
#'   Markdown (e.g. \samp{`r newthought(Some text)`}), and it works for both
#'   HTML (\samp{<span class="newthought">text</span>}) and PDF
#'   (\samp{\\newthought{text}}) output.
#' @param text A character string to be presented as a \dQuote{new thought}
#'   (using small caps), or a margin note, or a footer of a quote
#' @rdname tintHtml
newthought = function(text) {
  if (is_html_output()) {
    sprintf('<span class="newthought">%s</span>', text)
  } else if (is_latex_output()) {
    sprintf('\\newthought{%s}', text)
  } else {
    sprintf('<span style="font-variant:small-caps;">%s</span>', text)
  }
}

#' @details \code{margin_note()} can be used in inline R expressions to write a
#'   margin note (like a sidenote but not numbered).
#' @param icon A character string to indicate there is a hidden margin note when
#'   the page width is too narrow (by default it is a circled plus sign)
#' @rdname tintHtml
margin_note = function(text, icon = '&#8853;') {
  if (is_html_output()) {
    marginnote_html(sprintf('<span class="marginnote">%s</span>', text), icon)
  } else if (is_latex_output()) {
    sprintf('\\marginnote{%s}', text)
  } else {
    warning('marginnote() only works for HTML and LaTeX output', call. = FALSE)
    text
  }
}

#' @details \code{quote_footer()} formats text as the footer of a quote. It puts
#'   \code{text} in \samp{<footer></footer>} for HTML output, and
#'   after \samp{\\hfill} for LaTeX output (to right-align text).
#' @rdname tintHtml
quote_footer = function(text) {
  if (is_html_output()) {
    sprintf('<footer>%s</footer>', text)
  } else if (is_latex_output()) {
    sprintf('\\hfill %s', text)
  } else {
    warning('quote_footer() only works for HTML and LaTeX output', call. = FALSE)
    text
  }
}

#' @details \code{sans_serif()} applies sans-serif fonts to \code{text}.
#' @rdname tintHtml
sans_serif = function(text) {
    .Deprecated(msg=paste("Function 'sans_serif' not applicable for package 'tint'.",
                          "It may be removed in a future release."))
  if (is_html_output()) {
    sprintf('<span class="sans">%s</span>', text)
  } else if (is_latex_output()) {
    sprintf('\\textsf{%s}', text)
  } else {
    warning('sans_serif() only works for HTML and LaTeX output', call. = FALSE)
    text
  }
}

template_resources = function(name, ...) {
  system.file('rmarkdown', 'templates', name, 'resources', ..., package = 'tint')
}

gsub_fixed = function(...) gsub(..., fixed = TRUE)

readUTF8 = function(file, ...) readLines(file, encoding = 'UTF-8', warn = FALSE, ...)
writeUTF8 = function(text, ...) writeLines(enc2utf8(text), ..., useBytes = TRUE)

pandoc2.0 = function() rmarkdown::pandoc_available('2.0')
