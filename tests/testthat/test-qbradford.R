test_that("c parameter not bigger than 1 returns error", {
  expect_error(qbradford(p=0.5,c=-1))
})

test_that("probabilty value not between (0,1) returns error", {
  expect_error(qbradford(p=-0.5))
})

test_that("values returned are between 0 and 1", {
  expect_true(
    any(dplyr::between(qbradford(p=seq(0,1,0.01)),0,1))
  )
})
