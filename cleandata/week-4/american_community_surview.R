#!/usr/bin/env Rscript
k = download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "AmericanCommunitySurvey", method="curl")
data = read.csv("AmericanCommunitySurvey")
str(data)
strsplit(names(data), "wgtp")[[123]]
