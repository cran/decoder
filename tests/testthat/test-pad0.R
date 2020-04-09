context("pad0")

test_that("multiplication works", {
  expect_equal(pad0("apa", 10), "0000000apa")
  expect_equal(pad0(c("apa", "bepa"), 10), c("0000000apa", "000000bepa"))
  expect_equal(pad0(c("apa", "bepa"), c(10, 20)), 
               c("0000000apa", "0000000000000000bepa"))
})
