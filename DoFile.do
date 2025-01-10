log using "C:\Users\user\Desktop\aji\STATA.log", replace
use "C:\Users\user\Desktop\aji\STATA\ESS9GB.dta", clear
keep ctzcntr rlgdnm gndr polintr poltran stfdem lrscale prtvtcgb
rename ctzcntr citizenship
rename rlgdnm religion
rename gndr gender
rename polintr politics_interest
rename poltran transparency
rename stfdem democracy_satisfaction
rename lrscale self_placement
rename prtvtcgb vote_choice
drop if missing(citizenship) | missing(religion) | missing(gender) | missing(politics_interest) | missing(transparency) | missing(democracy_satisfaction) | missing(self_placement) | missing(vote_choice)
inspect
tabulate politics_interest
levelsof politics_interest
gen pol_interest_dummy = (politics_interest == 1)
label variable pol_interest_dummy "Very Interested in Politics (Dummy)"
label define pol_interest_labels 0 "Not Very Interested" 1 "Very Interested"
label values pol_interest_dummy pol_interest_labels
summarize
tabulate gender
graph bar (count), over(gender)
graph bar (count), over(pol_interest_dummy)
graph bar (count), over(politics_interest)
graph bar (count), over(citizenship)
save "C:\Users\user\Desktop\aji\STATA\new_data.dta"
histogram democracy_satisfaction
graph box religion
ttest politics_interest, by(citizenship)
tabulate religion gender, chi2
corr democracy_satisfaction self_placement
corr democracy_satisfaction transparency
corr self_placement gender
corr transparency politics_interest
corr politics_interest gender
corr gender pol_interest_dummy
log close