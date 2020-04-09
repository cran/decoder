context("as.keyvalue.list")

ex <- list(
  fruit  = c("banana", "orange", "kiwi"),
  car    = c("SAAB", "Volvo", "taxi", "truck"),
  animal = c("elefant")
)

# An invalid list (non unique names; not because of silly classification)
ex2 <- list(
  fruit  = c("banana", "orange", "kiwi"),
  car    = c("SAAB", "Volvo", "taxi", "truck"),
  animal = c("elefant"),
  fruit  = c("President_Obama")
)

# An invalid list (non unique keys; kiwi appear twice)
ex3 <- list(
  fruit  = c("banana", "orange", "kiwi"),
  car    = c("SAAB", "Volvo", "taxi", "truck"),
  animal = c("elefant", "kiwi")
)

test_that("misc", {
  expect_is(as.keyvalue.list(ex), "keyvalue")
  expect_error(as.keyvalue.list(ex2), 
    "All list element names must be unique!")
  expect_error(as.keyvalue.list(ex3), "Some key\\(s\\) have duplicates!")
  expect_error(as.keyvalue(list(1:10)), "All elements of x must be named")
  expect_error(as.keyvalue(list(a = list(1:10))), 
    "All elements of the list should be atomic!")
})
