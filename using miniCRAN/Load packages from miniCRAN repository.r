# Loading packages with miniCRAN

localCRAN <- "~/local-CRAN-repo"

list.files(path = localCRAN, recursive = TRUE)

uri <- paste0("file:///", normalizePath(localCRAN))
options(repos = c(CRAN=uri))
getOption("repos")

available.packages()

# Now install the package
install.packages(c('dplyr','ggplot'))
