context("as.keyvalue.data.frame")

iris2 <- iris[, 1:2]
names(iris2) <- c("key", "value")
iris3 <- iris2[!duplicated(iris2$key),]

test_that("misc", {
  expect_error(as.keyvalue.data.frame(iris), 
    "A keyvalue object must have exactly two columns: 'key' and 'value'!")
  expect_error(as.keyvalue.data.frame(iris2), "All keys must be unique!")
  expect_is(as.keyvalue.data.frame(iris3), "keyvalue")
  expect_false(is.keyvalue11(as.keyvalue.data.frame(iris3)))
})
