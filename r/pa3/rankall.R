rankall <- function(outcome, num = "best") {
	checkOutcome(outcome)
	data = readcsv("outcome-of-care-measures.csv")

	outcome_column = getOutcomeColumn(outcome)
	data[, outcome_column] = asDouble(data[, outcome_column])
	data = data[complete.cases(data[, outcome_column]),]

	state_data = split(data, data$State)

	sorted_data = lapply(state_data, function(x) sortByOutcomeAndHospitalName(x, outcome))

	h = c()
	s = c()
	r = lapply(sorted_data, function(x) { h <<- c(h, x[rowFromNum(num, x), "Hospital.Name"]); s <<- c(s, x[1, "State"]) })

	as.data.frame(list(hospital=h, state=s), row.names=s)
}
