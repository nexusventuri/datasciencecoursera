corr <- function(directory, threshold = 0) {
  files = list.files(directory)
  correlations = c()

  for(file in files) {
		data = readfile(directory, file)

		valid_rows = complete.cases(data$nitrate) & complete.cases(data$sulfate)
    nobs = sum(valid_rows)

    if(nobs > threshold) {
      valid_data = data[valid_rows,]
      correlation = cor(valid_data$sulfate, valid_data$nitrate)
      correlations = c(correlations, correlation)
    }
  }
  correlations
}
