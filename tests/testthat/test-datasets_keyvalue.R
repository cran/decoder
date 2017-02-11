context("datasets_keyvalue")

test_that("correct classes",{
  
  ## Geography
  expect_is(region,            "keyvalue")
  expect_is(lan,               "keyvalue")
  expect_is(kommun,            "keyvalue")
  expect_is(forsamling,        "keyvalue")
  expect_is(distrikt,          "keyvalue")
  
  ## Administration
  expect_is(sjukhus,           "keyvalue")
  expect_is(klinik,            "keyvalue")
  expect_is(patologiavdelning, "keyvalue")
  
  ## Diagnoses
  expect_is(t_rtr,             "keyvalue")
  expect_is(n_rtr,             "keyvalue")
  expect_is(m_rtr,             "keyvalue")
  expect_is(figo,              "keyvalue")
  expect_is(tnmgrund,          "keyvalue")
  expect_is(sida,              "keyvalue")
  expect_is(icd7,              "keyvalue")
  expect_is(icd9,              "keyvalue")
  expect_is(icd10,             "keyvalue")
  expect_is(icdo,              "keyvalue")
  expect_is(icdo3,             "keyvalue")
  expect_is(snomed,            "keyvalue")
  expect_is(snomed3,           "keyvalue")
  expect_is(pad,               "keyvalue")
  
  ## Others
  expect_is(kon,               "keyvalue")
  
  ## keyvaluem1
  expect_is(sjukvardsomrade,   "keyvalue")
})
