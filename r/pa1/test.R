source("project.R")
loadPackage("testthat")

context("pollutantmean")
test_that("pollutantmean returns expected results", {
	expect_that(pollutantmean("specdata", "sulfate", 1:10), equals(4.064, tolerance = 0.001))
	expect_that(pollutantmean("specdata", "nitrate", 70:72), equals(1.706, tolerance = 0.001))
	expect_that(pollutantmean("specdata", "nitrate", 23), equals(1.281, tolerance = 0.001))
})


context("complete")
test_that("should return the expected result for monitor 1", {
	result = complete("specdata", 1)

	expect_that(nrow(result), equals(1))
	expect_that(result[1, "id"], equals(1))
	expect_that(result[1, "nobs"], equals(117))
})

test_that("should return expected result for a vector of monitor ids", {
	result = complete("specdata", c(2, 4, 8, 10, 12))

	expect_that(nrow(result), equals(5))
	expect_that(result[2, "nobs"], equals(474))

	expect_that(result[5, "id"], equals(12))
	expect_that(result[5, "nobs"], equals(96))
})

test_that("should solve for range of monitor ids", {
	result = complete("specdata", 30:25)

	expect_that(nrow(result), equals(6))
	expect_that(result[3, "nobs"], equals(475))

	expect_that(result[6, "id"], equals(25))
	expect_that(result[6, "nobs"], equals(463))
})


context("corr")
test_that("should return expected value with 150 threshold", {
	cr <- corr("specdata", 150)
	
	expect_that(head(cr), equals(c(-0.01896, -0.14051, -0.04390, -0.06816, -0.12351, -0.07589), tolerance = 0.01))

	summary_vector = as.numeric(summary(cr))
	expect_that(summary_vector, equals(c(-0.2110, -0.0500, 0.0946, 0.1250, 0.2680, 0.7630), tolerance = 0.01))
})

test_that("should return expected values with 400 threshold", {
	cr <- corr("specdata", 400)
	expect_that(head(cr), equals(c(-0.0189, -0.04390, -0.06816, -0.07589, 0.76313, -0.15783), tolerance = 0.01))

	summary_vector = as.numeric(summary(cr))
	expect_that(summary_vector, equals(c(-0.1760, -0.0311, 0.1000, 0.1400, 0.2680, 0.7630), tolerance = 0.01))
})


test_that("should not return any result with a high threshold", {
	cr <- corr("specdata", 5000)

	expect_that(length(cr), equals(0))
})

test_that("should return all measurements when no threshold is passed", {
	cr <- corr("specdata")

	expect_that(length(cr), equals(323))
}) 
