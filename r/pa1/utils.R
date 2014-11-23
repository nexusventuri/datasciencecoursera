readfile <- function(directory, filename) {
  full_path = paste(directory, "/", filename, sep="")
  data = read.csv(full_path)
}

loadPackage <- function(package) {
	if(!require(package, character.only=TRUE)) {
		install.packages(package)
		if(!require(x,character.only = TRUE)) stop("Package not found")
	}
}
