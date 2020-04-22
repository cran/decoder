context("decode")

set.seed(12345)

d <- 
  data.frame(
    kon = sample(1:2, 10, replace = TRUE), 
    sex = sample(1:2, 10, replace = TRUE),
    lkf = sample(decoder::hemort$key, 10, replace = TRUE)
  )
  
test_that("decode.default", {
  expect_equivalent(decode(1:2, "kon"), c("Man", "Kvinna"))
  expect_equal(length(decode(snomed$key, "snomed")), length(snomed$key))
  expect_warning(decode("      0000001", "kon"))
  suppressWarnings(expect_equal(decode("      0000001", "kon"), "Man"))
  suppressWarnings(
    expect_equal(decode(c(0002425, 2425, "df"), "kommun"), 
               c("Dorotea", "Dorotea", NA)))
  expect_warning(decode(c(1:6, letters[1:5]), "region"), "(a, b, c, d, e)")
  expect_warning(decode(c(1:6, letters[1:10]), "region"), "(10 cells)")
})


test_that("decode.data.frame", {
  suppressMessages(expect_equal(decode(iris), iris))
  suppressMessages(
    expect_equal(decode(data.frame(KON_VALUE = 1:2))$KON_VALUE_kon_beskrivning,
              c("Man", "Kvinna")
  ))        
  suppressMessages(suppressWarnings(expect_equal(ncol(decode(d)), 9)))
  expect_message(
    decode(data.frame(KON_VALUE = 1, KON_VALUE_kon_beskrivning = "Man")),
    "seems to be already decoded")
})

