best <- function(state, outcome) {
## Read outcome data
	data = readcsv("outcome-of-care-measures.csv")

	outcome_map = list("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)

	is.a.valid.state(state, unique(data$State))
	is.a.valid.outcome(outcome, outcome_map)

	outcome_col = outcome_map[[outcome]]

	state_data = data[data$State == state,]

	state_data[, outcome_col] = as.double(state_data[, outcome_col])
	state_data[, "Hospital.Name"] = as.character(state_data[, "Hospital.Name"])

	sorted_data = state_data[order(state_data[,outcome_col], state_data[, "Hospital.Name"], decreasing=FALSE), ]

	sorted_data[1, "Hospital.Name"]
}

is.a.valid.state = function(state, states) {
	if(!is.element(state, states)) stop("invalid state")
}

is.a.valid.outcome = function(outcome, outcomes) {
	if(!(outcome %in% names(outcomes))) stop("invalid outcome")
}

