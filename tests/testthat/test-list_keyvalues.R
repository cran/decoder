context("list_keyvalues")

test_that("misc", {
    expect_that(all(c("snomed", "kon", "sjukvardsomrade", "lan") %in% list_keyvalues()), is_true())
    expect_that(list_keyvalues(), is_equivalent_to(ALL_KEYVALUE_OBJECTS))
})
