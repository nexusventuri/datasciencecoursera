#!/usr/bin/env Rscript
source("utils.R")

loadPackage("quantmod")
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

loadPackage("lubridate")

samples_2012 = sampleTimes[year(sampleTimes) == 2012]
samples_2012_on_monday = samples_2012[weekdays(samples_2012) == "Monday"]

print("# Samples per date")
list("2012 Samples"=length(samples_2012), "2012 Samples on monday" = length(samples_2012_on_monday))
