
context("as.keyvalue.default")

test_that("misc", {
    expect_that(as.keyvalue.default(1), throws_error())
    expect_that(as.keyvalue.default(1, "hej"), is_a("keyvalue"))
    expect_that(as.keyvalue.default(1:10, letters), throws_error())
    
})
