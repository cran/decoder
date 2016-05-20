
context("as.value")


test_that("as.value", {
    expect_that(as.value(1:10), is_a("value"))
    expect_that(as.value(1:10), is_a("integer"))
})


test_that("is.value", {
    expect_that(is.value(snomed$value), is_true())
    expect_that(is.value(snomed$key), is_true())
})
