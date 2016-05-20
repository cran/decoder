
context("datasets_keyvalue")


test_that("correct classes",{
    
    ## Geography
    expect_that(region, is_a("keyvalue"))
    expect_that(lan, is_a("keyvalue"))
    expect_that(kommun, is_a("keyvalue"))
    expect_that(forsamling, is_a("keyvalue"))
    expect_that(distrikt, is_a("keyvalue"))
    
    ## Administration
    expect_that(sjukhus, is_a("keyvalue"))
    expect_that(klinik, is_a("keyvalue"))
    expect_that(patologiavdelning, is_a("keyvalue"))
    
    ## Diagnoses
    expect_that(t_rtr, is_a("keyvalue"))
    expect_that(n_rtr, is_a("keyvalue"))
    expect_that(m_rtr, is_a("keyvalue"))
    expect_that(figo, is_a("keyvalue"))
    expect_that(tnmgrund, is_a("keyvalue"))
    expect_that(sida, is_a("keyvalue"))
    expect_that(icd7, is_a("keyvalue"))
    expect_that(icd9, is_a("keyvalue"))
    expect_that(icd10, is_a("keyvalue"))
    expect_that(icdo, is_a("keyvalue"))
    expect_that(icdo3, is_a("keyvalue"))
    expect_that(snomed, is_a("keyvalue"))
    expect_that(snomed3, is_a("keyvalue"))
    expect_that(pad, is_a("keyvalue"))
    
    ## Others
    expect_that(kon, is_a("keyvalue"))
    
    ## keyvaluem1
    expect_that(sjukvardsomrade, is_a("keyvalue"))
    
})
