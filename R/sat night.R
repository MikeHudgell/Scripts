

#
M <- as.table(rbind(c(762, 327, 468), c(484, 239, 477)))
dimnames(M) <- list(gender = c("M","F"),
                    party = c("Democrat","Independent", "Republican"))
(Xsq <- chisq.test(M))  # Prints test summary
Xsq$observed   # observed counts (same as M)
Xsq$expected   # expected counts under the null
Xsq$residuals  # Pearson residuals
Xsq$stdres     # standardized residuals

chisq.test(M)
#
M <- as.table(rbind(c(1247094, 1823560), c(1587970, 1851538)))
dimnames(M) <- list(Manufacturer = c("Man 07","Man 10"),
                    Year = c("2009","2010"))
(Xsq <- chisq.test(M))  # Prints test summary
Xsq$observed   # observed counts (same as M)
Xsq$expected   # expected counts under the null
Xsq$residuals  # Pearson residuals
Xsq$stdres     # standardized residuals

chisq.test(M)

M <- as.table(rbind(c(1247094), c(1587970)))
N <- as.table(rbind(c(1823560), c(1851538)))
dimnames(M) <- list(Manufacturer = c("Man 07","Man 10"),
                    Year = c("2009"))
dimnames(N) <- list(Manufacturer = c("Man 07","Man 10"),
                    Year = c("2010"))

chisq.test(M,N)


Pred <- as.table(rbind(c(1358490.56), c(1986449.335)))
Obs <- as.table(rbind(c(1587970), c(1851538)))
dimnames(Pred) <- list(Manufacturer = c("Man 07","Man 10"),
                    Year = c("Predicted"))
dimnames(Obs) <- list(Manufacturer = c("Man 07","Man 10"),
                    Year = c("Observed"))

chisq.test(Obs, Pred)
1587970
1851538


