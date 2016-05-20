
context("code")

test_that("doesn't work", {
    expect_that(code(snomed$value, "snomed", verbose = FALSE), throws_error())
})


test_that("works", {
    expect_that(code(kon$value, "kon"), is_equivalent_to(as.character(1:2)))
})
