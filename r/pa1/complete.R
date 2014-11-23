complete <- function(directory, id = 1:332) {
  length = length(id)
  result = data.frame(id = numeric(length), nobs = numeric(length))

  for(index in 1:length) {
  	monitor_id = id[index]

		data = readfile(directory, sprintf("%03d.csv", monitor_id))

    nobs = sum(!is.na(data$nitrate) & !is.na(data$sulfate))

    result$id[index] = monitor_id
    result$nobs[index] = nobs
  }
  result
}
