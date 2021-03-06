# Test Case 1
set.seed(450)
Renv <- new.env(parent = globalenv())
Renv$x <- rnorm(50, mean = 0, sd = 2)
Renv$y <- rnorm(30, mean = 1, sd = 1)
FLenv <- as.FL(Renv)



test_that("F- Test: R example",{
  result = eval_expect_equal({
      t <- var.test(x, y)
      t$conf.int <- NULL
  },Renv,FLenv,
    expectation = c("t"),
  check.attributes=F,
  tolerance = .000001,
  verbose = F
  )
}) 

# gk @sanchit: please move this test to limitations
test_that("F- Test: R example, DB Lytix is returning confidence intervall",{
  result = eval_expect_equal({
      t <- var.test(x, y)
  },Renv,FLenv,
    expectation = c("t"),
  check.attributes=F,
  tolerance = .000001,
  verbose = F
  )
}) 

# Test Case 2
Renv <- new.env(parent = globalenv())
str <- paste0("SELECT * FROM tblHypoTest WHERE testtype = 'tTest' AND Num_Val IS NOT NULL")
result <- sqlQuery(connection, str)
colnames(result) <- toupper(colnames(result))
Renv$d <- result[result$GROUPID == 1, ]$NUM_VAL
Renv$f <- result[result$GROUPID == 2, ]$NUM_VAL
FLenv <- as.FL(Renv)


test_that("F- Test: DB Lytix Example",{
  result = eval_expect_equal({
      t <- var.test(d, f)
      t$conf.int <- NULL
  },Renv,FLenv,
    expectation = c("t"),
  check.attributes=F,
  tolerance = .000001,
  verbose = F
  )
}) 


# error when instead of using FLVectors using subset of FLTable.
# null.value, estimate, conf.int not computed as of now
