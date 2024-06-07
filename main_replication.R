library(haven) 
library(tidyverse)
library(fixest)


data_1 <- read_dta("Data for Replication.dta")



# Summary stats -----------------------------------------------------------

# htcode is hukou (county of birth)
data_1 <- data_1 %>%
  mutate(birthhome = if_else(htcode==county_code, 
                             1, 
                             0))
sum(data_1$birthhome - data_1$homecounty, na.rm = T)



# Table 2 ------------------------------------------------------

table2_1 <- feols(lexpen_agri ~ I(famineseverity*born4960) + eduyear + male + minor + term + I(eduyear*born4960) + I(male*born4960) + I(minor*born4960) + I(age*born4960) | county_code + birthyr + age + year + htcode,
                  data = data_1, 
                  fixef.rm = "singleton", 
                  cluster = "htcode")
summary(table2_1)

table2_2 <- feols(lexpen_agri ~ I(famineseverity*born4960) + eduyear + male + minor + term + I(eduyear*born4960) + I(male*born4960) + I(minor*born4960) + I(age*born4960) + I(lgdp1998*year) + I(lpopulation1998*year) + I(lexpenditure1998*year) + I(lrevenue1998*year) | county_code + birthyr + age + year + htcode,
                  data = data_1, 
                  fixef.rm = "singleton", 
                  cluster = "htcode")
summary(table2_2)

# drop edu because reducing sample size
table2_1_1 <- feols(lexpen_agri ~ I(famineseverity*born4960) + male + minor + term + I(male*born4960) + I(minor*born4960) + I(age*born4960) | county_code + birthyr + age + year + htcode,
                    data = data_1, 
                    fixef.rm = "singleton")

# diagnostics (dropped obs are significantly different, kills effect)
lm(famineseverity ~ is.na(eduyear), data=data_1) %>% summary()
lm(born4960 ~ is.na(eduyear), data=data_1) %>% summary()
lm(birthyr ~ is.na(eduyear), data=data_1) %>% summary()
lm(term ~ is.na(eduyear), data=data_1) %>% summary()
lm(lpopulation ~ is.na(eduyear), data=data_1) %>% summary()
lm(lgdp ~ is.na(eduyear), data=data_1) %>% summary()
lm(lrevenue_industry ~ is.na(eduyear), data=data_1) %>% summary()

table2_3 <- feols(lexpen_agri ~ I(famineseverity*born4954) + eduyear + male + minor + term + I(eduyear*born4954) + I(male*born4954) + I(minor*born4954) + I(age*born4954) | county_code + birthyr + age + year + htcode,
                  data = data_1, 
                  fixef.rm = "singleton", 
                  cluster = "htcode")
summary(table2_3)

table2_4 <- feols(lexpen_agri ~ I(famineseverity*born4954) + eduyear + male + minor + term + I(eduyear*born4954) + I(male*born4954) + I(minor*born4954) + I(age*born4954) + I(lgdp1998*year) + I(lpopulation1998*year) + I(lexpenditure1998*year) + I(lrevenue1998*year) | county_code + birthyr + age + year + htcode,
                  data = data_1, 
                  fixef.rm = "singleton", 
                  cluster = "htcode")
summary(table2_4)


# Table 3 -----------------------------------------------------------------



