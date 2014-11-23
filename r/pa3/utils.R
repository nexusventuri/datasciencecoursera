readcsv = function(filename) {
  read.csv(sprintf("data/%s", filename), colClasses = "character")
}

loadPackage <- function(package) {
	if(!require(package, character.only=TRUE)) {
		install.packages(package)
		if(!require(x,character.only = TRUE)) stop("Package not found")
	}
}
