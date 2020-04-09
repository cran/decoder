context("as.key")

test_that("as.key", {
  expect_equal(as.character(as.key(1:10)), as.character(1:10))
  expect_is(as.key(1:10), c("key", "value", "character"))
  expect_error(as.key(c(1:10, 1:10)))
})


test_that("is.key", {
  expect_true(is.key(decoder::snomed$key))
  expect_false(is.key(decoder::snomed$value))
  expect_true(is.key(decoder::kon$value))
})
