#!/usr/bin/env Rscript

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "GDP.csv", method="curl")
data = read.csv("GDP.csv", skip=4)
names(data) = c("Country Code", "Rank", "-", "Country", "GDP")
data = data[1:190,1:5]

data[,5] = as.numeric(gsub(",", "", data[,5]))
mean(data[,5])
