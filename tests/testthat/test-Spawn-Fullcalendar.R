test_that("Can create object", {
  fc = fullercalendar()

  expect_equal(class(fc), c("fullercalendar", "htmlwidget"))
})
