
context("as.keyvalue.list")

ex <- list(
    fruit  = c("banana", "orange", "kiwi"),
    car    = c("SAAB", "Volvo", "taxi", "truck"),
    animal = c("elefant")
)

# An invalid list (non unique names; not because of silly classification)
ex2 <- list(
    fruit  = c("banana", "orange", "kiwi"),
    car    = c("SAAB", "Volvo", "taxi", "truck"),
    animal = c("elefant"),
    fruit  = c("President_Obama")
)

# An invalid list (non unique keys; kiwi appear twice)
ex3 <- list(
    fruit  = c("banana", "orange", "kiwi"),
    car    = c("SAAB", "Volvo", "taxi", "truck"),
    animal = c("elefant", "kiwi")
)

test_that("misc", {
    expect_that(as.keyvalue.list(ex), is_a("keyvalue"))
    expect_that(as.keyvalue.list(ex2), throws_error())
    expect_that(as.keyvalue.list(ex3), throws_error())
})
