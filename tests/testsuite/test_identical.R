test_that("check result for identical",
{
  M1 <- initF.FLMatrix(n=5,isSquare=TRUE)
  M2 <- FLMatrix(getTestTableName("tblmatrixMulti"),5,"Matrix_id","ROW_ID","COL_ID","CELL_VAL")
  M3 <- as.FLMatrix(as.matrix(M2))
  M3R <- as.matrix(M2)
  M2R <- as.matrix(M2)
  V1 <- as.FLVector(sample(1:100,10))
  V1R <- as.vector(V1)
  V2 <- as.FLVector(sample(1:100,10))
  V2R <- as.vector(V2)
  P1 <- initF.FLVector(n=10,isRowVec=TRUE)
  ##
  FLexpect_equal(identical(M1$FL,M2),identical(M1$R,M2R),check.attributes=FALSE)
  FLexpect_equal(identical(M1$FL,M1$FL),identical(M1$R,M1$R),check.attributes=FALSE)
  FLexpect_equal(identical(M2,M3),identical(M2R,M3R),check.attributes=FALSE) ## Fails in Hadoop
  FLexpect_equal(identical(V1,V1R),identical(V1R,V1R),check.attributes=FALSE)
  FLexpect_equal(identical(P1$FL,P1$FL),identical(P1$R,P1$R),check.attributes=FALSE)
  FLexpect_equal(identical(V1,P1$FL),identical(V1R,P1$R),check.attributes=FALSE)
  FLexpect_equal(identical(P1$FL,P1$FL),identical(P1$R,P1$R),check.attributes=FALSE)
  FLexpect_equal(identical(M1$FL,V2),identical(M1$R,V2R),check.attributes=FALSE)
  FLexpect_equal(identical(M1$FL,P1$FL),identical(M1$R,P1$R),check.attributes=FALSE)
  FLexpect_equal(identical(V1,V1),identical(V1R,V1R),check.attributes=FALSE)
  FLexpect_equal(identical(P1$FL,M2),identical(P1$R,M2R),check.attributes=FALSE)
})

