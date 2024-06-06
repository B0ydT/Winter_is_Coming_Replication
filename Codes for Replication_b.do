
*** Note that the path should be manually set to where the downloaded data files are stored. Figures and tables will be saved in the Results folder.

cd "C:\Users\Steven Guo\Nutstore\1\Famine\EJ\4th\Replication package"

*** Install packages ***

ssc install reghdfe
ssc install outreg2


*** Figure 2 ***

use "Data for Replication_b.dta", clear

graph twoway (bar csize birthyr, color(gs10))(bar csize birthyr if birthyr >= 1959 & birthyr <= 1961, color(black))(bar csize birthyr if birthyr >= 1956 & birthyr <= 1958, color(gs5))(bar csize birthyr if birthyr >= 1962 & birthyr <= 1964, color(gs5)), xtitle("Year of birth") ytitle("Birth cohort size (# of individuals, 1% sample size)") legend(off)
graph export "Results\figure_2.png", as(png) name("Graph")


*** Figure A1: representative ***

use "Data for Replication_e.dta", clear

preserve
gen e = 1
expand 2
sort id data
replace e = 2 if id == id[_n-1]
drop if e == 2 & data == .
ksmirnov gdp, by(e)
ksmirnov pcgdp, by(e)
ksmirnov population, by(e)
ksmirnov popu_agri, by(e)
ksmirnov revenue, by(e)
ksmirnov pcrevenue, by(e)
ksmirnov expenditure, by(e)
ksmirnov pcexpenditure, by(e)
restore

* GDP
sum gdp, de
return list
gen outlier1 = 1 if gdp > r(p99) | gdp < r(p1)
sum gdp if data == 1, de
return list
gen outlier2 = 1 if gdp > r(p99) | gdp < r(p1)
twoway (kdensity gdp if outlier1 != 1, lcol(black) lpattern(dash))(kdensity gdp if data == 1 & outlier2 != 1, lcol(black)), legend(label(1 "All counties") label(2 "Selected counties")) xtitle("(in billions)") title("GDP") subtitle("P=0.48") graphregion(color(white)) ylabel(,nogrid) ytitle("") saving(gdp.gph, replace)
drop outlier1 outlier2
graph export "Results\figure_a1_gdp.png", as(png) name("Graph")

* Per capita GDP
sum pcgdp, de
return list
gen outlier1 = 1 if pcgdp > r(p99) | pcgdp < r(p1)
sum pcgdp if data == 1, de
return list
gen outlier2 = 1 if pcgdp > r(p99) | pcgdp < r(p1)
twoway (kdensity pcgdp if outlier1 != 1, lcol(black) lpattern(dash))(kdensity pcgdp if data == 1 & outlier2 != 1, lcol(black)), legend(label(1 "All counties") label(2 "Selected counties")) xtitle("(in thousands)") title("Per capita GDP") subtitle("P=0.69") graphregion(color(white)) ylabel(,nogrid) ytitle("") saving(pcgdp.gph, replace)
drop outlier1 outlier2
graph export "Results\figure_a1_percapitagdp.png", as(png) name("Graph")

* Population
sum population, de
return list
gen outlier1 = 1 if population > r(p99) | population < r(p1)
sum population if data == 1, de
return list
gen outlier2 = 1 if population > r(p99) | population < r(p1)
twoway (kdensity population if outlier1 != 1, lcol(black) lpattern(dash))(kdensity population if data == 1 & outlier2 != 1, lcol(black)), legend(label(1 "All counties") label(2 "Selected counties")) xtitle("(in millions)") title("Population") subtitle("P=0.16") graphregion(color(white)) ylabel(,nogrid) ytitle("") saving(popu.gph, replace)
drop outlier1 outlier2
graph export "Results\figure_a1_population.png", as(png) name("Graph")

* Agri population
sum popu_agri, de
return list
gen outlier1 = 1 if popu_agri > r(p99) | popu_agri < r(p1)
sum popu_agri if data == 1, de
return list
gen outlier2 = 1 if popu_agri > r(p99) | popu_agri < r(p1)
twoway (kdensity popu_agri if outlier1 != 1, lcol(black) lpattern(dash))(kdensity popu_agri if data == 1 & outlier2 != 1, lcol(black)), legend(label(1 "All counties") label(2 "Selected counties")) xtitle("(in millions)") title("Agricultural population") subtitle("P=0.16") graphregion(color(white)) ylabel(,nogrid) ytitle("") saving(agripopu.gph, replace)
drop outlier1 outlier2
graph export "Results\figure_a1_agriculturalpopulation.png", as(png) name("Graph")

