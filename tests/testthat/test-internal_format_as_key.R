context("formt_as_key")

test_that("lkf", {
  suppressWarnings(
    expect_true(all(nchar(format_as_key(forsamling$key, "lan")$x) <= 2)))
  expect_warning(format_as_key(forsamling$key, "lan"),
    "Only the first 2 characters are used.")
  suppressWarnings(
    expect_true(all(nchar(format_as_key(forsamling$key, "kommun")$x) <= 4)))
  expect_true(all(nchar(format_as_key(forsamling$key, "forsamling")$x) <= 6))
  expect_warning(format_as_key(".01", "lan"),
    "Punctuations are removed.")
  expect_warning(format_as_key("A", c("b" = "a")),
    "Capitals are changed to lower case.")
  expect_warning(format_as_key("a", c("B" = "A")),
    "Lower case are changed to upper case.")
  expect_warning(format_as_key(1, c(a = "01")),
    "Leading 0:s are introduced for short characters.")
})
