#' --------------------------------------------------------------------------------
#' Save packages and all the dependencies into a local folder 
#' --------------------------------------------------------------------------------
#' @param pkgs - vector of packages names 
#' @param local_cran_folder - folder to save packages to
#' --------------------------------------------------------------------------------

save_to_local_minicran_repo <- function(pkgs = c('dplyr','ggplot'), local_cran_folder = "~/local-CRAN-repo") {
  
  library("miniCRAN")
  options(repos = c(CRAN = "http://cran.at.r-project.org/"))

# Plot the dependencies 
p <- makeDepGraph(pkgs, enhances = TRUE)
set.seed(20140917)
plot(p, cex=1.5, vertex.size=15)
  
# Set a folder  

list.files(path = local_cran_folder, recursive = TRUE)
delete_folder <- tolower(readline(paste("Delete all the current content in folder", local_cran_folder,"? (Y/N)   ")))
if (delete_folder == 'y') {unlink(local_cran_folder,recursive=TRUE)}

# Create subfolder
if(!file.exists(local_cran_folder)) {dir.create(local_cran_folder)} 

# Make a source repo 
save_source <- tolower(readline(paste("Save source (Y/N)   ")))
if (save_source == 'y') {makeRepo(pkgDep(pkgs), path = local_cran_folder, type = "source")}

# Make a binary repo 
save_binary <- tolower(readline(paste("Save binary (Y/N)   ")))
if (save_binary == 'y') {makeRepo(pkgDep(pkgs), path = local_cran_folder, type = "win.binary")}

# print the list of files saved  
list.files(path = localCRAN, recursive = TRUE)

# Final instruction ...
print(paste('Please archive the folder', local_cran_folder,'and move it to the remote location'))

}
