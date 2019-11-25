test_that("multiplication works", {
  fc = fullercalendar()

  expect_equal(class(fc), c("fullercalendar", "htmlwidget" ))
})
