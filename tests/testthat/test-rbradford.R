test_that("c parameter not bigger than 1 returns error", {
  expect_error(rbradford(n=100,c=-1))
})

test_that("values returned are between 0 and 1", {
  expect_true(
    any(dplyr::between(rbradford(n=100),0,1))
  )
})

test_that("vector is of length n", {
  expect_length(
    rbradford(n=100),100
  )
})