* Revenue
sum revenue, de
return list
gen outlier1 = 1 if revenue > r(p99) | revenue < r(p1)
sum revenue if data == 1, de
return list
gen outlier2 = 1 if revenue > r(p99) | revenue < r(p1)
twoway (kdensity revenue if outlier1 != 1, lcol(black) lpattern(dash))(kdensity revenue if data == 1 & outlier2 != 1, lcol(black)), legend(label(1 "All counties") label(2 "Selected counties")) xtitle("(in billions)") title("Fiscal revenue") subtitle("P=0.04") graphregion(color(white)) ylabel(,nogrid) ytitle("") saving(revenue.gph, replace)
drop outlier1 outlier2
graph export "Results\figure_a1_fiscalrevenue.png", as(png) name("Graph")

* Per capita revenue
sum pcrevenue, de
return list
gen outlier1 = 1 if pcrevenue > r(p99) | pcrevenue < r(p1)
sum pcrevenue if data == 1, de
return list
gen outlier2 = 1 if pcrevenue > r(p99) | pcrevenue < r(p1)
twoway (kdensity pcrevenue if outlier1 != 1, lcol(black) lpattern(dash))(kdensity pcrevenue if data == 1 & outlier2 != 1, lcol(black)), legend(label(1 "All counties") label(2 "Selected counties")) xtitle("(in thousands)") title("Per capita revenue") subtitle("P=0.30") graphregion(color(white)) ylabel(,nogrid) ytitle("") saving(pcrevenue.gph, replace)
drop outlier1 outlier2
graph export "Results\figure_a1_percapitarevenue.png", as(png) name("Graph")

* Expenditure
sum expenditure, de
return list
gen outlier1 = 1 if expenditure > r(p99) | expenditure < r(p1)
sum expenditure if data == 1, de
return list
gen outlier2 = 1 if expenditure > r(p99) | expenditure < r(p1)
twoway (kdensity expenditure if outlier1 != 1, lcol(black) lpattern(dash))(kdensity expenditure if data == 1 & outlier2 != 1, lcol(black)), legend(label(1 "All counties") label(2 "Selected counties")) xtitle("(in billions)") title("Fiscal expenditure") subtitle("P=0.00") graphregion(color(white)) ylabel(,nogrid) ytitle("") saving(expen.gph, replace)
drop outlier1 outlier2
graph export "Results\figure_a1_fiscalexpenditure.png", as(png) name("Graph")

* Per capita expenditure
sum pcexpenditure, de
return list
gen outlier1 = 1 if pcexpenditure > r(p99) | pcexpenditure < r(p1)
sum pcexpenditure if data == 1, de
return list
gen outlier2 = 1 if pcexpenditure > r(p99) | pcexpenditure < r(p1)
twoway (kdensity pcexpenditure if outlier1 != 1, lcol(black) lpattern(dash))(kdensity pcexpenditure if data == 1 & outlier2 != 1, lcol(black)), legend(label(1 "All counties") label(2 "Selected counties")) xtitle("(in thousands)") title("Per capita expenditure") subtitle("P=0.04") graphregion(color(white)) ylabel(,nogrid) ytitle("") saving(pcexpen.gph, replace)
drop outlier1 outlier2
graph export "Results\figure_a1_percapitaexpenditure.png", as(png) name("Graph")


*** Figure A2 ***

use "Data for Replication_f.dta", clear
corr pdevr death
corr pdevr mortality
graph bar pdevr death mortality, over(province, sort(1) descending label(angle(45))) ytitle("Percentage") legend(label(1 "Famine severity") label(2 "Unusual death rate (corr=0.78)") label(3 "Mortality rate (corr=0.80)"))
graph export "Results\figure_a2.png", as(png) name("Graph")


*** Table C1: strategic appointment ***

* panel a
use "Data for Replication_c.dta", clear
reghdfe lgdp c.famineseverity#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_a", tex replace dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lpopulation c.famineseverity#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_a", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lpopu_agri c.famineseverity#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_a", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lexpenditure c.famineseverity#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_a", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_a", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lrevenue c.famineseverity#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_a", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lrevenue_agri c.famineseverity#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_a", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lgrain c.famineseverity#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_a", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lgdp1 c.famineseverity#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_a", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

