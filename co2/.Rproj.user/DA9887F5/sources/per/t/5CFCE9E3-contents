# # ————————————————分隔年计算分解————————————————————————————
# raw_data <- read.csv("04_table2_quantitative indicators.csv")
# year_data <- raw_data[["year"]]
# co2_data <- raw_data[["co2"]]
# gdp_data <- raw_data[["gdp"]]
# energy_data <- raw_data[["energy"]]
# population_data <- raw_data[["population"]]
# investment_data <- raw_data[["investment"]]
# 
# co2_results <- array(1:4, dim=c(4))
# co2_results <- 0
# gdp_results <- array(1:4, dim=c(4))
# gdp_results <- 0
# energy_results <- array(1:4, dim=c(4))
# energy_results <- 0
# population_results <- array(1:4, dim=c(4))
# population_results <- 0
# investment_results <- array(1:4, dim=c(4))
# investment_results <- 0
# 
# co2_gdp_results <- array(1:4, dim=c(4))
# co2_gdp_results <- 0
# co2_energy_results <- array(1:4, dim=c(4))
# co2_energy_results <- 0
# co2_population_results <- array(1:4, dim=c(4))
# co2_population_results <- 0
# co2_investment_results <- array(1:4, dim=c(4))
# co2_investment_results <- 0
# 
# gdp_population_results <- array(1:4, dim=c(4))
# gdp_population_results <- 0
# energy_gdp_results <- array(1:4, dim=c(4))
# energy_gdp_results <- 0
# 
# for (index in (1:4)) {
#   if (index <= 3) {
#     yearB <- year_data[5*index-4] # Base year
#     year <- year_data[5*index+1] # Year of calculations
#     C0 <- co2_data[5*index-4] # CO2 emissions, base year
#     C1 <- co2_data[5*index+1] # CO2 emissions, calculations' year
#     G0 <- gdp_data[5*index-4] # GDP, base year
#     G1 <- gdp_data[5*index+1] # GDP, calculations' year
#     E0 <- energy_data[5*index-4] # Energy, base year
#     E1 <- energy_data[5*index+1] # Energy, calculations' year
#     P0 <- population_data[5*index-4] # population, base year
#     P1 <- population_data[5*index+1] # population, calculations' year
#     I0 <- investment_data[5*index-4] # population, base year
#     I1 <- investment_data[5*index+1] # population, calculations' year
#   } else {
#     yearB <- year_data[5*index-4] # Base year
#     year <- year_data[5*index] # Year of calculations
#     C0 <- co2_data[5*index-4] # CO2 emissions, base year
#     C1 <- co2_data[5*index] # CO2 emissions, calculations' year
#     G0 <- gdp_data[5*index-4] # GDP, base year
#     G1 <- gdp_data[5*index] # GDP, calculations' year
#     E0 <- energy_data[5*index-4] # Energy, base year
#     E1 <- energy_data[5*index] # Energy, calculations' year
#     P0 <- population_data[5*index-4] # population, base year
#     P1 <- population_data[5*index] # population, calculations' year
#     I0 <- investment_data[5*index-4] # population, base year
#     I1 <- investment_data[5*index] # population, calculations' year
#   }
#   
#   eps <- 10^-7 # preciseness of integration
#   # --------- Data in terms of the base year --------------------------------
#   z1 <- C1/C0 # CO2 emissions in terms of the base year
#   x1 <- G1/G0 # GDP in terms of the base year
#   x3 <- E1/E0 # Energy in terms of the base year
#   x5 <- P1/P0 # population in terms of the base year
#   x7 <- I1/I0 # investment in terms of the base year
#   # ----- Relative indicators in terms of the base year ----------------------
#   x2 <- z1/x1 # CO2/GDP
#   x4 <- z1/x3 # CO2/Energy
#   x6 <- z1/x5 # CO2/population
#   x8 <- z1/x7 # CO2/investment
#   x9 <- x1/x5 #GDP/population
#   x10 <- x3/x1 #Energy/GDP
#   # --------------------------------------------------------------------------------
#   # - GDIM algorithm. Exponential dynamics assumed. In terms of base year -
#   zf <- function(t)(C1/C0)^t #CO2
#   x1f <- function(t) (G1/G0)^t #GDP
#   x3f <- function(t) (E1/E0)^t #Energy
#   x5f <- function(t) (P1/P0)^t #population
#   x7f <- function(t) (I1/I0)^t #investment
# 
#   x2f <- function(t) zf(t)/x1f(t) #CO2/GDP
#   x4f <- function(t) zf(t)/x3f(t) #CO2/Energy
#   x6f <- function(t) zf(t)/x5f(t) #CO2/population
#   x8f <- function(t) zf(t)/x7f(t) #CO2/investment
#   x9f <- function(t) x1f(t)/x5f(t) #GDP/population
#   x10f <- function(t) x3f(t)/x1f(t) #Energy/GDP
#   # ---- Projection operator ---------------------------------------------------
#   Bij <- function(t,i1,j1){
#     IdM <- array(1:100, dim=c(10,10)) # Identity matrix
#     IdM[] <- 0
#     for (ii in 1:10) {IdM[ii,ii] <-1}
#     PhiX <- array(1:50, dim=c(10,5)) # Jacobian matrix
#     PhiX[] <- 0
#     PhiX[1,1] <- x2f(t)
#     PhiX[2,1] <- x1f(t)
#     PhiX[3,1] <- -x4f(t)
#     PhiX[4,1] <- -x3f(t)
#     PhiX[1,2] <- x2f(t)
#     PhiX[2,2] <- x1f(t)
#     PhiX[5,2] <- -x6f(t)
#     PhiX[6,2] <- -x5f(t)
#     PhiX[1,3] <- x2f(t)
#     PhiX[2,3] <- x1f(t)
#     PhiX[7,3] <- -x8f(t)
#     PhiX[8,3] <- -x7f(t)
#     PhiX[1,4] <- 1
#     PhiX[5,4] <- -x9f(t)
#     PhiX[9,4] <- -x5f(t)
#     PhiX[1,5] <- -x10f(t)
#     PhiX[3,5] <- 1
#     PhiX[10,5] <- -x1f(t)
#     PhiXT <- t(PhiX) # PhiX transposed
#     Prod_PT_Px <- array(1:20, dim=c(5,5))
#     Prod_PT_Px[] <- 0
#     Prod_PT_Px <- PhiXT %*% PhiX # Product of Phi_X_T*Phi_X
#     PT_P_1 <- solve(Prod_PT_Px) # Inverse of the Phi_X_T*Phi_X
#     # ------------------------------------------------------------------------------
#     B <- array(1:100, dim=c(10,10))
#     B[] <- 0
#     B <- IdM - PhiX %*% PT_P_1 %*% PhiXT
#     return(B[i1,j1])}
#   Dz_vect <- array(1:10, dim=c(10))
#   Dz_vect[] <- 0
#   for (i_ind in (1:10)) {
#     if (i_ind == 1)
#       try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x1f(t)*log(x1)
#     else
#       if (i_ind == 2)
#         try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x2f(t)*log(x2)
#       else
#         if (i_ind == 3)
#           try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x3f(t)*log(x3)
#         else
#           if (i_ind == 4)
#             try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x4f(t)*log(x4)
#           else
#             if (i_ind == 5)
#               try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x5f(t)*log(x5)
#             else
#               if (i_ind == 6)
#                 try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x6f(t)*log(x6)
#               else
#                 if (i_ind == 7)
#                   try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x7f(t)*log(x7)
#                 else
#                   if (i_ind == 8)
#                     try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x8f(t)*log(x8)
#                   else
#                     if (i_ind == 9)
#                       try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x9f(t)*log(x9)
#                     else
#                       if (i_ind == 10)
#                         try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x10f(t)*log(x10)
#                   else {print("Error in the number of factors");stop}
#                   # ------------ Numerical integration using the Simpson's method ------------
#                   a <- 0 # initial point
#                   b <- 1 # endpoint
#                   n <- 2 # to begin iterations
#                   y0 <- try(a)
#                   yn <- try(b)
#                   ymid <- try((a+b)/2)
#                   del_x <- (b-a)/n
#                   k <- del_x/3
#                   Int_0 <- k*(y0+4*ymid + yn)
#                   err <- eps+1 # Initializing the error to start
#                   Int_n <- Int_0
#                   IntSimp <- Int_0
#                   while (err > eps){
#                     n <- 2*n
#                     del_x <- (b-a)/n
#                     k <- del_x/3
#                     Int_2n <- 0
#                     for (ni in (1:n-1)){Int_2n <- Int_2n + try(a + ni*del_x)*(2+(1+(-1)^(ni+1)))}
#                     Int_2n <- k*(Int_2n + y0 + yn)
#                     err <- abs(Int_2n - Int_n)/15
#                     if (err < eps) {IntSimp <- Int_2n; break}
#                     else {Int_n <- Int_2n}}
#                   Dz_vect[i_ind] <- IntSimp
#   } # end of the loop by indicators
# 
#   # gdp_results[index] <- x1
#   # energy_results[index] <- x3
#   # population_results[index] <- x5
#   # co2_gdp_results[index] <- x2
#   # co2_energy_results[index] <- x4
#   # co2_population_results[index] <- x6
#   # gdp_population_results[index] <- x7
#   # energy_gdp_results[index] <- x8
# 
#   # gdp_results[index] <- Dz_vect[1]
#   # energy_results[index] <- Dz_vect[2]
#   # population_results[index] <- Dz_vect[3]
#   # co2_gdp_results[index] <- Dz_vect[4]
#   # co2_energy_results[index] <- Dz_vect[5]
#   # co2_population_results[index] <- Dz_vect[6]
#   # gdp_population_results[index] <- Dz_vect[7]
#   # energy_gdp_results[index] <- Dz_vect[8]
# 
#   gdp_results[index] <- Dz_vect[1]*co2_data[5*index-4]
#   energy_results[index] <- Dz_vect[2]*co2_data[5*index-4]
#   population_results[index] <- Dz_vect[3]*co2_data[5*index-4]
#   investment_results[index] <- Dz_vect[4]*co2_data[5*index-4]
# 
#   co2_gdp_results[index] <- Dz_vect[5]*co2_data[5*index-4]
#   co2_energy_results[index] <- Dz_vect[6]*co2_data[5*index-4]
#   co2_population_results[index] <- Dz_vect[7]*co2_data[5*index-4]
#   co2_investment_results[index] <- Dz_vect[8]*co2_data[5*index-4]
# 
#   gdp_population_results[index] <- Dz_vect[9]*co2_data[5*index-4]
#   energy_gdp_results[index] <- Dz_vect[10]*co2_data[5*index-4]
# 
#   sum_fact <- 0; for (i_sum in 1:10) sum_fact <- sum_fact + Dz_vect[i_sum]
# 
#   # co2_results[index] <- sum_fact
#   co2_results[index] <- sum_fact*co2_data[5*index-4]
#   print(index)
# }

