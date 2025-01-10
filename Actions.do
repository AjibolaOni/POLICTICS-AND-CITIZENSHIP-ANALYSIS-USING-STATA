use "C:/Users/user/Desktop/aji/STATA NEW/BES_2019.dta", clear
describe
summarize h01
summarize
tabulate h01, missing
drop if missing(h01)
tabulate y09
tabulate n03, summarize(h01)
regress h01 n03
gen gender_recoded = .
replace gender_recoded = 1 if y09 == 1
tabulate gender_recoded
tabulate y09
replace gender_recoded = 2 if y09 == 2
tabulate gender_recoded
tabulate gender_recoded, summarize(h01)
ttest h01, by(gender_recoded)
tabulate Y01_detailed, summarize(h01)
spearman h01 Y01_detailed
gen income_interest_interaction = Y01_detailed * k01
regress h01 Y01_detailed k01 income_interest_interaction