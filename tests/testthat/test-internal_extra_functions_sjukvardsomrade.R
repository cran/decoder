
context("extra_functions")

x <- decoder:::sjukvardsomrade$key

test_that("kungalv2Storgoteborg", {
    expect_that("Kungalv" %in% unique(decode(x, "sjukvardsomrade", "kungalv2Storgoteborg")), is_false())
})


test_that("kungalv2Fyrbodal", {
    expect_that("Kungalv" %in% unique(decode(x, "sjukvardsomrade", "kungalv2Fyrbodal")), is_false())
})


test_that("real_names", {
    expect_that(unique(decode(x, "sjukvardsomrade", "real_names")), 
                is_equivalent_to(c("Norra Halland", "Storg\u00F6teborg", "Kung\u00E4lv", 
                                   "Fyrbodal", "S\u00F6dra \u00C4lvsborg", "Skaraborg")))
})