# result <-data.frame(
#   "year"=c(2000,2005,2010,2015),
#   "co2_change"=co2_results,
#   "GDP"=gdp_results,
#   "Energy"=energy_results,
#   "population"=population_results,
#   "investment"=investment_results,
#   "co2_gdp"=co2_gdp_results,
#   "co2_energy"=co2_energy_results,
#   "co2_population"=co2_population_results,
#   "co2_investment"=co2_investment_results,
#   "gdp_population"=gdp_population_results,
#   "energy_gdp"=energy_gdp_results
# )
# write.csv(result, "totall_gap_amount_result2.csv")

————————————————逐年计算分解————————————————————————————
raw_data <- read.csv("04_table2_quantitative indicators.csv")
year_data <- raw_data[["year"]]
co2_data <- raw_data[["co2"]]
gdp_data <- raw_data[["gdp"]]
energy_data <- raw_data[["energy"]]
population_data <- raw_data[["population"]]
investment_data <- raw_data[["investment"]]

co2_results <- array(1:19, dim=c(19))
co2_results <- 0
gdp_results <- array(1:19, dim=c(19))
gdp_results <- 0
energy_results <- array(1:19, dim=c(19))
energy_results <- 0
population_results <- array(1:19, dim=c(19))
population_results <- 0
investment_results <- array(1:19, dim=c(19))
investment_results <- 0

