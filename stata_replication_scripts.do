
*** Note that the path should be manually set to where the downloaded data files are stored. Figures and tables will be saved in the Results folder.

use "C:\Box\ReplicationGame\Replication\CodeCheck\Data for Replication.dta", clear
cd "C:\Box\ReplicationGame\Replication\CodeCheck\Results"


*** Install packages ***

ssc install logout
ssc install reghdfe
ssc install outreg2
ssc install coefplot
* The package for ols_spatial_HAC can be downloaded at https://www.dropbox.com/s/pf2vtvgqhjk7rc8/spatial_HAC.zip?dl=0 and should be stored in the stata ado file folders.




*************************
*** Table 2 with variations to included observations***


*TABLE 2  Without Eduyear controls and increased sample by observations with missing eduyear variable

*column 1 except eduyear is dropped as control and sample includes missing eduyear observations. Smaller magnitude but statistically significant effect.
reghdfe lexpen_agri c.famineseverity#c.born4960 male minor term c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2rep, tex replace dec(2) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')


*column 2 except eduyear is dropped as control and sample includes missing eduyear observations. Smaller magnitude but statistically significant effect.
reghdfe lexpen_agri c.famineseverity#c.born4960 male minor term  c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2rep, tex append dec(2) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')


*column 3 except eduyear is dropped as control and sample includes missing eduyear observations. Smaller magnitude but staistically significant effect of 55to60 birth year cohort. 
reghdfe lexpen_agri c.famineseverity#c.born4954 c.famineseverity#c.born5560  male minor term  c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2rep, tex append dec(2) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')

*column 4 except eduyear is dropped as control and sample includes missing eduyear observations. Smaller magnitude but staistically significant effect of 55to60 birth year cohort. 
reghdfe lexpen_agri c.famineseverity#c.born4954 c.famineseverity#c.born5560  male minor term  c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2rep, tex append dec(2) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')

*column 5 except eduyear is dropped as control and sample includes missing eduyear observations. Substantially smaller coefficient and statistical insignifance. 
reghdfe lexpen_secu c.famineseverity#c.born4960  male minor term  c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960  , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2rep, tex append dec(2) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')


*Column 6 except eduyear is dropped as control and sample includes missing eduyear observations. Substantially smaller coefficient and statistical insignifance. 
reghdfe lexpen_secu c.famineseverity#c.born4960  male minor term  c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2rep, tex append dec(2) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')

*column 7 except eduyear is dropped as control and sample includes missing eduyear observations. Substantially smaller coefficient for 55-60 birth cohort but statistically still significant
reghdfe lexpen_secu  c.famineseverity#c.born4954 c.famineseverity#c.born5560 male minor term  c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960  , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2rep, tex append dec(2) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')

*column 8 except eduyear is dropped as control and sample includes missing eduyear observations. Substantially smaller coefficient and statistically insignificant
reghdfe lexpen_secu  c.famineseverity#c.born4954 c.famineseverity#c.born5560 male minor term  c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2rep, tex append dec(2) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')






*Table 2 columns 5 to 8 with sample restricted to observations that have agricultural expenditure available

*column5:  Smaller sample of countries with agricultural expenditure only: effect is smaller and statistically not significant:    Difference in effect coefficient magnitude and significance indicates that observations where agricultural expenditure is not available drive substantial part of the baseline effect on social scurity expenditure 
reghdfe lexpen_secu c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960  if lexpen_agri !=. , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2sample, tex replace dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')


*column6:  Smaller sample of countries with agricultural expenditure only: effect is smaller and statistically not significant: 
reghdfe lexpen_secu c.famineseverity#c.born4960  eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year  if lexpen_agri !=., absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2sample, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')


*column7:  Smaller sample of countries with agricultural expenditure only: 49 to 54 birth cohort effect is negative , sizeable and statistically significant, 55 to 60 cohort is slightly smaller and statistically significant   
reghdfe lexpen_secu c.famineseverity#c.born4954 c.famineseverity#c.born5560 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960  if lexpen_agri !=. , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2sample, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')


*column8:  Smaller sample of countries with agricultural expenditure only: 49 to 54 birth cohort effect is   negative , sizeable and statistically weakly significant, 55 to 60 cohort is slightly smaller and statistically not significant   

reghdfe lexpen_secu c.famineseverity#c.born4954 c.famineseverity#c.born5560 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if lexpen_agri !=. , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2sample, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')

 



**************************************************
***Coding error 

*TABLE C5

