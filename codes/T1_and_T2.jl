# T1 and T2 

#= Task Overview for Chicago Booth Full-time Research Professional Application
Rossi Ramiro, 27/9
rrossi@udesa.edu.ar 
=#


include("C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/data_packages.jl")


#=
Summarize key trends in median wealth over the last 30 years by race and education using plots 
and in writing 
Here we have 3 types of debt, 4 types of race and 3 types of education
=# 
# Grouping the DataFrame by year, race and education
# We will calculate a median by year, by race, by education and by type of debt
describe(df)
g = groupby(df,[:year, :race, :education])
# HOUSING WEALTH
r1 = combine(g, :housing_wealth => median)
# median housing debt by education in white population
r1_collegedegree = subset(r1, :race => ByRow(==("white")), :education => ByRow(==("college degree")))
r1_nodegree = subset(r1, :race => ByRow(==("white")), :education => ByRow(==("no college")))
r1_somedegree = subset(r1, :race => ByRow(==("white")), :education => ByRow(==("some college")))

plot_white = plot([scatter(x=r1_college.year, 
y = r1_collegedegree.housing_wealth_median, name="College"); scatter(x=r1_college.year, 
y=r1_nodegree.housing_wealth_median, name="No college"); scatter(x=r1_college.year, 
y=r1_somedegree.housing_wealth_median, name="Some college")],
 Layout(title = "Housing wealth median for race: white",xaxis_title = "Year"));
