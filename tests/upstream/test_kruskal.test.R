Renv = new.env(parent = globalenv())
Renv$x <- c(2.9, 3.0, 2.5, 2.6, 3.2,3.8, 2.7, 4.0, 2.4,
            2.8, 3.4, 3.7, 2.2, 2.0)
Renv$g <- rep(1:3, c(5, 4, 5))
Renv$gfactor <- factor(Renv$g,
                 labels = c("Normal subjects",
                            "Subjects with obstructive airway disease",
                            "Subjects with asbestosis"))
Renv$flv <- c(1:3,62:64)
FLenv <- as.FL(Renv)
Renv$mydata <- as.data.frame(airquality)
colnames(Renv$mydata) <- c("Ozone", "SolarR", "Wind", "Temperature", "theMonth", "theDay")
FLenv$mydata <- as.FLTable(Renv$mydata,
                        tableName="ARBaseTestTempTable",
                        drop=TRUE)

# FLenv$fit <- kruskal.test.FLVector(FLenv$x,FLenv$g)
# Renv$fit <- stats::kruskal.test(Renv$x,Renv$g)
test_that("kruskal Test on FLVectors: R example: checking Result Equality without data.name:",{
    result = eval_expect_equal({
                fit <- kruskal.test(x=x,g=g)
                fit$data.name <- NULL
                class(fit) <- "list"
    },Renv,FLenv,
    expectation=c("fit"),
    verbose=T)
})

## test_that("kruskal Test on FLTable using subset: R example: checking Result Equality with subset:",{
##     result = eval_expect_equal({
##             fit <- kruskal.test(Ozone ~ theMonth, data = mydata,subset=flv)
##             # fit$p.value <- NULL
##             fit$data.name <- NULL
##             class(fit) <- "list"
##             },Renv,FLenv,
##     verbose=T,
##     expectation=c("fit"))
## })

test_that("kruskal Test on FLTable: R example: checking Result Equality without data.name:",{
    result = eval_expect_equal({
            fit <- kruskal.test(formula=Ozone ~ theMonth,data = mydata)
    },Renv,FLenv,
    verbose=T,
    expectation=c("fit"))
})
