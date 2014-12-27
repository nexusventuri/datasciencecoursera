loadPackage <- function(package) {
	if(!require(package, character.only=TRUE)) {
		install.packages(package)
		if(!require(package,character.only = TRUE)) stop("Package not found")
	}
}