savefig(plot_white,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/housing_debt/white.png")
# median housing debt by education black population
r1_collegedegree_black = subset(r1, :race => ByRow(==("black")), :education => ByRow(==("college degree")))
r1_nodegree_black = subset(r1, :race => ByRow(==("black")), :education => ByRow(==("no college")))
r1_somedegree_black = subset(r1, :race => ByRow(==("black")), :education => ByRow(==("some college")));
 
plot_black = plot([scatter(x=r1_college.year, 
y = r1_collegedegree_black.housing_wealth_median, name="College"); scatter(x=r1_college.year, 
y=r1_nodegree_black.housing_wealth_median, name="No college"); scatter(x=r1_college.year, 
y=r1_somedegree_black.housing_wealth_median, name="Some college")],
 Layout(title = "Housing wealth median for race: black",xaxis_title = "Year"));
 savefig(plot_black,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/housing_debt/black.png")

# median housing debt by education Hispanic
r1_collegedegree_hispanic = subset(r1, :race => ByRow(==("Hispanic")), :education => ByRow(==("college degree")))
r1_nodegree_hispanic = subset(r1, :race => ByRow(==("Hispanic")), :education => ByRow(==("no college")))
r1_somedegree_hispanic = subset(r1, :race => ByRow(==("Hispanic")), :education => ByRow(==("some college")));
 
plot_hispanic = plot([scatter(x=r1_college.year, 
y = r1_collegedegree_hispanic.housing_wealth_median, name="College"); scatter(x=r1_college.year, 
y=r1_nodegree_hispanic.housing_wealth_median, name="No college"); scatter(x=r1_college.year, 
y=r1_somedegree_hispanic.housing_wealth_median, name="Some college")],
 Layout(title = "Housing wealth median for race: hispanic",xaxis_title = "Year"))
 savefig(plot_hispanic,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/housing_debt/hispanic.png")

 # median housing debt by education Other  
r1_collegedegree_other = subset(r1, :race => ByRow(==("other")), :education => ByRow(==("college degree")))
r1_nodegree_other = subset(r1, :race => ByRow(==("other")), :education => ByRow(==("no college")))
r1_somedegree_other = subset(r1, :race => ByRow(==("other")), :education => ByRow(==("some college")));
 
plot_other = plot([scatter(x=r1_college.year, 
y = r1_collegedegree_other.housing_wealth_median, name="College"); scatter(x=r1_college.year, 
y=r1_nodegree_other.housing_wealth_median, name="No college"); scatter(x=r1_college.year, 
y=r1_somedegree_other.housing_wealth_median, name="Some college")],
 Layout(title = "Housing wealth median for race: other",xaxis_title = "Year"));

 savefig(plot_other,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/housing_debt/other.png")


####################
# non housing wealth
####################
r2 = combine(g, :non_housing_wealth => median)
# median non housing debt by education in white population
r2_collegedegree = subset(r2, :race => ByRow(==("white")), :education => ByRow(==("college degree")))
r2_nodegree = subset(r2, :race => ByRow(==("white")), :education => ByRow(==("no college")))
r2_somedegree = subset(r2, :race => ByRow(==("white")), :education => ByRow(==("some college")))

plot_white_r2 = plot([scatter(x=r1_college.year, 
y = r2_collegedegree.non_housing_wealth_median, name="College"); scatter(x=r1_college.year, 
y=r2_nodegree.non_housing_wealth_median, name="No college"); scatter(x=r1_college.year, 
y=r2_somedegree.non_housing_wealth_median, name="Some college")],
 Layout(title = " Non housing wealth median for race: white",xaxis_title = "Year"))

 savefig(plot_white_r2,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/non_housing_debt/white.png")

## median non housing debt by education in Black population
r2_collegedegree_black = subset(r2, :race => ByRow(==("black")), :education => ByRow(==("college degree")))
r2_nodegree_black = subset(r2, :race => ByRow(==("black")), :education => ByRow(==("no college")))
r2_somedegree_black = subset(r2, :race => ByRow(==("black")), :education => ByRow(==("some college")))

plot_black_r2 = plot([scatter(x=r1_college.year, 
y = r2_collegedegree_black.non_housing_wealth_median, name="College"); scatter(x=r1_college.year, 
y=r2_nodegree_black.non_housing_wealth_median, name="No college"); scatter(x=r1_college.year, 
y=r2_somedegree_black.non_housing_wealth_median, name="Some college")],
 Layout(title = " Non housing wealth median for race: black",xaxis_title = "Year"))
 savefig(plot_black_r2,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/non_housing_debt/black.png")

## median non housing debt by education in Hispanic population

r2_collegedegree_hispanic = subset(r2, :race => ByRow(==("Hispanic")), :education => ByRow(==("college degree")))
r2_nodegree_hispanic = subset(r2, :race => ByRow(==("Hispanic")), :education => ByRow(==("no college")))
r2_somedegree_hispanic = subset(r2, :race => ByRow(==("Hispanic")), :education => ByRow(==("some college")))

plot_hispanic_r2 = plot([scatter(x=r1_college.year, 
y = r2_collegedegree_hispanic.non_housing_wealth_median, name="College"); scatter(x=r1_college.year, 
y=r2_nodegree_hispanic.non_housing_wealth_median, name="No college"); scatter(x=r1_college.year, 
y=r2_somedegree_hispanic.non_housing_wealth_median, name="Some college")],
 Layout(title = " Non housing wealth median for race: hispanic",xaxis_title = "Year"))
 savefig(plot_hispanic_r2,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/non_housing_debt/hispanic.png")

## median non housing debt by education in other population
r2_collegedegree_other = subset(r2, :race => ByRow(==("other")), :education => ByRow(==("college degree")))
r2_nodegree_other = subset(r2, :race => ByRow(==("other")), :education => ByRow(==("no college")))
r2_somedegree_other = subset(r2, :race => ByRow(==("other")), :education => ByRow(==("some college")))

plot_other_r2 = plot([scatter(x=r1_college.year, 
y = r2_collegedegree_other.non_housing_wealth_median, name="College"); scatter(x=r1_college.year, 
y=r2_nodegree_other.non_housing_wealth_median, name="No college"); scatter(x=r1_college.year, 
y=r2_somedegree_other.non_housing_wealth_median, name="Some college")],
 Layout(title = " Non housing wealth median for race: other",xaxis_title = "Year"));
 savefig(plot_other_r2,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/non_housing_debt/other.png")

# total wealth
r3 = combine(g, :tot_wealth => median)
r3_collegedegree = subset(r3, :race => ByRow(==("white")), :education => ByRow(==("college degree")))
r3_nodegree = subset(r3, :race => ByRow(==("white")), :education => ByRow(==("no college")))
r3_somedegree = subset(r3, :race => ByRow(==("white")), :education => ByRow(==("some college")))

plot_white_r3 = plot([scatter(x=r1_college.year, 
y = r3_collegedegree.tot_wealth_median, name="College"); scatter(x=r1_college.year, 
y=r3_nodegree.tot_wealth_median, name="No college"); scatter(x=r1_college.year, 
y=r3_somedegree.tot_wealth_median, name="Some college")],
 Layout(title = " Total wealth median for race: white",xaxis_title = "Year"))
 savefig(plot_white_r3,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/total_debt/white.png")

# filter

tw_hp_white_college = hpfilter(r3_collegedegree.tot_wealth_median,100)
tw_hp_white_nocollege = hpfilter(r3_nodegree.tot_wealth_median,100)
tw_hp_white_somecollege = hpfilter(r3_somedegree.tot_wealth_median,100)

plot_white_r3_filter = plot([scatter(x=r1_college.year, 
y = tw_hp_white_college, name="College"); scatter(x=r1_college.year, 
y=tw_hp_white_nocollege, name="No college"); scatter(x=r1_college.year, 
y=tw_hp_white_somecollege, name="Some college")],
 Layout(title = " Total wealth median for race: white (HP filtered)",xaxis_title = "Year"))
 savefig(plot_white_r3_filter,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/total_debt/white_filter.png")

## median non housing debt by education in Black population
r3_collegedegree_black = subset(r3, :race => ByRow(==("black")), :education => ByRow(==("college degree")))
r3_nodegree_black = subset(r3, :race => ByRow(==("black")), :education => ByRow(==("no college")))
r3_somedegree_black = subset(r3, :race => ByRow(==("black")), :education => ByRow(==("some college")))

plot_black_r3 = plot([scatter(x=r1_college.year, 
y = r3_collegedegree_black.tot_wealth_median, name="College"); scatter(x=r1_college.year, 
y=r3_nodegree_black.tot_wealth_median, name="No college"); scatter(x=r1_college.year, 
y=r3_somedegree_black.tot_wealth_median, name="Some college")],
 Layout(title = " Total wealth median for race: black",xaxis_title = "Year"))
 savefig(plot_black_r3,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/total_debt/black.png")


# filter

tw_hp_black_college = hpfilter(r3_collegedegree_black.tot_wealth_median,100)
tw_hp_black_nocollege = hpfilter(r3_nodegree_black.tot_wealth_median,100)
tw_hp_black_somecollege = hpfilter(r3_somedegree_black.tot_wealth_median,100)

plot_black_r3_filter = plot([scatter(x=r1_college.year, 
y = tw_hp_black_college, name="College"); scatter(x=r1_college.year, 
y=tw_hp_black_nocollege, name="No college"); scatter(x=r1_college.year, 
y=tw_hp_black_somecollege, name="Some college")],
 Layout(title = " Total wealth median for race: black (HP filtered)",xaxis_title = "Year"))
 savefig(plot_black_r3_filter,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/total_debt/black_filter.png")


 ## median non housing debt by education in Hispanic population

r3_collegedegree_hispanic = subset(r3, :race => ByRow(==("Hispanic")), :education => ByRow(==("college degree")))
r3_nodegree_hispanic = subset(r3, :race => ByRow(==("Hispanic")), :education => ByRow(==("no college")))
r3_somedegree_hispanic = subset(r3, :race => ByRow(==("Hispanic")), :education => ByRow(==("some college")))

plot_hispanic_r3 = plot([scatter(x=r1_college.year, 
y = r3_collegedegree_hispanic.tot_wealth_median, name="College"); scatter(x=r1_college.year, 
y=r3_nodegree_hispanic.tot_wealth_median, name="No college"); scatter(x=r1_college.year, 
y=r3_somedegree_hispanic.tot_wealth_median, name="Some college")],
 Layout(title = " Total wealth median for race: hispanic",xaxis_title = "Year"))
 savefig(plot_hispanic_r3,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/total_debt/hispanic.png")

# filter 
tw_hp_hispanic_college = hpfilter(r3_collegedegree_hispanic.tot_wealth_median,100)
tw_hp_hispanic_nocollege = hpfilter(r3_nodegree_hispanic.tot_wealth_median,100)
tw_hp_hispanic_somecollege = hpfilter(r3_somedegree_hispanic.tot_wealth_median,100)

plot_hispanic_r3_filter = plot([scatter(x=r1_college.year, 
y = tw_hp_hispanic_college, name="College"); scatter(x=r1_college.year, 
y=tw_hp_hispanic_nocollege, name="No college"); scatter(x=r1_college.year, 
y=tw_hp_hispanic_somecollege, name="Some college")],
 Layout(title = " Total wealth median for race: hispanic (HP filtered)",xaxis_title = "Year"));
 savefig(plot_hispanic_r3_filter,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/total_debt/hispanic_filter.png")
 
## median non housing debt by education in other population
r3_collegedegree_other = subset(r3, :race => ByRow(==("other")), :education => ByRow(==("college degree")))
r3_nodegree_other = subset(r3, :race => ByRow(==("other")), :education => ByRow(==("no college")))
r3_somedegree_other = subset(r3, :race => ByRow(==("other")), :education => ByRow(==("some college")))

plot_other_r3 = plot([scatter(x=r1_college.year, 
y = r3_collegedegree_other.tot_wealth_median, name="College"); scatter(x=r1_college.year, 
y=r3_nodegree_other.tot_wealth_median, name="No college"); scatter(x=r1_college.year, 
y=r3_somedegree_other.tot_wealth_median, name="Some college")],
 Layout(title = " Total wealth median for race: other",xaxis_title = "Year"))
 savefig(plot_other_r3,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/total_debt/other.png")

 tw_hp_other_college = hpfilter(r3_collegedegree_other.tot_wealth_median,100)
 tw_hp_other_nocollege = hpfilter(r3_nodegree_other.tot_wealth_median,100)
 tw_hp_other_somecollege = hpfilter(r3_somedegree_other.tot_wealth_median,100)
 
 plot_other_r3_filter = plot([scatter(x=r1_college.year, 
 y = tw_hp_other_college, name="College"); scatter(x=r1_college.year, 
 y=tw_hp_other_nocollege, name="No college"); scatter(x=r1_college.year, 
 y=tw_hp_other_somecollege, name="Some college")],
  Layout(title = " Total wealth median for race: other (HP filtered)",xaxis_title = "Year"))
  savefig(plot_other_r3_filter,"C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/plots/total_debt/other_filter.png")
 



