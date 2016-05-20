
context("as.key")

test_that("as.key", {
    expect_that(as.character(as.key(1:10)), is_equivalent_to(as.character(1:10)))
    expect_that(as.key(1:10), is_a("key"))
    expect_that(as.key(1:10), is_a("value"))
    expect_that(as.key(1:10), is_a("character"))
    expect_that(as.key(c(1:10, 1:10)), throws_error())
})


test_that("is.key", {
    expect_that(is.key(snomed$key), is_true())
    expect_that(is.key(snomed$value), is_false())
    expect_that(is.key(kon$value), is_true())
})
