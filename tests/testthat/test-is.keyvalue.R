context("is.keyvalue")

test_that("is.keyvalue11", {
  expect_false(is.keyvalue11(snomed))
  expect_true(is.keyvalue11(kon))
})
  
