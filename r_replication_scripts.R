# Load Packages --------------------------------------------------------------------

library(haven) 
library(tidyverse)
library(fixest)
library(tidyverse)
library(sf)

# Read Data --------------------------------------------------------------------

data_1 <- read.csv("Data for Replication.csv")
data_2 <- read.csv("Data/Data for replication_b.csv")
data_3 <- read.csv("Data/Data for replication_c.csv")

# Figure 1 ---------------------------------------------------------------------

data_3 |> 
  ggplot(aes(x = birthyr)) + 
  geom_histogram(binwidth = 1)

# Figure 2 ---------------------------------------------------------------------

data_2 |> 
  mutate(stage = case_when(birthyr %in% c(1956, 1957, 1958) ~ "pre",
                           birthyr %in% c(1959, 1960, 1961) ~ "famine",
                           birthyr %in% c(1962, 1963, 1964) ~ "post",
                           TRUE ~ "other")) |> 
  ggplot(aes(x = birthyr, y = csize, fill = stage)) + 
  geom_col()

# Figure 3 ---------------------------------------------------------------------

fig_3_shp <- st_read("Figure_3/FamineSeverity.shp")

ggplot(fig_3_shp) +
  geom_sf(aes(fill = shrinkrate)) + 
  scale_fill_gradient(low = "white", high = "black") #not exactly the same

# Table 1 ----------------------------------------------------------------------

data_1 |> 
  select(!county) |> 
  pivot_longer(cols = !c(county_code, cps)) |> 
  group_by(name) |> 
  filter(!is.na(value)) |> 
  summarise(mean = mean(value),
            obs = n())

# Table 2 ----------------------------------------------------------------------

table2_1 <- feols(lexpen_agri ~ I(famineseverity*born4960) + eduyear + male + 
                    minor + term + I(eduyear*born4960) + I(male*born4960) + 
                    I(minor*born4960) + I(age*born4960) | county_code + 
                    birthyr + age + year + htcode,
                  data = data_1, 
                  fixef.rm = "singleton", 
                  cluster = "htcode")
summary(table2_1)

table2_2 <- feols(lexpen_agri ~ I(famineseverity*born4960) + eduyear + male + 
                    minor + term + I(eduyear*born4960) + I(male*born4960) + 
                    I(minor*born4960) + I(age*born4960) + I(lgdp1998*year) + 
                    I(lpopulation1998*year) + I(lexpenditure1998*year) + 
                    I(lrevenue1998*year) | county_code + birthyr + age + year + 
                    htcode,
                  data = data_1, 
                  fixef.rm = "singleton", 
                  cluster = "htcode")
summary(table2_2)

# drop edu because reducing sample size
table2_1_1 <- feols(lexpen_agri ~ I(famineseverity*born4960) + male + minor + 
                      term + I(male*born4960) + I(minor*born4960) + 
                      I(age*born4960) | county_code + birthyr + age + year + 
                      htcode,
                    data = data_1, 
                    fixef.rm = "singleton")

table2_3 <- feols(lexpen_agri ~ I(famineseverity*born4954) + eduyear + male + 
                    minor + term + I(eduyear*born4954) + I(male*born4954) + 
                    I(minor*born4954) + I(age*born4954) | county_code + 
                    birthyr + age + year + htcode,
                  data = data_1, 
                  fixef.rm = "singleton", 
                  cluster = "htcode")
summary(table2_3)

table2_4 <- feols(lexpen_agri ~ I(famineseverity*born4954) + eduyear + male + 
                    minor + term + I(eduyear*born4954) + I(male*born4954) + 
                    I(minor*born4954) + I(age*born4954) + I(lgdp1998*year) + 
                    I(lpopulation1998*year) + I(lexpenditure1998*year) + 
                    I(lrevenue1998*year) | county_code + birthyr + age + year + 
                    htcode,
                  data = data_1, 
                  fixef.rm = "singleton", 
                  cluster = "htcode")
summary(table2_4)

# social security
table2_5 <- feols(lexpen_secu~ I(famineseverity*born4960) + eduyear + male + 
                    minor + term + I(eduyear*born4960) + I(male*born4960) + 
                    I(minor*born4960) + I(age*born4960) | county_code + birthyr 
                  + age + year + htcode,
                  data = data_1, 
                  fixef.rm = "singleton", 
                  cluster = "htcode")
summary(table2_5)

table2_6 <- feols(lexpen_secu ~ I(famineseverity*born4960) + eduyear + male + 
                    minor + term + I(eduyear*born4960) + I(male*born4960) + 
                    I(minor*born4960) + I(age*born4960) + I(lgdp1998*year) + 
                    I(lpopulation1998*year) + I(lexpenditure1998*year) + 
                    I(lrevenue1998*year) | county_code + birthyr + age + year + 
                    htcode,
                  data = data_1, 
                  fixef.rm = "singleton", 
                  cluster = "htcode")
summary(table2_6)

table2_7 <- feols(lexpen_secu ~ I(famineseverity*born4954) + eduyear + male + 
                    minor + term + I(eduyear*born4954) + I(male*born4954) + 
                    I(minor*born4954) + I(age*born4954) | county_code + 
                    birthyr + age + year + htcode,
                  data = data_1, 
                  fixef.rm = "singleton", 
                  cluster = "htcode")
summary(table2_3)