* panel b
reghdfe lgdp c.famprov#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_b", tex replace dec(3) keep(c.famprov#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lpopulation c.famprov#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_b", tex append dec(3) keep(c.famprov#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lpopu_agri c.famprov#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_b", tex append dec(3) keep(c.famprov#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lexpenditure c.famprov#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_b", tex append dec(3) keep(c.famprov#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lexpen_agri c.famprov#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_b", tex append dec(3) keep(c.famprov#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lrevenue c.famprov#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_b", tex append dec(3) keep(c.famprov#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lrevenue_agri c.famprov#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_b", tex append dec(3) keep(c.famprov#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lgrain c.famprov#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_b", tex append dec(3) keep(c.famprov#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

reghdfe lgdp1 c.famprov#c.born4960 eduyear male minor term, absorb(i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_b", tex append dec(3) keep(c.famprov#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(3)

* panel c
use "Data for Replication_d.dta", clear
reghdfe lgdp c.famineseverity#c.born4960 eduyear male minor term, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_c", tex replace dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(4)

reghdfe lpopulation c.famineseverity#c.born4960 eduyear male minor term, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_c", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(4)

reghdfe lpopu_agri c.famineseverity#c.born4960 eduyear male minor term, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_c", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(4)

reghdfe lexpenditure c.famineseverity#c.born4960 eduyear male minor term, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_c", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(4)

reghdfe lexpen_agri c.famineseverity#c.born4960 eduyear male minor term, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_c", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(4)

reghdfe lrevenue c.famineseverity#c.born4960 eduyear male minor term, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_c", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(4)

reghdfe lrevenue_agri c.famineseverity#c.born4960 eduyear male minor term, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_c", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(4)

reghdfe lgrain c.famineseverity#c.born4960 eduyear male minor term, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_c", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(4)

