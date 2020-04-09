context("code")

test_that("doesn't work", {
  expect_error(code(decoder::snomed$value, "snomed", verbose = FALSE), 
    "Some values have a non 1:1 relation to their key.")
  expect_error(capture_output(code(decoder::snomed$value, "snomed")), 
    "Values above have a non unique relation to their key!")
})

test_that("works", {
  expect_equal(code(kon$value, "kon"), as.character(1:2))
})