table2_8 <- feols(lexpen_secu ~ I(famineseverity*born4954) + eduyear + male + 
                    minor + term + I(eduyear*born4954) + I(male*born4954) + 
                    I(minor*born4954) + I(age*born4954) + I(lgdp1998*year) + 
                    I(lpopulation1998*year) + I(lexpenditure1998*year) + 
                    I(lrevenue1998*year) | county_code + birthyr + age + year + 
                    htcode,
                  data = data_1, 
                  fixef.rm = "singleton", 
                  cluster = "htcode")
summary(table2_4)


# Table 3 ----------------------------------------------------------------------

table3_1a <- feols(lexpen_agri ~ I(famineseverity*born4960) + eduyear + male + 
                     minor + term + I(eduyear*born4960) + I(male*born4960) + 
                     I(minor*born4960) + I(age*born4960) + I(lgdp1998*year) + 
                     I(lpopulation1998*year) + I(lexpenditure1998*year) + 
                     I(lrevenue1998*year) | county_code + birthyr + age + 
                     year + htcode,
                  data = data_1 %>% filter(countytype==2), 
                  fixef.rm = "singleton", 
                  cluster = "htcode")
summary(table3_1a)

table3_1b <- feols(lexpen_secu ~ I(famineseverity*born4960) + eduyear + male + 
                     minor + term + I(eduyear*born4960) + I(male*born4960) + 
                     I(minor*born4960) + I(age*born4960) + I(lgdp1998*year) + 
                     I(lpopulation1998*year) + I(lexpenditure1998*year) + 
                     I(lrevenue1998*year) | county_code + birthyr + age + 
                     year + htcode,
                  data = data_1 %>% filter(countytype==2), 
                  fixef.rm = "singleton", 
                  cluster = "htcode")
summary(table3_1b)

table3_2a <- feols(lexpen_agri ~ I(famineseverity*born4960) + eduyear + male + 
                     minor + term + I(eduyear*born4960) + I(male*born4960) + 
                     I(minor*born4960) + I(age*born4960) + I(lgdp1998*year) + 
                     I(lpopulation1998*year) + I(lexpenditure1998*year) + 
                     I(lrevenue1998*year) | county_code + birthyr + age + 
                     year + htcode,
                   data = data_1 %>% filter(urbanborn == 0), 
                   fixef.rm = "singleton", 
                   cluster = "htcode")
summary(table3_2a)

table3_2b <- feols(lexpen_secu ~ I(famineseverity*born4960) + eduyear + male + 
                     minor + term + I(eduyear*born4960) + I(male*born4960) + 
                     I(minor*born4960) + I(age*born4960) + I(lgdp1998*year) + 
                     I(lpopulation1998*year) + I(lexpenditure1998*year) + 
                     I(lrevenue1998*year) | county_code + birthyr + age + 
                     year + htcode,
                   data = data_1 %>% filter(urbanborn == 0), 
                   fixef.rm = "singleton", 
                   cluster = "htcode")
summary(table3_2b)

table3_3a <- feols(lexpen_agri ~ I(famineseverity*born4960) + eduyear + male + 
                     minor + term + I(eduyear*born4960) + I(male*born4960) + 
                     I(minor*born4960) + I(age*born4960) + I(lgdp1998*year) + 
                     I(lpopulation1998*year) + I(lexpenditure1998*year) + 
                     I(lrevenue1998*year) | county_code + birthyr + age + 
                     year + htcode,
                   data = data_1 %>% filter(numberworkcounties == 1), 
                   fixef.rm = "singleton", 
                   cluster = "htcode")
summary(table3_3a)

table3_3b <- feols(lexpen_secu ~ I(famineseverity*born4960) + eduyear + male + 
                     minor + term + I(eduyear*born4960) + I(male*born4960) + 
                     I(minor*born4960) + I(age*born4960) + I(lgdp1998*year) + 
                     I(lpopulation1998*year) + I(lexpenditure1998*year) + 
                     I(lrevenue1998*year) | county_code + birthyr + age + 
                     year + htcode,
                   data = data_1 %>% filter(numberworkcounties == 1), 
                   fixef.rm = "singleton", 
                   cluster = "htcode")
summary(table3_3b)

table3_4a <- feols(lexpen_agri ~ I(famineseverity*born4960) + eduyear + male + 
                     minor + term + I(eduyear*born4960) + I(male*born4960) + 
                     I(minor*born4960) + I(age*born4960) + I(lgdp1998*year) + 
                     I(lpopulation1998*year) + I(lexpenditure1998*year) + 
                     I(lrevenue1998*year) | county_code + birthyr + age + 
                     year + htcode,
                   data = data_1 %>% filter(maxterm <= 4), 
                   fixef.rm = "singleton", 
                   cluster = "htcode")
summary(table3_4a)

table3_4b <- feols(lexpen_secu ~ I(famineseverity*born4960) + eduyear + male + 
                     minor + term + I(eduyear*born4960) + I(male*born4960) + 
                     I(minor*born4960) + I(age*born4960) + I(lgdp1998*year) + 
                     I(lpopulation1998*year) + I(lexpenditure1998*year) + 
                     I(lrevenue1998*year) | county_code + birthyr + age + 
                     year + htcode,
                   data = data_1 %>% filter(maxterm <= 4), 
                   fixef.rm = "singleton", 
                   cluster = "htcode")
summary(table3_4b)
