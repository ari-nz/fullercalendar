test_that("multiplication works", {
  testthat::expect_is(demoevents(), "data.frame")
  testthat::expect_is(randomevents(), "data.frame")
})
