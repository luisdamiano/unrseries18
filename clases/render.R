library(rmarkdown)

setwd(dirname(rstudioapi::getSourceEditorContext()$path))
files <- 0:7
for (f in files) {
  rmdfile <- paste0(f, ".Rmd")
  pdffile <- paste0(f, ".pdf")
  outfile <- file.path("out", paste0(f, ".pdf"))

  render(
    input       = rmdfile,
    output_file = pdffile,
    envir       = globalenv(),
    encoding    = "UTF-8"
  )

  file.rename(
    from = pdffile,
    to   = outfile
  )

  browseURL(file.path(getwd(), outfile))
}