* cols 7-8
* change direction of different prefecture. Coefficient actually positive and significant
replace htcodecity = int(htcode/100)*100
replace city_code = int(county_code/100)*100
replace diffcity = 1
replace diffcity = 0 if htcodecity == city_code  

reghdfe lexpen_agri diffcity c.famineseverity#c.born4960#c.diffcity c.famineseverity#c.diffcity c.born4960#c.diffcity c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
lincom _b[c.famineseverity#c.born4960#c.diffcity] + _b[c.famineseverity#c.born4960]
outreg2 using table_c5rep, tex replace dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.diffcity) addstat(Within R-squared, `e(r2_within)') 

reghdfe lexpen_secu diffcity c.famineseverity#c.born4960#c.diffcity c.famineseverity#c.diffcity c.born4960#c.diffcity c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
lincom _b[c.famineseverity#c.born4960#c.diffcity] + _b[c.famineseverity#c.born4960]
outreg2 using table_c5rep, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.diffcity) addstat(Within R-squared, `e(r2_within)') 

***********************
************************



*************************************
******Specifications used to explore the issue surrounding observations included in the estimation samples

*check if taking out eduyear control has noticeable effect on the base specification


reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear c.eduyear#c.born4960 male minor term c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_comp, tex replace dec(2) keep(c.famineseverity#c.born4960 eduyear c.eduyear#c.born4960) 

reghdfe lexpen_agri c.famineseverity#c.born4960 male minor term c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 if eduyear !=., absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_comp, tex append dec(2) keep(c.famineseverity#c.born4960 eduyear c.eduyear#c.born4960 )



reghdfe lexpen_secu c.famineseverity#c.born4960 eduyear c.eduyear#c.born4960 male minor term c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_comp, tex append dec(2) keep(c.famineseverity#c.born4960 eduyear c.eduyear#c.born4960) 

reghdfe lexpen_secu c.famineseverity#c.born4960 male minor term c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 if eduyear !=., absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_comp, tex append dec(2) keep(c.famineseverity#c.born4960 eduyear c.eduyear#c.born4960 )
***********************



*Attempts to explore data with filtering based on agricultural outcome values



reghdfe lexpen_agri c.famineseverity#c.born4960 male minor term  c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if lexpen_agri >15.5 & lexpen_agri < 19.1 , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)


reghdfe lexpen_agri c.famineseverity#c.born4960 male minor term  c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if lexpen_agri >16.4 & lexpen_agri < 18.2 , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)


reghdfe lexpen_agri c.famineseverity#c.born4960 male minor term  c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if lexpen_agri >16.4 & lexpen_agri < 18.2 , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)




***********************

*attempts to explore the data, including using only subsets of controls


* coefficients

*run col1  without individual secretary controls with reduced sample
reghdfe lexpen_agri c.famineseverity#c.born4960 if eduyear !=., absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)

reghdfe lexpen_secu c.famineseverity#c.born4960 if eduyear !=. & lexpen_agri !=., absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)

reghdfe lexpen_secu c.famineseverity#c.born4960 if lexpen_agri !=. , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)

*run col1  without individual secretary controls with larger sample
reghdfe lexpen_agri c.famineseverity#c.born4960 , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)


*conrols except eduyear with larger sample
reghdfe lexpen_agri c.famineseverity#c.born4960 male minor term c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
*controls except eduyear with smaller sample (eduyear is NA)
reghdfe lexpen_agri c.famineseverity#c.born4960 male minor term c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 if eduyear !=., absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
*those with term but eduyear is NA
reghdfe lexpen_agri c.famineseverity#c.born4960 male minor term c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 if term !=. & eduyear ==., absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
*sample too small, effect disappears due to collinearity

*difference in effect coefficient indicates that observations without education recorded have a lower effect of famineseverity on agricultural expenditure




 reghdfe lexpen_secu c.famineseverity#c.born4960  male minor term c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if eduyear !=. , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
 *original sample (everyone with a education recorded dropped) shows positive significant effect even if eduyear as control is dropped. 

 
*male no noticeable impact
reghdfe lexpen_agri c.famineseverity#c.born4960 male  c.male#c.born4960 , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)

*minority no noticeable impact
reghdfe lexpen_agri c.famineseverity#c.born4960 minor  c.minor#c.born4960 , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)

*term length noticeably increase impact
reghdfe lexpen_agri c.famineseverity#c.born4960 term  c.term#c.born4960 , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)

*education length noticeably increase impact
reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear  c.eduyear#c.born4960 , absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)

