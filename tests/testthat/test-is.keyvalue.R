context("is.keyvalue")

## is.keyvalue alreade tested in "test-datasets_keyvalue.R"

test_that("is.keyvalue11", {
    expect_that(is.keyvalue11(snomed), is_false())
    expect_that(is.keyvalue11(kon), is_true())
})
