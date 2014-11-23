rankhospital <- function(state, outcome, num = "best") {
	data = readcsv("outcome-of-care-measures.csv")

	checkState(state, unique(data$State))
	checkOutcome(outcome)

	outcome_column = getOutcomeColumn(outcome)

	state_data = data[data$State == state,]
	state_data[, outcome_column] = asDouble(state_data[, outcome_column])

	state_data = state_data[complete.cases(state_data[, outcome_column]), ]
	sorted_data = sortByOutcomeAndHospitalName(state_data, outcome)

	row_index = rowFromNum(num, sorted_data)

	sorted_data[row_index, "Hospital.Name"]
}
