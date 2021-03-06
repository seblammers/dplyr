test_that("tbl_nongroup_vars() excludes group variables", {
  gdf <- group_by(mtcars, cyl)
  expect_identical(tbl_nongroup_vars(gdf), setdiff(tbl_vars(gdf), "cyl"))
})

test_that("tbl_vars() records groups", {
  gdf <- group_by(mtcars, cyl, am)
  expect_s3_class(tbl_vars(gdf), "dplyr_sel_vars")
  expect_true(is_sel_vars(tbl_vars(gdf)))
  expect_identical(tbl_vars(gdf) %@% groups, c("cyl", "am"))
})
