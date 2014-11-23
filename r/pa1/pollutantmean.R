pollutantmean <- function(directory, pollutant, id = 1:332) {
  all_measurements = c()
  for(index in id) {
  	data = readfile(directory, sprintf("%03d.csv", index))

    pollutant_measurements = data[[pollutant]]
    valid_measurements = pollutant_measurements[!is.na(pollutant_measurements)]

    all_measurements = c(all_measurements, valid_measurements)
  }
  mean(all_measurements)
}
