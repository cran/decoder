
context("formt_as_key")

suppressWarnings({

    test_that("lkf", {
        expect_that(all(nchar(format_as_key(forsamling$key, "lan")$x) <= 2), is_true())
        expect_that(all(nchar(format_as_key(forsamling$key, "kommun")$x) <= 4), is_true())
        expect_that(all(nchar(format_as_key(forsamling$key, "forsamling")$x) <= 6), is_true())
        expect_that(all(nchar(format_as_key(forsamling$key, "lan")$x) == 2), gives_warning())
    })

})
