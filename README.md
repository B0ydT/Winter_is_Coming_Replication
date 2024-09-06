## Scripts for *A comment on* Winter is Coming: Early-Life Experiences and Politicans’ Decisions

<!-- badges: start -->
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](LICENSE.md)
[![DOI](https://zenodo.org/badge/811350653.svg)](https://zenodo.org/doi/10.5281/zenodo.13710455)
<!-- badges: end -->

### Authors: Farida Akhtar, David Kreitmeir, Luke Newman, Florian Ploeckl, Boyd Tarlinton

This repository includes scripts used in our reproducibility analysis of *Winter 
is Coming: Early-Life Experiences and Politicians’ Decisions* by Guo et al. 
(2023a) and contains code and data from the replication package (Guo et al., 
2023b).

There are two Stata Do-files with replication scripts. The file "Robustness Replication - Replication Code" contains the code for the results of our robustness replication described in the report. The file utilizes the data file "Data for Replication.dta", which has been directly taken from the replication package Guo et al. (2023b) without any modification.  The file "Codes for Replication - p-values.do" is the original replication code file of Guo et al. (2023b) for the main results of the paper, including Table 2. The code for table 2 has been modified to display p-values rather than standard errors for comparison purposes, otherwise no changes have been made to the estimation code. Both replication code files have modified pathways for the location of the data set file as well as the folder for results. 

An R replication script is provided for the recreate reproducibility section.
The packages used during this replication can be installed by running 
`renv::restore()` after loading the project. The Data folder from the original 
replication resources must be placed in the working directory prior to running 
the script.

### Citations

Guo, S., Gao, N. and Liang, P.: 2023a, Winter is Coming: Early-life Experiences
and Politicians’ Decisions, The Economic Journal 134(657), 295–321.
URL: https://doi.org/10.1093/ej/uead061

Guo, S., Gao, N. and Liang, P.: 2023b, Replication package for "Winter is Coming: 
Early-life Experiences and Politicians' Decisions", Zenodo. doi: 
10.5281/zenodo.8188982.
