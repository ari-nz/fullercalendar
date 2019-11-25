test_that("isodate produces correct dates", {

  date_scalar = as.Date('2019-07-05')
  date_vector = rep(date_scalar, 3) + 0:2


  expect_equal(isodate(date_scalar), "2019-07-05")
  expect_equal(isodate(date_vector), c("2019-07-05", "2019-07-06", "2019-07-07"))
})






test_that("isotime produces correct times", {

  datetime_scalar = as.POSIXct('2019-07-05 09:45:32', tz = 'Australia/Perth')
  datetime_vector = rep(datetime_scalar, 3) + (3600 * 0:2)


  expect_equal(isotime(datetime_scalar), "2019-07-05T09:45:32+0800")
  expect_equal(isotime(datetime_vector), c("2019-07-05T09:45:32+0800",
                                           "2019-07-05T10:45:32+0800",
                                           "2019-07-05T11:45:32+0800"))

  datetime_scalar_w_system_tzone = Sys.time()
  expect_equal(
    isotime(datetime_scalar_w_system_tzone) %>%
      gsub("T"," ", .) %>%
      gsub("\\+.*$","", .),
      as.character(datetime_scalar_w_system_tzone)
  )

})

