context("keyvalue_methods")

test_that("summary.keyvalue", {
  expect_is(summary(snomed), "list")
  expect_equal(length(summary(snomed)), 3)
  expect_equal(names(summary(snomed)), 
              c("data.frame.summary", "standard_var_names", "nonunique"))
  expect_equal(summary(snomed)$standard_var_names, "snomed")
  expect_is(summary(snomed)$nonunique, "keyvalue")
})
