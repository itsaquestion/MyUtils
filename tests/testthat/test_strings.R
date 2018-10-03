library(testthat)
context("row_col_map")

test_that("string begins and ends: usage", {
  expect_true(strBeginsWith("hello", "he"))
  expect_false(strBeginsWith("hello", "lo"))
  expect_true(strEndsWith("hello", "lo"))
  expect_false(strEndsWith("hello", "he"))

})

test_that("string begins and ends: expections", {
  expect_error(strBeginsWith("hello", NA))
  expect_error(strBeginsWith("hello", NaN))
  expect_warning(strBeginsWith("hello", ""))

  expect_error(strEndsWith("hello", NA))
  expect_error(strEndsWith("hello", NaN))
  expect_warning(strEndsWith("hello", ""))
})


test_that("conjoint strings ", {
	expect_equal("hello" %+% " world!", "hello world!")
	expect_equal(as.Date("2016-01-01") %+% ", ok", "2016-01-01, ok")
})

