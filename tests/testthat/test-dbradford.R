test_that("c parameter not bigger than 1 returns error", {
  expect_error(dbradford(x=0.5,c=-1))
})

test_that("x value not between (0,1) returns error", {
  expect_error(dbradford(x=-0.5))
})

test_that("values returned is between 0 and 1", {
  expect_true(
    any(dplyr::between(dbradford(x=seq(0,1,0.01)),0,1))
  )
})
