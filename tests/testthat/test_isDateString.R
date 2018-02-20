#library(stringr)
context("isDateString()")

test_that("Is string a Date string like \"2017-01-01\"", {
    expect_equal(isDateString("adsf"), F)
    expect_equal(isDateString("2017-01-01"),T)
    expect_equal(isDateString("20170101"), F)
})