
*** Note that the path should be manually set to where the downloaded data files are stored. Figures and tables will be saved in the Results folder.

use "C:\Box\ReplicationGame\Replication\Robustness Replication\Data for Replication.dta", clear
cd "C:\Box\ReplicationGame\Replication\Robustness Replication\Results"


*** Install packages ***

ssc install logout
ssc install reghdfe
ssc install outreg2
ssc install coefplot
* The package for ols_spatial_HAC can be downloaded at https://www.dropbox.com/s/pf2vtvgqhjk7rc8/spatial_HAC.zip?dl=0 and should be stored in the stata ado file folders.


*** Figure 1 ***

preserve
sort cps
drop if cps == cps[_n-1]
bysort birthyr: egen ncps = count(cps)
sort birthyr
drop if birthyr == birthyr[_n-1]
graph twoway bar ncps birthyr, xtitle("Year of birth") ytitle("Number of CPS")
graph export "figure_1.png", as(png) name("Graph")
restore


*** Table 1 ***

logout, save(table_1) tex replace: tabstat male age eduyear minor maxterm famineseverity born4960 born5560 lexpen_agri lexpen_secu lrevenue_agri lgrain lgdp1998 lpopulation1998 lexpenditure1998 lrevenue1998, stats(mean sd min max N) c(s) f(%10.2f)


*** Table 2 ***

* coefficients
reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
gen samplea1 = e(sample)

outreg2 using table_2, tex replace dec(2) stats(coef pval) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')

reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
gen samplea2 = e(sample)

outreg2 using table_2, tex append dec(2) stats(coef pval) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')

reghdfe lexpen_agri c.famineseverity#c.born4954 c.famineseverity#c.born5560 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2, tex append dec(2) stats(coef pval) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')

reghdfe lexpen_agri c.famineseverity#c.born4954 c.famineseverity#c.born5560 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2, tex append dec(2) stats(coef pval) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
gen samples1 = e(sample)
outreg2 using table_2, tex append dec(2) stats(coef pval) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
gen samples2 = e(sample)
outreg2 using table_2, tex append dec(2) stats(coef pval) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4954 c.famineseverity#c.born5560 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2, tex append dec(2) stats(coef pval) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4954 c.famineseverity#c.born5560 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_2, tex append dec(2) stats(coef pval) sortvar(c.famineseverity#c.born4960 c.famineseverity#c.born4954 c.famineseverity#c.born5560) addstat(Number of work counties, `e(N_clust)', Adjusted R-squared, `e(r2_a)', Within R-squared, `e(r2_within)')

* means of y
sum lexpen_agri if samplea1 == 1
sum lexpen_agri if samplea2 == 1
sum lexpen_secu if samples1 == 1
sum lexpen_secu if samples2 == 1


*** Table 3 ***

* col 1: normal work counties

preserve 
keep if countytype == 2

reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_3_panel_a, tex replace dec(2) keep(c.famineseverity#c.born4960) addstat(Number of work counties, `e(N_clust)', Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_3_panel_b, tex replace dec(2) keep(c.famineseverity#c.born4960) addstat(Number of work counties, `e(N_clust)', Within R-squared, `e(r2_within)')
restore

* col 2: born in normal counties

preserve 
keep if urbanborn == 0

reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_3_panel_a, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Number of work counties, `e(N_clust)', Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_3_panel_b, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Number of work counties, `e(N_clust)', Within R-squared, `e(r2_within)')

restore

* col 3: work in only one county

preserve 
keep if numberworkcounties == 1

reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_3_panel_a, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Number of work counties, `e(N_clust)', Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_3_panel_b, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Number of work counties, `e(N_clust)', Within R-squared, `e(r2_within)')

restore

* col 4: exclude long term

preserve 
keep if maxterm <= 4

reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_3_panel_a, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Number of work counties, `e(N_clust)', Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_3_panel_b, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Number of work counties, `e(N_clust)', Within R-squared, `e(r2_within)')

restore

* col 5: shrink rate based on local residents

reghdfe lexpen_agri c.faminelocal#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_3_panel_a, tex append dec(2) keep(c.famineseverity#c.born4960 c.faminelocal#c.born4960) addstat(Number of work counties, `e(N_clust)', Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.faminelocal#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_3_panel_b, tex append dec(2) keep(c.famineseverity#c.born4960 c.faminelocal#c.born4960) addstat(Number of work counties, `e(N_clust)', Within R-squared, `e(r2_within)')


*** Table 4 ***

