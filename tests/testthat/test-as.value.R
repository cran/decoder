context("as.value")

test_that("as.value", {
  expect_is(as.value(1:10), c("value", "integer"))
})

test_that("is.value", {
  expect_true(is.value(decoder::snomed$value))
  expect_true(is.value(decoder::snomed$key))
})
