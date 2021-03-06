
library(randtests)
                                        #Wald-Wolf 1s Test
sqlstr <- paste0("SELECT * FROM tblWW1SMulti WHERE DATASETID = 1")
res <- sqlQuery(connection, sqlstr)
Renv = new.env(parent = globalenv())
Renv$dat <- res$num_val
FLenv = as.FL(Renv)
                                        # Making the model.
Renv$res1 <- runs.test(Renv$dat,threshold = 6.2 )
FLenv$res1 <- WaldWolftest1s(FLenv$dat, threshold = 6.2)

test_that("Wald-Wolfowitz One Sample Test:",{
    result = eval_expect_equal({
        p.val <- res1$p.value
        z <- res1$statistic
    },Renv,FLenv,
    noexpectation=c("res1"),
    expectation = c("p.val","z"),
    check.attributes=FALSE)
    })




                                        #Wald Wolf 1s Test:
data(sweetpotato)
Renv = new.env(parent = globalenv())
Renv$yield <- sweetpotato$yield
FLenv = as.FL(Renv)
Renv$res1 <- runs.test(Renv$yield)
FLenv$res1 <- WaldWolftest1s(FLenv$yield)

test_that("Wald-Wolfowitz One Sample Test:",{
    result = eval_expect_equal({
        p.val <- res1$p.value
        z <- res1$statistic
    },Renv,FLenv,
    noexpectation=c("res1"),
    expectation = c("p.val","z"),
    check.attributes=FALSE)
    })
