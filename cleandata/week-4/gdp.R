#!/usr/bin/env Rscript

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "GDP.csv", method="curl")

Sys.setlocale(locale="C")
gdp = read.csv("GDP.csv", skip=4)
names(gdp) = c("CountryCode", "Rank", "-", "Country", "GDP")
gdp = gdp[1:190,1:5]

gdp[,5] = as.numeric(gsub(",", "", gdp[,5]))

print("# GDP mean")
mean(gdp[,5])

print("# Grep string")
length(grep("^United", gdp[,4]))

install.packages("plyr")
library("plyr")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "stats_country.csv", method="curl")
country_stats = read.csv("stats_country.csv")

country_stats_and_gdp = merge(gdp, country_stats, by.x="CountryCode", by.y="CountryCode")

print("# Number of countries with the fiscal year ending in June")
length(country_stats_and_gdp[grep("Fiscal year end: June", country_stats_and_gdp$Special.Notes), ][["Special.Notes"]])
