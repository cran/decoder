
context("decode")

set.seed(12345)

d <- data.frame(
         kon = sample(1:2, 10, replace = TRUE), 
         sex = sample(1:2, 10, replace = TRUE),
         lkf = sample(decoder:::hemort$key, 10, replace = TRUE)
    )

suppressMessages({
suppressWarnings({
    
    test_that("decode.default", {
        expect_that(decode(1:2, "kon"), is_equivalent_to(c("Man", "Kvinna")))
        expect_that(length(decode(snomed$key, "snomed")), is_equivalent_to(length(snomed$key)))
        expect_that(decode("      0000001", "kon"), gives_warning())
        expect_that(decode("      0000001", "kon"), is_equivalent_to("Man"))
        expect_that(decode(c(0002425, 2425, "df"), "kommun"), is_equivalent_to(c("Dorotea", "Dorotea", NA)))
        expect_warning(decode(c(1:6, letters[1:5]), "region"), "(a, b, c, d, e)")
        expect_warning(decode(c(1:6, letters[1:10]), "region"), "(10 cells)")
    })
    
    
    test_that("decode.data.frame", {
        expect_that(decode(iris), is_equivalent_to(iris))
        expect_that(decode(data.frame(KON_VALUE = 1:2))$KON_VALUE_kon_beskrivning,
                    is_equivalent_to(c("Man", "Kvinna"))
                    )        
        expect_that(ncol(decode(d)), is_equivalent_to(9)) 
        
        
    })
})
})
