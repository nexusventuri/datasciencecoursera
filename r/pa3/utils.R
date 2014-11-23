readcsv = function(filename) {
  read.csv(sprintf("data/%s", filename), colClasses = "character")
}

loadPackage <- function(package) {
	if(!require(package, character.only=TRUE)) {
		install.packages(package)
		if(!require(x,character.only = TRUE)) stop("Package not found")
	}
}

checkState = function(state, states) {
	if(!is.element(state, states)) stop("invalid state")
}

checkOutcome = function(outcome) {
	if(!(outcome %in% names(getOutcomeMap()))) stop("invalid outcome")
}

getOutcomeMap = function() {
	list("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
}

sortByOutcomeAndHospitalName = function(data, outcome) {
	data[order(data[, getOutcomeColumn(outcome)], data[, "Hospital.Name"], decreasing=FALSE), ]
}

getOutcomeColumn = function(short_name) {
	getOutcomeMap()[[short_name]]
}

asDouble = function(column) {
	suppressWarnings(as.double(column))
}

rowFromNum(num, data) {
	if(num == "best") return(1)
	if(num == "worst") return(nrow(sorted_data))
	return(num)
}