reghdfe lgdp1 c.famineseverity#c.born4960 eduyear male minor term, absorb(i.county_code i.year i.age i.htcode i.birthyr) vce(cl county_code)
outreg2 using "Results\table_c1_panel_c", tex append dec(3) keep(c.famineseverity#c.born4960) addstat(Within R-squared, `e(r2_within)') adec(4)


*** Figure C1 ***

use "Data for Replication_c.dta", clear

graph twoway (scatter lgdp famineseverity if birthyr <= 1958, mcolor(gs10) msize(vsmall))(scatter lgdp famineseverity if birthyr >= 1959 & birthyr <= 1961, mcolor(gs4) msymbol(triangle) msize(vsmall))(scatter lgdp famineseverity if birthyr >= 1962, mcolor(black) msymbol(square) msize(vsmall))(lfit lgdp famineseverity if birthyr <= 1958, lcolor(gs10) lwidth(thin))(lfit lgdp famineseverity if birthyr >= 1962, lcolor(black) lwidth(vthin))(lfit lgdp famineseverity if birthyr >= 1959 & birthyr <= 1961, lcolor(gs4) lwidth(vthin)), ytitle("Log GDP") xtitle("Famine severity") legend(lab(1 "CPS born before famine") lab(2 "during famine") lab(3 "after famine") order(1 2 3) cols(3)) saving(gdp, replace) graphregion(color(white)) bgcolor(white) ylabel(, nogrid)
graph export "Results\figure_c1_gdp.png", as(png) name("Graph")

graph twoway (scatter lpopulation famineseverity if birthyr <= 1958, mcolor(gs10) msize(vsmall))(scatter lpopulation famineseverity if birthyr >= 1959 & birthyr <= 1961, mcolor(gs4) msymbol(triangle) msize(vsmall))(scatter lpopulation famineseverity if birthyr >= 1962, mcolor(black) msymbol(square) msize(vsmall))(lfit lpopulation famineseverity if birthyr <= 1958, lcolor(gs10) lwidth(thin))(lfit lpopulation famineseverity if birthyr >= 1962, lcolor(black) lwidth(vthin))(lfit lpopulation famineseverity if birthyr >= 1959 & birthyr <= 1961, lcolor(gs4) lwidth(vthin)), ytitle("Log population") xtitle("Famine severity") legend(lab(1 "CPS born before famine") lab(2 "during famine") lab(3 "after famine") order(1 2 3) cols(3)) saving(popu, replace) graphregion(color(white)) bgcolor(white) ylabel(, nogrid)
graph export "Results\figure_c1_population.png", as(png) name("Graph")

graph twoway (scatter lexpenditure famineseverity if birthyr <= 1958, mcolor(gs10) msize(vsmall))(scatter lexpenditure famineseverity if birthyr >= 1959 & birthyr <= 1961, mcolor(gs4) msymbol(triangle) msize(vsmall))(scatter lexpenditure famineseverity if birthyr >= 1962, mcolor(black) msymbol(square) msize(vsmall))(lfit lexpenditure famineseverity if birthyr <= 1958, lcolor(gs10) lwidth(thin))(lfit lexpenditure famineseverity if birthyr >= 1962, lcolor(black) lwidth(vthin))(lfit lexpenditure famineseverity if birthyr >= 1959 & birthyr <= 1961, lcolor(gs4) lwidth(vthin)), ytitle("Log fiscal expenditure") xtitle("Famine severity") legend(lab(1 "CPS born before famine") lab(2 "during famine") lab(3 "after famine") order(1 2 3) cols(3)) saving(expen, replace) graphregion(color(white)) bgcolor(white) ylabel(, nogrid)
graph export "Results\figure_c1_expenditure.png", as(png) name("Graph")

graph twoway (scatter lexpen_agri famineseverity if birthyr <= 1958, mcolor(gs10) msize(vsmall))(scatter lexpen_agri famineseverity if birthyr >= 1959 & birthyr <= 1961, mcolor(gs4) msymbol(triangle) msize(vsmall))(scatter lexpen_agri famineseverity if birthyr >= 1962, mcolor(black) msymbol(square) msize(vsmall))(lfit lexpen_agri famineseverity if birthyr <= 1958, lcolor(gs10) lwidth(thin))(lfit lexpen_agri famineseverity if birthyr >= 1962, lcolor(black) lwidth(vthin))(lfit lexpen_agri famineseverity if birthyr >= 1959 & birthyr <= 1961, lcolor(gs4) lwidth(vthin)), ytitle("Log agricultural expenditure") xtitle("Famine severity") legend(lab(1 "CPS born before famine") lab(2 "during famine") lab(3 "after famine") order(1 2 3) cols(3)) saving(expenagri, replace) graphregion(color(white)) bgcolor(white) ylabel(, nogrid)
graph export "Results\figure_c1_agriculturalexpenditure.png", as(png) name("Graph")

graph twoway (scatter lgdp1 famineseverity if birthyr <= 1958, mcolor(gs10) msize(vsmall))(scatter lgdp1 famineseverity if birthyr >= 1959 & birthyr <= 1961, mcolor(gs4) msymbol(triangle) msize(vsmall))(scatter lgdp1 famineseverity if birthyr >= 1962, mcolor(black) msymbol(square) msize(vsmall))(lfit lgdp1 famineseverity if birthyr <= 1958, lcolor(gs10) lwidth(thin))(lfit lgdp1 famineseverity if birthyr >= 1962, lcolor(black) lwidth(vthin))(lfit lgdp1 famineseverity if birthyr >= 1959 & birthyr <= 1961, lcolor(gs4) lwidth(vthin)), ytitle("Log GDP from agriculture") xtitle("Famine severity") legend(lab(1 "CPS born before famine") lab(2 "during famine") lab(3 "after famine") order(1 2 3) cols(3)) saving(gdp1, replace) graphregion(color(white)) bgcolor(white) ylabel(, nogrid)
graph export "Results\figure_c1_gdpfromagriculture.png", as(png) name("Graph")

graph twoway (scatter lgrain famineseverity if birthyr <= 1958, mcolor(gs10) msize(vsmall))(scatter lgrain famineseverity if birthyr >= 1959 & birthyr <= 1961, mcolor(gs4) msymbol(triangle) msize(vsmall))(scatter lgrain famineseverity if birthyr >= 1962, mcolor(black) msymbol(square) msize(vsmall))(lfit lgrain famineseverity if birthyr <= 1958, lcolor(gs10) lwidth(thin))(lfit lgrain famineseverity if birthyr >= 1962, lcolor(black) lwidth(vthin))(lfit lgrain famineseverity if birthyr >= 1959 & birthyr <= 1961, lcolor(gs4) lwidth(vthin)), ytitle("Log grain production") xtitle("Famine severity") legend(lab(1 "CPS born before famine") lab(2 "during famine") lab(3 "after famine") order(1 2 3) cols(3)) saving(grain, replace) graphregion(color(white)) bgcolor(white) ylabel(, nogrid)
graph export "Results\figure_c1_grainproduction.png", as(png) name("Graph")
