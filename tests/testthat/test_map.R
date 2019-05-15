library(testthat)
context("row_col_map")

library(xts)
a_df = data.frame(a = 1:10, b = 11:20)
a_xts = as.xts(a_df, order.by = seq(Sys.Date() - 9, Sys.Date(), by = 1))
a_xts



expect_is(colMap(a_df, max), "data.frame")
expect_is(colMap(a_xts, max), "matrix")

