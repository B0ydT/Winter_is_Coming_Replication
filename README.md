## Scripts for *A comment on* Winter is Coming: Early-Life Experiences and Politicans’ Decisions

### Authors: Farida Akhtar, David Kreitmeir, Luke Newman, Florian Ploeckl, Boyd Tarlinton

This repository includes scripts used in our reproducibility analysis of *Winter 
is Coming: Early-Life Experiences and Politicians’ Decisions* by Guo et al. 
(2023a) and contains code and data from the replication package (Guo et al., 
2023b).

Two Stata replication packages / zipped folders are provided. "Stata 
Computational Replication" is the original replication package provided by the 
paper authors used to conduct the direct replication of the results reported in 
the paper. The only modification was the path used to load the data. "Stata 
Robustness Replication" is the original replication package with the added 
script "Robustness Replication - Codes for Replication.do". This script 
contains the code used to conduct the robustness replications described in the 
report. The script makes use of the data files provided in the original 
replication package. The Robustness Replication script is also directly 
provided and can be used in conjunction with the data files provided in 
the replication package by the original authors.

An R replication script is provided for the recreate reproducibility section.
The packages used during this replication can be installed by running 
`renv::restore()` after loading the project. The Data folder from the original 
replication resources must be placed in the working directory prior to running 
the script.

### Citations:

Guo, S., Gao, N. and Liang, P.: 2023a, Winter is Coming: Early-life Experiences
and Politicians’ Decisions, The Economic Journal 134(657), 295–321.
URL: https://doi.org/10.1093/ej/uead061

Guo, S., Gao, N. and Liang, P.: 2023b, Replication package for "Winter is Coming: 
Early-life Experiences and Politicians' Decisions", Zenodo. doi: 
10.5281/zenodo.8188982.
