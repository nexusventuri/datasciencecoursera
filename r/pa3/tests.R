source("project.R")

loadPackage("testthat")

context("best")
test_that("best returns expected results", {
	expect_that(best("TX", "heart attack"), equals("CYPRESS FAIRBANKS MEDICAL CENTER"))
	expect_that(best("TX", "heart failure"), equals("FORT DUNCAN MEDICAL CENTER"))
	expect_that(best("MD", "heart attack"), equals("JOHNS HOPKINS HOSPITAL, THE"))
	expect_that(best("MD", "pneumonia"), equals("GREATER BALTIMORE MEDICAL CENTER"))
})

test_that("best shows error messages", {
	expect_that(best("BB", "heart attack"), throws_error("invalid state"))
	expect_that(best("MD", "hart attack"), throws_error("invalid outcome"))
})

context("rank")
test_that("Rank are set as in the example", {
	expect_that(rankhospital("TX", "heart failure", 1), equals("FORT DUNCAN MEDICAL CENTER"))
	expect_that(rankhospital("TX", "heart failure", 2), equals("TOMBALL REGIONAL MEDICAL CENTER")) 
	expect_that(rankhospital("TX", "heart failure", 3), equals("CYPRESS FAIRBANKS MEDICAL CENTER")) 
	expect_that(rankhospital("TX", "heart failure", 4), equals("DETAR HOSPITAL NAVARRO")) 
	expect_that(rankhospital("TX", "heart failure", 5), equals("METHODIST HOSPITAL,THE")) 
	expect_that(rankhospital("TX", "heart failure", 6), equals("MISSION REGIONAL MEDICAL CENTER")) 
})

test_that("Rank are set as in the example", {
	expect_that(rankhospital("TX", "heart failure", 4), equals("DETAR HOSPITAL NAVARRO"))
	expect_that(rankhospital("MD", "heart attack", "worst"), equals("HARFORD MEMORIAL HOSPITAL"))
	expect_that(is.na(rankhospital("MN", "heart attack", 5000)), equals(TRUE))
})
