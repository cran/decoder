
context("keyvalue_methods")

test_that("summary.keyvalue", {
    expect_that(summary(snomed), is_a("list"))
    expect_that(length(summary(snomed)), is_equivalent_to(3))
    expect_that(names(summary(snomed)), 
                is_equivalent_to(c("data.frame.summary", "standard_var_names", "nonunique")))
    expect_that(summary(snomed)$standard_var_names, is_equivalent_to("snomed"))
    expect_that(summary(snomed)$nonunique, is_a("keyvalue"))
})
