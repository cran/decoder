context("extra_functions")

x <- decoder:::sjukvardsomrade$key

test_that("kungalv2Storgoteborg", {
  expect_false(
    "Kungalv" %in% unique(decode(x, "sjukvardsomrade", "kungalv2Storgoteborg")))
})

test_that("kungalv2Fyrbodal", {
  expect_false(
    "Kungalv" %in% unique(decode(x, "sjukvardsomrade", "kungalv2Fyrbodal")))
})

test_that("real_names", {
  expect_equal(unique(decode(x, "sjukvardsomrade", "real_names")), 
    c("Norra Halland", "Storg\u00F6teborg", "Kung\u00E4lv", 
      "Fyrbodal", "S\u00F6dra \u00C4lvsborg", "Skaraborg"))
})


test_that("short_region_names", {
  expect_equal(decode(3:6, "region", "short_region_names"),
   c("Syd\u00F6stra", "Syd", "V\u00E4st", "Norr"))
})

test_that("RC names", {
  expect_equal(
    decode(500004, "sjukhus_rc", "sjukhus_rc_namn"), "Angereds N\u00E4rsjukhus")
  expect_equal(
    decode(500004, "sjukhus_rc", "forvaltning_rc_namn"), "Angereds n\u00E4rsjukhus")
})