co2_gdp_results <- array(1:19, dim=c(19))
co2_gdp_results <- 0
co2_energy_results <- array(1:19, dim=c(19))
co2_energy_results <- 0
co2_population_results <- array(1:19, dim=c(19))
co2_population_results <- 0
co2_investment_results <- array(1:19, dim=c(19))
co2_investment_results <- 0

gdp_population_results <- array(1:19, dim=c(19))
gdp_population_results <- 0
energy_gdp_results <- array(1:19, dim=c(19))
energy_gdp_results <- 0

for (index in (1:19)) {
  yearB <- year_data[index] # Base year
  year <- year_data[index+1] # Year of calculations
  C0 <- co2_data[index] # CO2 emissions, base year
  C1 <- co2_data[index+1] # CO2 emissions, calculations' year
  G0 <- gdp_data[index] # GDP, base year
  G1 <- gdp_data[index+1] # GDP, calculations' year
  E0 <- energy_data[index] # Energy, base year
  E1 <- energy_data[index+1] # Energy, calculations' year
  P0 <- population_data[index] # population, base year
  P1 <- population_data[index+1] # population, calculations' year
  I0 <- investment_data[index] # population, base year
  I1 <- investment_data[index+1] # population, calculations' year
  eps <- 10^-7 # preciseness of integration
  # --------- Data in terms of the base year --------------------------------
  z1 <- C1/C0 # CO2 emissions in terms of the base year
  x1 <- G1/G0 # GDP in terms of the base year
  x3 <- E1/E0 # Energy in terms of the base year
  x5 <- P1/P0 # population in terms of the base year
  x7 <- I1/I0 # investment in terms of the base year
  # ----- Relative indicators in terms of the base year ----------------------
  x2 <- z1/x1 # CO2/GDP
  x4 <- z1/x3 # CO2/Energy
  x6 <- z1/x5 # CO2/population
  x8 <- z1/x7 # CO2/investment
  x9 <- x1/x5 #GDP/population
  x10 <- x3/x1 #Energy/GDP
  # --------------------------------------------------------------------------------
  # - GDIM algorithm. Exponential dynamics assumed. In terms of base year -
  zf <- function(t)(C1/C0)^t #CO2
  x1f <- function(t) (G1/G0)^t #GDP
  x3f <- function(t) (E1/E0)^t #Energy
  x5f <- function(t) (P1/P0)^t #population
  x7f <- function(t) (I1/I0)^t #investment

  x2f <- function(t) zf(t)/x1f(t) #CO2/GDP
  x4f <- function(t) zf(t)/x3f(t) #CO2/Energy
  x6f <- function(t) zf(t)/x5f(t) #CO2/population
  x8f <- function(t) zf(t)/x7f(t) #CO2/investment
  x9f <- function(t) x1f(t)/x5f(t) #GDP/population
  x10f <- function(t) x3f(t)/x1f(t) #Energy/GDP
  # ---- Projection operator ---------------------------------------------------
  Bij <- function(t,i1,j1){
    IdM <- array(1:100, dim=c(10,10)) # Identity matrix
    IdM[] <- 0
    for (ii in 1:10) {IdM[ii,ii] <-1}
    PhiX <- array(1:50, dim=c(10,5)) # Jacobian matrix
    PhiX[] <- 0
    PhiX[1,1] <- x2f(t)
    PhiX[2,1] <- x1f(t)
    PhiX[3,1] <- -x4f(t)
    PhiX[4,1] <- -x3f(t)
    PhiX[1,2] <- x2f(t)
    PhiX[2,2] <- x1f(t)
    PhiX[5,2] <- -x6f(t)
    PhiX[6,2] <- -x5f(t)
    PhiX[1,3] <- x2f(t)
    PhiX[2,3] <- x1f(t)
    PhiX[7,3] <- -x8f(t)
    PhiX[8,3] <- -x7f(t)
    PhiX[1,4] <- 1
    PhiX[5,4] <- -x9f(t)
    PhiX[9,4] <- -x5f(t)
    PhiX[1,5] <- -x10f(t)
    PhiX[3,5] <- 1
    PhiX[10,5] <- -x1f(t)
    PhiXT <- t(PhiX) # PhiX transposed
    Prod_PT_Px <- array(1:20, dim=c(5,5))
    Prod_PT_Px[] <- 0
    Prod_PT_Px <- PhiXT %*% PhiX # Product of Phi_X_T*Phi_X
    PT_P_1 <- solve(Prod_PT_Px) # Inverse of the Phi_X_T*Phi_X
    # ------------------------------------------------------------------------------
    B <- array(1:100, dim=c(10,10))
    B[] <- 0
    B <- IdM - PhiX %*% PT_P_1 %*% PhiXT
    return(B[i1,j1])}
  Dz_vect <- array(1:10, dim=c(10))
  Dz_vect[] <- 0
  for (i_ind in (1:10)) {
    if (i_ind == 1)
      try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x1f(t)*log(x1)
    else
      if (i_ind == 2)
        try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x2f(t)*log(x2)
      else
        if (i_ind == 3)
          try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x3f(t)*log(x3)
        else
          if (i_ind == 4)
            try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x4f(t)*log(x4)
          else
            if (i_ind == 5)
              try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x5f(t)*log(x5)
            else
              if (i_ind == 6)
                try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x6f(t)*log(x6)
              else
                if (i_ind == 7)
                  try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x7f(t)*log(x7)
                else
                  if (i_ind == 8)
                    try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x8f(t)*log(x8)
                  else
                    if (i_ind == 9)
                      try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x9f(t)*log(x9)
                    else
                      if (i_ind == 10)
                        try <- function(t) (x1f(t)*Bij(t,2,i_ind)+x2f(t)*Bij(t,1,i_ind))*x10f(t)*log(x10)
                      else {print("Error in the number of factors");stop}
                      # ------------ Numerical integration using the Simpson's method ------------
                      a <- 0 # initial point
                      b <- 1 # endpoint
                      n <- 2 # to begin iterations
                      y0 <- try(a)
                      yn <- try(b)
                      ymid <- try((a+b)/2)
                      del_x <- (b-a)/n
                      k <- del_x/3
                      Int_0 <- k*(y0+4*ymid + yn)
                      err <- eps+1 # Initializing the error to start
                      Int_n <- Int_0
                      IntSimp <- Int_0
                      while (err > eps){
                        n <- 2*n
                        del_x <- (b-a)/n
                        k <- del_x/3
                        Int_2n <- 0
                        for (ni in (1:n-1)){Int_2n <- Int_2n + try(a + ni*del_x)*(2+(1+(-1)^(ni+1)))}
                        Int_2n <- k*(Int_2n + y0 + yn)
                        err <- abs(Int_2n - Int_n)/15
                        if (err < eps) {IntSimp <- Int_2n; break}
                        else {Int_n <- Int_2n}}
                      Dz_vect[i_ind] <- IntSimp
  } # end of the loop by indicators

  # gdp_results[index] <- x1
  # energy_results[index] <- x3
  # population_results[index] <- x5
  # investment_results[index] <- Dz_vect[4]*co2_data[index]
  # 
  # 
  # co2_gdp_results[index] <- x2
  # co2_energy_results[index] <- x4
  # co2_population_results[index] <- x6
  # gdp_population_results[index] <- x7
  # energy_gdp_results[index] <- x8

  # gdp_results[index] <- Dz_vect[1]
  # energy_results[index] <- Dz_vect[2]
  # population_results[index] <- Dz_vect[3]
  # co2_gdp_results[index] <- Dz_vect[4]
  # co2_energy_results[index] <- Dz_vect[5]
  # co2_population_results[index] <- Dz_vect[6]
  # gdp_population_results[index] <- Dz_vect[7]
  # energy_gdp_results[index] <- Dz_vect[8]

  # gdp_results[index] <- Dz_vect[1]*co2_data[index]
  # energy_results[index] <- Dz_vect[2]*co2_data[index]
  # population_results[index] <- Dz_vect[3]*co2_data[index]
  # investment_results[index] <- Dz_vect[4]*co2_data[index]
  # 
  # co2_gdp_results[index] <- Dz_vect[5]*co2_data[index]
  # co2_energy_results[index] <- Dz_vect[6]*co2_data[index]
  # co2_population_results[index] <- Dz_vect[7]*co2_data[index]
  # co2_investment_results[index] <- Dz_vect[8]*co2_data[index]
  # 
  # gdp_population_results[index] <- Dz_vect[9]*co2_data[index]
  # energy_gdp_results[index] <- Dz_vect[10]*co2_data[index]

  sum_fact <- 0; for (i_sum in 1:10) sum_fact <- sum_fact + Dz_vect[i_sum]

  # co2_results[index] <- sum_fact
  co2_results[index] <- sum_fact*co2_data[index]
  print(index)
}

result <-data.frame(
  "year"=year_data[2:20],
  "co2_change"=co2_results,
  "GDP"=gdp_results,
  "Energy"=energy_results,
  "population"=population_results,
  "investment"=investment_results,
  "co2_gdp"=co2_gdp_results,
  "co2_energy"=co2_energy_results,
  "co2_population"=co2_population_results,
  "co2_investment"=co2_investment_results,
  "gdp_population"=gdp_population_results,
  "energy_gdp"=energy_gdp_results
)
write.csv(result, "totall_amount_result.csv")