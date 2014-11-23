corr <- function(directory, threshold = 0) {
  files = list.files(directory)
  correlations = c()

  for(file in files) {
		data = readfile(directory, file)

		validNitrate = complete.cases(data$nitrate)
		validSulfate = complete.cases(data$nitrate)
    nobs = sum(validNitrate & validSulfate)

    if(nobs > threshold) {
      valid_data = data[!is.na(data$nitrate) & !is.na(data$sulfate),]
      correlation = cor(valid_data$sulfate, valid_data$nitrate)
      correlations = c(correlations, correlation)
    }
  }
  correlations
}
