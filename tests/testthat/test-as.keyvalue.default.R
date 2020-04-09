context("as.keyvalue.default")

test_that("misc", {
  expect_error(as.keyvalue.default(1), 
    "All elements of vector 'x' must be named!")
  expect_is(as.keyvalue.default(1, "hej"), "keyvalue")
  expect_error(as.keyvalue.default(1:10, letters), 
    "arguments imply differing number of rows")
  expect_error(as.keyvalue(1:10), "All elements of vector 'x' must be named!")
})
