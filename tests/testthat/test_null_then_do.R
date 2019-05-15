library(testthat)
context("NULL then do")

test_that("NULL then do", {
    expect_true(ifnull(NULL, {1}) == 1)
    expect_true(ifnotnull(NULL, {1}, {2}) == 2)
    expect_true(ifnotnull(1, {1}, {2}) == 1)
})