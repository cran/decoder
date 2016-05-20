
context("as.keyvalue.data.frame")

iris2 <- iris[,1:2]
iris3 <- iris2
names(iris3) <- c("key", "value")
iris4 <- iris3[!duplicated(iris3$key),]


test_that("misc", {
    expect_that(as.keyvalue.data.frame(iris), throws_error())
    expect_that(as.keyvalue.data.frame(iris2), throws_error())
    expect_that(as.keyvalue.data.frame(iris3), throws_error())
    expect_that(as.keyvalue.data.frame(iris4), is_a("keyvalue"))
    expect_that(is.keyvalue11(as.keyvalue.data.frame(iris4)), is_false())
})