reghdfe lrevenue_agri c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_4, tex replace dec(2) keep(c.famineseverity#c.born4960) addstat(Number of work counties, `e(N_clust)', Within R-squared, `e(r2_within)')

reghdfe lrevenue_agri c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_4, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Number of work counties, `e(N_clust)', Within R-squared, `e(r2_within)')

reghdfe lgrain c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_4, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Number of work counties, `e(N_clust)', Within R-squared, `e(r2_within)')

reghdfe lgrain c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_4, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Number of work counties, `e(N_clust)', Within R-squared, `e(r2_within)')


*** Figure 4 ***

* generate leads and lags
preserve
tab term, gen(tm)
sort county_code year
gen tmlead1 = 0
replace tmlead1 = 1 if county_code == county_code[_n+1] & year == year[_n+1]-1 & cps != cps[_n+1] & term[_n+1] == 1
gen tmlead2 = 0
replace tmlead2 = 1 if county_code == county_code[_n+2] & year == year[_n+2]-2 & cps != cps[_n+2] & tmlead1[_n+1] == 1
gen tmlead3 = 0
replace tmlead3 = 1 if county_code == county_code[_n+3] & year == year[_n+3]-3 & cps != cps[_n+3] & tmlead2[_n+1] == 1
gen tmlead4 = 0
replace tmlead4 = 1 if county_code == county_code[_n+4] & year == year[_n+4]-4 & cps != cps[_n+4] & tmlead3[_n+1] == 1
gen tmlead5 = 0
replace tmlead5 = 1 if county_code == county_code[_n+5] & year == year[_n+5]-5 & cps != cps[_n+5] & tmlead4[_n+1] == 1
gen tmlead6 = 0
replace tmlead6 = 1 if county_code == county_code[_n+6] & year == year[_n+6]-6 & cps != cps[_n+6] & tmlead5[_n+1] == 1
gen tmlead7 = 0
replace tmlead7 = 1 if county_code == county_code[_n+7] & year == year[_n+7]-7 & cps != cps[_n+7] & tmlead6[_n+1] == 1
gen tmlead8 = 0
replace tmlead8 = 1 if county_code == county_code[_n+8] & year == year[_n+8]-8 & cps != cps[_n+8] & tmlead7[_n+1] == 1
gen tmlead9 = 0
replace tmlead9 = 1 if county_code == county_code[_n+9] & year == year[_n+9]-9 & cps != cps[_n+9] & tmlead8[_n+1] == 1
gen tmlead10 = 0
replace tmlead10 = 1 if county_code == county_code[_n+10] & year == year[_n+10]-10 & cps != cps[_n+10] & tmlead9[_n+1] == 1
gen tmlead11 = 0
replace tmlead11 = 1 if county_code == county_code[_n+11] & year == year[_n+11]-11 & cps != cps[_n+11] & tmlead10[_n+1] == 1
gen tmlead12 = 0
replace tmlead12 = 1 if county_code == county_code[_n+12] & year == year[_n+12]-12 & cps != cps[_n+12] & tmlead11[_n+1] == 1
gen tmlead13 = 0
replace tmlead13 = 1 if county_code == county_code[_n+13] & year == year[_n+13]-13 & cps != cps[_n+13] & tmlead12[_n+1] == 1

gen tm6more = 0
replace tm6more = 1 if tm6==1|tm7==1|tm8==1|tm9==1
gen tmlead4more = 0
replace tmlead4more = 1 if tmlead4==1|tmlead5==1|tmlead6==1|tmlead7==1|tmlead8==1|tmlead9==1|tmlead10==1|tmlead11==1|tmlead12==1|tmlead13==1

* plot
gen zero = 1
reghdfe lexpen_agri zero c.famineseverity#c.born4960#c.tmlead4more c.famineseverity#c.born4960#c.tmlead3 c.famineseverity#c.born4960#c.tmlead2 c.famineseverity#c.born4960#c.tm1 c.famineseverity#c.born4960#c.tm2 c.famineseverity#c.born4960#c.tm3 c.famineseverity#c.born4960#c.tm4 c.famineseverity#c.born4960#c.tm5 c.famineseverity#c.born4960#c.tm6more eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
est store agriculture

reghdfe lexpen_secu zero c.famineseverity#c.born4960#c.tmlead4more c.famineseverity#c.born4960#c.tmlead3 c.famineseverity#c.born4960#c.tmlead2 c.famineseverity#c.born4960#c.tm1 c.famineseverity#c.born4960#c.tm2 c.famineseverity#c.born4960#c.tm3 c.famineseverity#c.born4960#c.tm4 c.famineseverity#c.born4960#c.tm5 c.famineseverity#c.born4960#c.tm6more eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
est store social_security

* panel a
coefplot (agriculture) (social_security, msymbol(T)), keep(c.famineseverity#c.born4960#c.tmlead4more c.famineseverity#c.born4960#c.tmlead3 c.famineseverity#c.born4960#c.tmlead2 zero c.famineseverity#c.born4960#c.tm1 c.famineseverity#c.born4960#c.tm2 c.famineseverity#c.born4960#c.tm3 c.famineseverity#c.born4960#c.tm4 c.famineseverity#c.born4960#c.tm5 c.famineseverity#c.born4960#c.tm6more) ///
order(c.famineseverity#c.born4960#c.tmlead4more c.famineseverity#c.born4960#c.tmlead3 c.famineseverity#c.born4960#c.tmlead2 zero c.famineseverity#c.born4960#c.tm1 c.famineseverity#c.born4960#c.tm2 c.famineseverity#c.born4960#c.tm3 c.famineseverity#c.born4960#c.tm4 c.famineseverity#c.born4960#c.tm5 c.famineseverity#c.born4960#c.tm6more) yline(0) levels(90) vertical omitted ciopts(recast(rcap)) ytitle("Coefficients") xtitle("Years of term") ///
coeflabels(c.famineseverity#c.born4960#c.tmlead4more = "≤-4" c.famineseverity#c.born4960#c.tmlead3 = "-3" c.famineseverity#c.born4960#c.tmlead2 = "-2" zero = "-1" c.famineseverity#c.born4960#c.tm1 = "1" c.famineseverity#c.born4960#c.tm2 = "2" c.famineseverity#c.born4960#c.tm3 = "3" c.famineseverity#c.born4960#c.tm4 = "4" c.famineseverity#c.born4960#c.tm5 = "5" c.famineseverity#c.born4960#c.tm6more = "≥6") ylabel(0(1)3) yscale(range(0(1)3)) legend(label(2 "Agricultural") label(4 "Social security"))

graph export "figure_4_panel_a.png", as(png) name("Graph") replace

reghdfe lexpen_agri zero c.famineseverity#c.born5560#c.tmlead4more c.famineseverity#c.born5560#c.tmlead3 c.famineseverity#c.born5560#c.tmlead2 c.famineseverity#c.born5560#c.tm1 c.famineseverity#c.born5560#c.tm2 c.famineseverity#c.born5560#c.tm3 c.famineseverity#c.born5560#c.tm4 c.famineseverity#c.born5560#c.tm5 c.famineseverity#c.born5560#c.tm6more c.famineseverity#c.born4954 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
est store agriculture2

reghdfe lexpen_secu zero c.famineseverity#c.born5560#c.tmlead4more c.famineseverity#c.born5560#c.tmlead3 c.famineseverity#c.born5560#c.tmlead2 c.famineseverity#c.born5560#c.tm1 c.famineseverity#c.born5560#c.tm2 c.famineseverity#c.born5560#c.tm3 c.famineseverity#c.born5560#c.tm4 c.famineseverity#c.born5560#c.tm5 c.famineseverity#c.born5560#c.tm6more c.famineseverity#c.born4954 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
est store social_security2

* panel b
coefplot (agriculture2) (social_security2, msymbol(T)), keep(c.famineseverity#c.born5560#c.tmlead4more c.famineseverity#c.born5560#c.tmlead3 c.famineseverity#c.born5560#c.tmlead2 zero c.famineseverity#c.born5560#c.tm1 c.famineseverity#c.born5560#c.tm2 c.famineseverity#c.born5560#c.tm3 c.famineseverity#c.born5560#c.tm4 c.famineseverity#c.born5560#c.tm5 c.famineseverity#c.born5560#c.tm6more) order(c.famineseverity#c.born5560#c.tmlead4more c.famineseverity#c.born5560#c.tmlead3 c.famineseverity#c.born5560#c.tmlead2 zero c.famineseverity#c.born5560#c.tm1 c.famineseverity#c.born5560#c.tm2 c.famineseverity#c.born5560#c.tm3 c.famineseverity#c.born5560#c.tm4 c.famineseverity#c.born5560#c.tm5 c.famineseverity#c.born5560#c.tm6more) yline(0) levels(90) vertical omitted ciopts(recast(rcap)) ytitle("Coefficients") xtitle("Years of term") ///
coeflabels(c.famineseverity#c.born5560#c.tmlead4more = "≤-4" c.famineseverity#c.born5560#c.tmlead3 = "-3" c.famineseverity#c.born5560#c.tmlead2 = "-2" zero = "-1" c.famineseverity#c.born5560#c.tm1 = "1" c.famineseverity#c.born5560#c.tm2 = "2" c.famineseverity#c.born5560#c.tm3 = "3" c.famineseverity#c.born5560#c.tm4 = "4" c.famineseverity#c.born5560#c.tm5 = "5" c.famineseverity#c.born5560#c.tm6more = "≥6") ylabel(0(1)3) yscale(range(0(1)3)) legend(label(2 "Agricultural") label(4 "Social security"))

graph export "figure_4_panel_b.png", as(png) name("Graph") replace
restore


*** Figure 5 ***

preserve
forvalue i = 1949(1)1969 {
gen by`i' = 0
replace by`i' = 1 if birthyr == `i'
}

gen byb1952 = 0
replace byb1952 = 1 if birthyr <= 1952

reghdfe lexpen_agri c.famineseverity#c.byb1952 c.famineseverity#c.by1953 c.famineseverity#c.by1954 c.famineseverity#c.by1955 c.famineseverity#c.by1956 c.famineseverity#c.by1957 c.famineseverity#c.by1958 c.famineseverity#c.by1959 c.famineseverity#c.by1960 c.famineseverity#c.by1961 c.famineseverity#c.by1962 c.famineseverity#c.by1963 c.famineseverity#c.by1964 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
est store m1
display (3.038+1.590+2.652+0.835+1.973+0.744)/6
display (-0.142+1.307+0.996+0.627)/4

reghdfe lexpen_secu c.famineseverity#c.byb1952 c.famineseverity#c.by1953 c.famineseverity#c.by1954 c.famineseverity#c.by1955 c.famineseverity#c.by1956 c.famineseverity#c.by1957 c.famineseverity#c.by1958 c.famineseverity#c.by1959 c.famineseverity#c.by1960 c.famineseverity#c.by1961 c.famineseverity#c.by1962 c.famineseverity#c.by1963 c.famineseverity#c.by1964 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if year >= 1998 & year <= 2007, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
est store m2
display (2.790+3.874+2.591+2.215+2.943+1.917)/6
display (2.811+1.359+1.768+0.516)/4

* panel a
coefplot m1, keep(c.famineseverity#c.byb1952 c.famineseverity#c.by1953 c.famineseverity#c.by1954 c.famineseverity#c.by1955 c.famineseverity#c.by1956 c.famineseverity#c.by1957 c.famineseverity#c.by1958 c.famineseverity#c.by1959 c.famineseverity#c.by1960 c.famineseverity#c.by1961 c.famineseverity#c.by1962 c.famineseverity#c.by1963 c.famineseverity#c.by1964) order(c.famineseverity#c.byb1951 c.famineseverity#c.byb1952 c.famineseverity#c.by1953 c.famineseverity#c.by1954 c.famineseverity#c.by1955 c.famineseverity#c.by1956 c.famineseverity#c.by1957 c.famineseverity#c.by1958 c.famineseverity#c.by1959 c.famineseverity#c.by1960 c.famineseverity#c.by1961 c.famineseverity#c.by1962 c.famineseverity#c.by1963 c.famineseverity#c.by1964) yline(0) levels(90) vertical xline(9.5) ciopts(recast(rcap)) ytitle("Coefficients") xtitle("Years of birth") ///
coeflabels(c.famineseverity#c.byb1952 = "≤1952" c.famineseverity#c.by1953 = "1953" c.famineseverity#c.by1954 = "1954" c.famineseverity#c.by1955 = "1955" c.famineseverity#c.by1956 = "1956" c.famineseverity#c.by1957 = "1957" c.famineseverity#c.by1958 = "1958" c.famineseverity#c.by1959 = "1959" c.famineseverity#c.by1960 = "1960" c.famineseverity#c.by1961 = "1961" c.famineseverity#c.by1962 = "1962" c.famineseverity#c.by1963 = "1963" c.famineseverity#c.by1964 = "1964") ylabel(-2(2)6) yscale(range(-2(2)6)) ///
addplot(function first=1.805, ra(4 9) || function second=0.697, ra(10 13))

graph export "figure_5_panel_a.png", as(png) name("Graph") replace

* panel b
coefplot m2, keep(c.famineseverity#c.byb1952 c.famineseverity#c.by1953 c.famineseverity#c.by1954 c.famineseverity#c.by1955 c.famineseverity#c.by1956 c.famineseverity#c.by1957 c.famineseverity#c.by1958 c.famineseverity#c.by1959 c.famineseverity#c.by1960 c.famineseverity#c.by1961 c.famineseverity#c.by1962 c.famineseverity#c.by1963 c.famineseverity#c.by1964) order(c.famineseverity#c.byb1951 c.famineseverity#c.byb1952 c.famineseverity#c.by1953 c.famineseverity#c.by1954 c.famineseverity#c.by1955 c.famineseverity#c.by1956 c.famineseverity#c.by1957 c.famineseverity#c.by1958 c.famineseverity#c.by1959 c.famineseverity#c.by1960 c.famineseverity#c.by1961 c.famineseverity#c.by1962 c.famineseverity#c.by1963 c.famineseverity#c.by1964) yline(0) levels(90) vertical xline(9.5) ciopts(recast(rcap)) ytitle("Coefficients") xtitle("Years of birth") ///
coeflabels(c.famineseverity#c.byb1952 = "≤1952" c.famineseverity#c.by1953 = "1953" c.famineseverity#c.by1954 = "1954" c.famineseverity#c.by1955 = "1955" c.famineseverity#c.by1956 = "1956" c.famineseverity#c.by1957 = "1957" c.famineseverity#c.by1958 = "1958" c.famineseverity#c.by1959 = "1959" c.famineseverity#c.by1960 = "1960" c.famineseverity#c.by1961 = "1961" c.famineseverity#c.by1962 = "1962" c.famineseverity#c.by1963 = "1963" c.famineseverity#c.by1964 = "1964") ylabel(-2(2)6) yscale(range(-2(2)6)) ///
addplot(function first=2.722, ra(4 9) || function second=1.614, ra(10 13))

graph export "figure_5_panel_b.png", as(png) name("Graph") replace
restore


********************
***** Appendix *****
********************

*** Figure A3 ***

gen before = 1 if birthyr <= 1958 & birthyr >= 1949
gen during = 2 if birthyr <= 1961 & birthyr >= 1959
gen after = 3 if birthyr <= 1969 & birthyr >= 1962
graph bar (count) after (count) during (count) before, over(year) stack ytitle("Number of observations") legend(label(1 "With CPS born after famine") label(2 "During famine") label(3 "Before famine"))
graph export "figure_a3.png", as(png) name("Graph") replace


*** Table A1 ***

preserve
keep if year == 2007
logout, save(table_a1_row1) tex replace: tabstat pexpen_agri pgdp1 if countytype == 2, stats(mean) c(s) f(%10.2f)
logout, save(table_a1_row2) tex replace: tabstat pexpen_agri pgdp1 if countytype == 1, stats(mean) c(s) f(%10.2f)
logout, save(table_a1_row3) tex replace: tabstat pexpen_agri pgdp1 if countytype == 3, stats(mean) c(s) f(%10.2f)
logout, save(table_a1_row4) tex replace: tabstat pexpen_agri pgdp1 if countytype == 4, stats(mean) c(s) f(%10.2f)
restore


*** Table B1: other expenditures ***

reghdfe lexpen_edu c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b1, tex replace dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_admin c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b1, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_health c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b1, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_public c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b1, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_const c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b1, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_rural c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b1, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')


*** Table B2: in-utero ***

reghdfe lexpen_agri c.famineseverity#c.born4958 c.famineseverity#c.born5961 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b2, tex replace dec(2) keep(c.famineseverity#c.born4958 c.famineseverity#c.born5961) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_agri c.famineseverity#c.born4958 c.famineseverity#c.born5961 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b2, tex append dec(2) keep(c.famineseverity#c.born4958 c.famineseverity#c.born5961) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4958 c.famineseverity#c.born5961 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b2, tex append dec(2) keep(c.famineseverity#c.born4958 c.famineseverity#c.born5961) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4958 c.famineseverity#c.born5961 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b2, tex append dec(2) keep(c.famineseverity#c.born4958 c.famineseverity#c.born5961) addstat(Within R-squared, `e(r2_within)')


*** Table B3: monotonicity ***

reghdfe lexpen_agri c.faminetop10#c.born4960 c.faminetop50#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b3, tex replace dec(2) keep(c.faminetop10#c.born4960 c.faminetop50#c.born4960 c.faminetop10#c.born4954 c.faminetop50#c.born4954 c.faminetop10#c.born5560 c.faminetop50#c.born5560) sortvar(c.faminetop10#c.born4960 c.faminetop50#c.born4960 c.faminetop10#c.born4954 c.faminetop50#c.born4954 c.faminetop10#c.born5560 c.faminetop50#c.born5560) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.faminetop10#c.born4960 c.faminetop50#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b3, tex append dec(2) keep(c.faminetop10#c.born4960 c.faminetop50#c.born4960 c.faminetop10#c.born4954 c.faminetop50#c.born4954 c.faminetop10#c.born5560 c.faminetop50#c.born5560) sortvar(c.faminetop10#c.born4960 c.faminetop50#c.born4960 c.faminetop10#c.born4954 c.faminetop50#c.born4954 c.faminetop10#c.born5560 c.faminetop50#c.born5560) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_agri c.faminetop10#c.born4954 c.faminetop50#c.born4954 c.faminetop10#c.born5560 c.faminetop50#c.born5560 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if year >= 2003 & year <= 2007, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b3, tex append dec(2) keep(c.faminetop10#c.born4960 c.faminetop50#c.born4960 c.faminetop10#c.born4954 c.faminetop50#c.born4954 c.faminetop10#c.born5560 c.faminetop50#c.born5560) sortvar(c.faminetop10#c.born4960 c.faminetop50#c.born4960 c.faminetop10#c.born4954 c.faminetop50#c.born4954 c.faminetop10#c.born5560 c.faminetop50#c.born5560) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.faminetop10#c.born4954 c.faminetop50#c.born4954 c.faminetop10#c.born5560 c.faminetop50#c.born5560 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if year >= 1998 & year <= 2007, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b3, tex append dec(2) keep(c.faminetop10#c.born4960 c.faminetop50#c.born4960 c.faminetop10#c.born4954 c.faminetop50#c.born4954 c.faminetop10#c.born5560 c.faminetop50#c.born5560) sortvar(c.faminetop10#c.born4960 c.faminetop50#c.born4960 c.faminetop10#c.born4954 c.faminetop50#c.born4954 c.faminetop10#c.born5560 c.faminetop50#c.born5560) addstat(Within R-squared, `e(r2_within)')


*** Table B4: more robustness ***

* col 1: cluster at cps level

reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl cps)
outreg2 using table_b4_panel_a, tex replace dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960new) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl cps)
outreg2 using table_b4_panel_b, tex replace dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960new) addstat(Within R-squared, `e(r2_within)')

* col 2: born before 1966

reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if birthyr <= 1966, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b4_panel_a, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960new) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if birthyr <= 1966, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b4_panel_b, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960new) addstat(Within R-squared, `e(r2_within)')

* col 3: famine duration

reghdfe lexpen_agri c.famineseverity#c.born4960new eduyear male minor term c.eduyear#c.born4960new c.male#c.born4960new c.minor#c.born4960new c.age#c.born4960new c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b4_panel_a, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960new) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960new eduyear male minor term c.eduyear#c.born4960new c.male#c.born4960new c.minor#c.born4960new c.age#c.born4960new c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b4_panel_b, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960new) addstat(Within R-squared, `e(r2_within)')

* col 4: prov-by-year FE

reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.prov_code#i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b4_panel_a, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960new) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.prov_code#i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b4_panel_b, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960new) addstat(Within R-squared, `e(r2_within)')

* col 5: age under 48

reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if age <= 48, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b4_panel_a, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960new) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if age <= 48, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b4_panel_b, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960new) addstat(Within R-squared, `e(r2_within)')

* col 6: county trend

bysort county_code: egen ny = count(year)
tab ny
sum ny, de

reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 if ny > 7, absorb(i.county_code i.year i.age i.htcode i.birthyr i.county_code#c.year) vce(cl county_code)
outreg2 using table_b4_panel_a, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960new) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 if ny > 7, absorb(i.county_code i.year i.age i.htcode i.birthyr i.county_code#c.year) vce(cl county_code)
outreg2 using table_b4_panel_b, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960new) addstat(Within R-squared, `e(r2_within)')


*** Table B5: cps characteristics ***

* col 1 edu

reghdfe lexpen_agri c.famineseverity#c.born4960 c.eduyear#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b5, tex replace dec(2) keep(c.famineseverity#c.born4960 c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960) addstat(Within R-squared, `e(r2_within)')

* col 2 male
reghdfe lexpen_agri c.famineseverity#c.born4960 c.male#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b5, tex append dec(2) keep(c.famineseverity#c.born4960 c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960) addstat(Within R-squared, `e(r2_within)')

* col 3 minor
reghdfe lexpen_agri c.famineseverity#c.born4960 c.minor#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b5, tex append dec(2) keep(c.famineseverity#c.born4960 c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960) addstat(Within R-squared, `e(r2_within)')

* col 4 age
reghdfe lexpen_agri c.famineseverity#c.born4960 c.age#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b5, tex append dec(2) keep(c.famineseverity#c.born4960 c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960) addstat(Within R-squared, `e(r2_within)')

* col 5 edu
reghdfe lexpen_secu c.famineseverity#c.born4960 c.eduyear#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b5, tex append dec(2) keep(c.famineseverity#c.born4960 c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960) addstat(Within R-squared, `e(r2_within)')

* col 6 male
reghdfe lexpen_secu c.famineseverity#c.born4960 c.male#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b5, tex append dec(2) keep(c.famineseverity#c.born4960 c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960) addstat(Within R-squared, `e(r2_within)')

* col 7 minor
reghdfe lexpen_secu c.famineseverity#c.born4960 c.minor#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b5, tex append dec(2) keep(c.famineseverity#c.born4960 c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960) addstat(Within R-squared, `e(r2_within)')

* col 8 age

reghdfe lexpen_secu c.famineseverity#c.born4960 c.age#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b5, tex append dec(2) keep(c.famineseverity#c.born4960 c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960) addstat(Within R-squared, `e(r2_within)')


*** Table B6: by cohorts ***

preserve
forvalue i = 1949(1)1969 {
gen by`i' = 0
replace by`i' = 1 if birthyr == `i'
}

gen byb1952 = 0
replace byb1952 = 1 if birthyr <= 1952

reghdfe lexpen_agri c.famineseverity#c.byb1952 c.famineseverity#c.by1953 c.famineseverity#c.by1954 c.famineseverity#c.by1955 c.famineseverity#c.by1956 c.famineseverity#c.by1957 c.famineseverity#c.by1958 c.famineseverity#c.by1959 c.famineseverity#c.by1960 c.famineseverity#c.by1961 c.famineseverity#c.by1962 c.famineseverity#c.by1963 c.famineseverity#c.by1964 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b6, tex replace dec(2) keep(c.famineseverity#c.byb1952 c.famineseverity#c.by1953 c.famineseverity#c.by1954 c.famineseverity#c.by1955 c.famineseverity#c.by1956 c.famineseverity#c.by1957 c.famineseverity#c.by1958 c.famineseverity#c.by1959 c.famineseverity#c.by1960 c.famineseverity#c.by1961 c.famineseverity#c.by1962 c.famineseverity#c.by1963 c.famineseverity#c.by1964 c.famineseverity#c.by1949 c.famineseverity#c.by1950 c.famineseverity#c.by1951 c.famineseverity#c.by1952) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_agri c.famineseverity#c.by1949 c.famineseverity#c.by1950 c.famineseverity#c.by1951 c.famineseverity#c.by1952 c.famineseverity#c.by1953 c.famineseverity#c.by1954 c.famineseverity#c.by1955 c.famineseverity#c.by1956 c.famineseverity#c.by1957 c.famineseverity#c.by1958 c.famineseverity#c.by1959 c.famineseverity#c.by1960 c.famineseverity#c.by1961 c.famineseverity#c.by1962 c.famineseverity#c.by1963 c.famineseverity#c.by1964 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b6, tex append dec(2) keep(c.famineseverity#c.byb1952 c.famineseverity#c.by1953 c.famineseverity#c.by1954 c.famineseverity#c.by1955 c.famineseverity#c.by1956 c.famineseverity#c.by1957 c.famineseverity#c.by1958 c.famineseverity#c.by1959 c.famineseverity#c.by1960 c.famineseverity#c.by1961 c.famineseverity#c.by1962 c.famineseverity#c.by1963 c.famineseverity#c.by1964 c.famineseverity#c.by1949 c.famineseverity#c.by1950 c.famineseverity#c.by1951 c.famineseverity#c.by1952) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.byb1952 c.famineseverity#c.by1953 c.famineseverity#c.by1954 c.famineseverity#c.by1955 c.famineseverity#c.by1956 c.famineseverity#c.by1957 c.famineseverity#c.by1958 c.famineseverity#c.by1959 c.famineseverity#c.by1960 c.famineseverity#c.by1961 c.famineseverity#c.by1962 c.famineseverity#c.by1963 c.famineseverity#c.by1964 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b6, tex append dec(2) keep(c.famineseverity#c.byb1952 c.famineseverity#c.by1953 c.famineseverity#c.by1954 c.famineseverity#c.by1955 c.famineseverity#c.by1956 c.famineseverity#c.by1957 c.famineseverity#c.by1958 c.famineseverity#c.by1959 c.famineseverity#c.by1960 c.famineseverity#c.by1961 c.famineseverity#c.by1962 c.famineseverity#c.by1963 c.famineseverity#c.by1964 c.famineseverity#c.by1949 c.famineseverity#c.by1950 c.famineseverity#c.by1951 c.famineseverity#c.by1952) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.by1949 c.famineseverity#c.by1950 c.famineseverity#c.by1951 c.famineseverity#c.by1952 c.famineseverity#c.by1953 c.famineseverity#c.by1954 c.famineseverity#c.by1955 c.famineseverity#c.by1956 c.famineseverity#c.by1957 c.famineseverity#c.by1958 c.famineseverity#c.by1959 c.famineseverity#c.by1960 c.famineseverity#c.by1961 c.famineseverity#c.by1962 c.famineseverity#c.by1963 c.famineseverity#c.by1964 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b6, tex append dec(2) keep(c.famineseverity#c.byb1952 c.famineseverity#c.by1953 c.famineseverity#c.by1954 c.famineseverity#c.by1955 c.famineseverity#c.by1956 c.famineseverity#c.by1957 c.famineseverity#c.by1958 c.famineseverity#c.by1959 c.famineseverity#c.by1960 c.famineseverity#c.by1961 c.famineseverity#c.by1962 c.famineseverity#c.by1963 c.famineseverity#c.by1964 c.famineseverity#c.by1949 c.famineseverity#c.by1950 c.famineseverity#c.by1951 c.famineseverity#c.by1952) addstat(Within R-squared, `e(r2_within)')

restore


*** Table B7: other revenues ***

reghdfe lrevenue_business c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b7, tex replace dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lrevenue_vat c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b7, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lrevenue_firm c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b7, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lrevenue_city c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b7, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lrevenue_individual c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b7, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')


*** Table B8: agri tax after 2001 ***

reghdfe lrevenue_agri c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 if year >= 2001 & year <= 2005 & samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b8, tex replace dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lrevenue_agri c.famineseverity#c.born4960 eduyear male minor term c.eduyear#c.born4960 c.male#c.born4960 c.minor#c.born4960 c.age#c.born4960 c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if year >= 2001 & year <= 2005 & samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b8, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')


*** Table B9: other development outcomes ***

outreg2 using table_b9_mean_of_y if samples2 == 1, replace sum(log) keep(lcotton loil lgdp1 lstudent lbed lwelcenter lfirmn lfirmv linfras lgdppc)

reghdfe lcotton c.famineseverity#c.born4960 eduyear male minor term if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b9, tex replace dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe loil c.famineseverity#c.born4960 eduyear male minor term if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b9, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lgdp1 c.famineseverity#c.born4960 eduyear male minor term if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b9, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lstudent c.famineseverity#c.born4960 eduyear male minor term if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b9, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lbed c.famineseverity#c.born4960 eduyear male minor term if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b9, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lwelcenter c.famineseverity#c.born4960 eduyear male minor term if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b9, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lfirmn c.famineseverity#c.born4960 eduyear male minor term if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b9, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lfirmv c.famineseverity#c.born4960 eduyear male minor term if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b9, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe linfras c.famineseverity#c.born4960 eduyear male minor term if samples2 == 1, absorb(i.county_code i.year i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b9, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lgdppc c.famineseverity#c.born4960 eduyear male minor term if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b9, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')


*** Table B10: total expenditure, revenue, and transfer ***

outreg2 using table_b10_mean_of_y if samples2 == 1, replace sum(log) keep(lexpenditure lrevenue ltransfer)

reghdfe lexpenditure c.famineseverity#c.born4960 eduyear male minor term if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code) 
outreg2 using table_b10, tex replace dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpenditure c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code) 
outreg2 using table_b10, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lrevenue c.famineseverity#c.born4960 eduyear male minor term if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b10, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lrevenue c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b10, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe ltransfer c.famineseverity#c.born4960 eduyear male minor term if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b10, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe ltransfer c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year if samples2 == 1, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_b10, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)')


*** Table C2: promotion ***

sum promoted

reghdfe promoted c.famineseverity#c.born4960 eduyear male minor term, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c2, tex replace dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') addtext(Mean of dep. var., 0.098)

reghdfe promoted c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c2, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') addtext(Mean of dep. var., 0.098)


*** Table C3: allocation to agri counties within home city ***

preserve
gen agrihome1 = 0
replace agrihome1 = 1 if agricounty1 == 1 & homecity == 1
gen agrihome2 = 0
replace agrihome2 = 1 if agricounty2 == 1 & homecity == 1
sort cps year county_code
drop if cps == cps[_n-1] & county_code == county_code[_n-1]
sum agrihome1 agrihome2
reghdfe agrihome1 c.famineseverity#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c3, tex replace dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') addtext(Mean of dep. var., 0.13)

reghdfe agrihome2 c.famineseverity#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c3, tex append dec(2) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') addtext(Mean of dep. var., 0.15)
restore


*** Table C4: agri counties ***

* cols 1-4 

reghdfe lexpen_agri agricounty1 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.agricounty1 c.born4960#c.agricounty1 c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c4, tex replace dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960#c.rugged c.famineseverity#c.born4960#c.libern) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu agricounty1 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.agricounty1 c.born4960#c.agricounty1 c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c4, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960#c.rugged c.famineseverity#c.born4960#c.libern) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_agri agricounty2 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.agricounty2 c.born4960#c.agricounty2 c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c4, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960#c.rugged c.famineseverity#c.born4960#c.libern) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu agricounty2 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.agricounty2 c.born4960#c.agricounty2 c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c4, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960#c.rugged c.famineseverity#c.born4960#c.libern) addstat(Within R-squared, `e(r2_within)')

* cols 5-8 

reghdfe lexpen_agri dn2008d c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.dn2008d c.born4960#c.dn2008d c.famineseverity#c.dn2008d c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c4, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960#c.rugged c.famineseverity#c.born4960#c.libern) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu dn2008d c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.dn2008d c.born4960#c.dn2008d c.famineseverity#c.dn2008d c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c4, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960#c.rugged c.famineseverity#c.born4960#c.libern) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_agri grainsdh c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.grainsdh c.born4960#c.grainsdh c.famineseverity#c.grainsdh c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c4, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960#c.rugged c.famineseverity#c.born4960#c.libern) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu grainsdh c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.grainsdh c.born4960#c.grainsdh c.famineseverity#c.grainsdh c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c4, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960#c.rugged c.famineseverity#c.born4960#c.libern) addstat(Within R-squared, `e(r2_within)')

* cols 9-10

reghdfe lexpen_agri secondterm c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960 c.famineseverity#c.secondterm c.born4960#c.secondterm eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c4, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960#c.rugged c.famineseverity#c.born4960#c.libern) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu secondterm c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960 c.famineseverity#c.secondterm c.born4960#c.secondterm eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c4, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960#c.rugged c.famineseverity#c.born4960#c.libern) addstat(Within R-squared, `e(r2_within)')

* cols 11-12 

reghdfe lexpen_agri c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.rugged c.born4960#c.rugged eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c4, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960#c.rugged c.famineseverity#c.born4960#c.libern) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.rugged c.born4960#c.rugged eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c4, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960#c.rugged c.famineseverity#c.born4960#c.libern) addstat(Within R-squared, `e(r2_within)')

* cols 13-14 

reghdfe lexpen_agri c.famineseverity#c.born4960#c.libern c.famineseverity#c.born4960 c.born4960#c.libern eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c4, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960#c.rugged c.famineseverity#c.born4960#c.libern) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960#c.libern c.famineseverity#c.born4960 c.born4960#c.libern eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c4, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.agricounty1 c.famineseverity#c.born4960#c.agricounty2 c.famineseverity#c.born4960#c.dn2008d c.famineseverity#c.born4960#c.grainsdh c.famineseverity#c.born4960#c.secondterm c.famineseverity#c.born4960#c.rugged c.famineseverity#c.born4960#c.libern) addstat(Within R-squared, `e(r2_within)')


*** Table C5: distance ***

* cols 1-6

reghdfe lexpen_agri dist100 c.famineseverity#c.born4960#c.dist100 c.famineseverity#c.dist100 c.born4960#c.dist100 c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
ereturn list
lincom _b[c.famineseverity#c.born4960#c.dist100] + _b[c.famineseverity#c.born4960]
outreg2 using table_c5, tex replace dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.dist100) addstat(Within R-squared, `e(r2_within)') addtext(Sum of two coefficients, 1.01**, se, (0.42))

reghdfe lexpen_secu dist100 c.famineseverity#c.born4960#c.dist100 c.famineseverity#c.dist100 c.born4960#c.dist100 c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
lincom _b[c.famineseverity#c.born4960#c.dist100] + _b[c.famineseverity#c.born4960]
outreg2 using table_c5, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.dist100) addstat(Within R-squared, `e(r2_within)') addtext(Sum of two coefficients, 1.52*, se, (0.91))

reghdfe lexpen_agri dist200 c.famineseverity#c.born4960#c.dist200 c.famineseverity#c.dist200 c.born4960#c.dist200 c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
lincom _b[c.famineseverity#c.born4960#c.dist200] + _b[c.famineseverity#c.born4960]
outreg2 using table_c5, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.dist200) addstat(Within R-squared, `e(r2_within)') addtext(Sum of two coefficients, 1.60, se, (0.99))

reghdfe lexpen_secu dist200 c.famineseverity#c.born4960#c.dist200 c.famineseverity#c.dist200 c.born4960#c.dist200 c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
lincom _b[c.famineseverity#c.born4960#c.dist200] + _b[c.famineseverity#c.born4960]
outreg2 using table_c5, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.dist200) addstat(Within R-squared, `e(r2_within)') addtext(Sum of two coefficients, 0.46, se, (1.49))

reghdfe lexpen_agri dist300 c.famineseverity#c.born4960#c.dist300 c.famineseverity#c.dist300 c.born4960#c.dist300 c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
lincom _b[c.famineseverity#c.born4960#c.dist300] + _b[c.famineseverity#c.born4960]
outreg2 using table_c5, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.dist300) addstat(Within R-squared, `e(r2_within)') addtext(Sum of two coefficients, 0.61, se, (0.94))

reghdfe lexpen_secu dist300 c.famineseverity#c.born4960#c.dist300 c.famineseverity#c.dist300 c.born4960#c.dist300 c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
lincom _b[c.famineseverity#c.born4960#c.dist300] + _b[c.famineseverity#c.born4960]
outreg2 using table_c5, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.dist300) addstat(Within R-squared, `e(r2_within)') addtext(Sum of two coefficients, -2.42, se, (2.56))

* cols 7-8

gen htcodecity = int(htcode/100)*100
gen city_code = int(county_code/100)*100
gen diffcity = 0
replace diffcity = 1 if htcodecity == city_code

reghdfe lexpen_agri diffcity c.famineseverity#c.born4960#c.diffcity c.famineseverity#c.diffcity c.born4960#c.diffcity c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
lincom _b[c.famineseverity#c.born4960#c.diffcity] + _b[c.famineseverity#c.born4960]
outreg2 using table_c5, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.diffcity) addstat(Within R-squared, `e(r2_within)') addtext(Sum of two coefficients, 0.70**, se, (0.30))

reghdfe lexpen_secu diffcity c.famineseverity#c.born4960#c.diffcity c.famineseverity#c.diffcity c.born4960#c.diffcity c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
lincom _b[c.famineseverity#c.born4960#c.diffcity] + _b[c.famineseverity#c.born4960]
outreg2 using table_c5, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.diffcity) addstat(Within R-squared, `e(r2_within)') addtext(Sum of two coefficients, 0.82*, se, (0.46))

* col 9-10

reghdfe lexpen_agri nonneighbor c.famineseverity#c.born4960#c.nonneighbor c.famineseverity#c.nonneighbor c.born4960#c.nonneighbor c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
lincom _b[c.famineseverity#c.born4960#c.nonneighbor] + _b[c.famineseverity#c.born4960]
outreg2 using table_c5, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.nonneighbor) addstat(Within R-squared, `e(r2_within)') addtext(Sum of two coefficients, 1.15**, se, (0.45))

reghdfe lexpen_secu nonneighbor c.famineseverity#c.born4960#c.nonneighbor c.famineseverity#c.nonneighbor c.born4960#c.nonneighbor c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
lincom _b[c.famineseverity#c.born4960#c.nonneighbor] + _b[c.famineseverity#c.born4960]
outreg2 using table_c5, tex append dec(2) keep(c.famineseverity#c.born4960 c.famineseverity#c.born4960#c.nonneighbor) addstat(Within R-squared, `e(r2_within)') addtext(Sum of two coefficients, 1.73***, se, (0.66))


*** Table C6: Conley s.e. ***

* panel a

reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
gen esample=e(sample)
reg lexpen_agri eduyear male minor term eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year i.county_code i.year i.age i.htcode i.birthyr if esample==1
predict residy, r
gen famine_60 = c.famineseverity#c.born4960
reg famine_60 eduyear male minor term eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year i.county_code i.year i.age i.htcode i.birthyr if esample==1
predict residx, r
* 100 km, lag 0:
ols_spatial_HAC residy residx if esample == 1, lat(htlati) lon(htlongi) t(year) p(county_code) dist(100) lag(0)
est store m1
* 100 km, lag 1:
ols_spatial_HAC residy residx if esample == 1, lat(htlati) lon(htlongi) t(year) p(county_code) dist(100) lag(1)
est store m2
* 100 km, lag 2:
ols_spatial_HAC residy residx if esample == 1, lat(htlati) lon(htlongi) t(year) p(county_code) dist(100) lag(2)
est store m3
* 500 km, lag0: 
ols_spatial_HAC residy residx if esample == 1, lat(htlati) lon(htlongi) t(year) p(county_code) dist(500) lag(0)
est store m4
* 500 km, lag1: 
ols_spatial_HAC residy residx if esample == 1, lat(htlati) lon(htlongi) t(year) p(county_code) dist(500) lag(1)
est store m5
* 500 km, lag2: 
ols_spatial_HAC residy residx if esample == 1, lat(htlati) lon(htlongi) t(year) p(county_code) dist(500) lag(2)
est store m6

outreg2 [m1 m2 m3 m4 m5 m6] using table_c6_panel_a, tex replace dec(2) keep(residx)

* panel b

drop esample residy residx
reghdfe lexpen_secu c.famineseverity#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
gen esample=e(sample)
reg lexpen_secu eduyear male minor term eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year i.county_code i.year i.age i.htcode i.birthyr if esample==1
predict residy, r
gen shrink_60 = c.famineseverity#c.born4960
reg shrink_60 eduyear male minor term eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year i.county_code i.year i.age i.htcode i.birthyr if esample==1
predict residx, r
* 100 km, lag 0:
ols_spatial_HAC residy residx if esample == 1, lat(htlati) lon(htlongi) t(year) p(county_code) dist(100) lag(0)
est store m1b
* 100 km, lag 1:
ols_spatial_HAC residy residx if esample == 1, lat(htlati) lon(htlongi) t(year) p(county_code) dist(100) lag(1)
est store m2b
* 100 km, lag 2:
ols_spatial_HAC residy residx if esample == 1, lat(htlati) lon(htlongi) t(year) p(county_code) dist(100) lag(2)
est store m3b
* 500 km, lag0: 
ols_spatial_HAC residy residx if esample == 1, lat(htlati) lon(htlongi) t(year) p(county_code) dist(500) lag(0)
est store m4b
* 500 km, lag1: 
ols_spatial_HAC residy residx if esample == 1, lat(htlati) lon(htlongi) t(year) p(county_code) dist(500) lag(1)
est store m5b
* 500 km, lag2: 
ols_spatial_HAC residy residx if esample == 1, lat(htlati) lon(htlongi) t(year) p(county_code) dist(500) lag(2)
est store m6b

outreg2 [m1b m2b m3b m4b m5b m6b] using table_c6_panel_b, tex replace dec(2) keep(residx)

*** Table C7: radicalism ***

* cols 1-4

reghdfe lexpen_agri c.famineseverity#c.born4960 c.grainrate#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c7, tex replace dec(2) keep(c.famineseverity#c.born4960 c.grainrate#c.born4960 c.steelprod#c.born4960 c.ldeath#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960 c.grainrate#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c7, tex append dec(2) keep(c.famineseverity#c.born4960 c.grainrate#c.born4960 c.steelprod#c.born4960 c.ldeath#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_agri c.famineseverity#c.born4960 c.steelprod#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c7, tex append dec(2) keep(c.famineseverity#c.born4960 c.grainrate#c.born4960 c.steelprod#c.born4960 c.ldeath#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960 c.steelprod#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c7, tex append dec(2) keep(c.famineseverity#c.born4960 c.grainrate#c.born4960 c.steelprod#c.born4960 c.ldeath#c.born4960) addstat(Within R-squared, `e(r2_within)')

* cols 5-6

reghdfe lexpen_agri c.famineseverity#c.born4960 c.ldeath#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c7, tex append dec(2) keep(c.famineseverity#c.born4960 c.grainrate#c.born4960 c.steelprod#c.born4960 c.ldeath#c.born4960) addstat(Within R-squared, `e(r2_within)')

reghdfe lexpen_secu c.famineseverity#c.born4960 c.ldeath#c.born4960 eduyear male minor term c.lgdp1998#i.year c.lpopulation1998#i.year c.lexpenditure1998#i.year c.lrevenue1998#i.year, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using table_c7, tex append dec(2) keep(c.famineseverity#c.born4960 c.grainrate#c.born4960 c.steelprod#c.born4960 c.ldeath#c.born4960) addstat(Within R-squared, `e(r2_within)')
