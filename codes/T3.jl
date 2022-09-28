### Task 3 
# filter the dataframe > 25 
# group by race 

# DB
include("C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/data_packages.jl")
include("C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/Hodrick-Prescott-filter-with-Julia-master/Hodrick-Prescott-filter-with-Julia-master/hpfilter.jl")
# filter age > 25 
g_age = subset(df, :age => ByRow(>(25)))
# group by race
g = groupby(g_age,[:year, :race])
g_white = subset(g, :race => ByRow(==("white")))
g_white = groupby(g_white,[:year])
g_black = subset(g, :race => ByRow(==("black")))
g_black = groupby(g_black,[:year])
# HOUSING WEALTH 
results_white = combine(g_white, :housing_wealth => median)
results_black = combine(g_black, :housing_wealth => median)
hw_hp_white = hpfilter(results_white.housing_wealth_median,100)
hw_hp_black = hpfilter(results_black.housing_wealth_median,100)

plot_t3_a= plot([scatter(x=results_white.year, 
y = results_white.housing_wealth_median, name="White"); scatter(x=results_black.year, 
y=results_black.housing_wealth_median, name="Black")],
 Layout(title = "Trend for median housing wealth by race ",xaxis_title = "Year"))


plot_tr_a_filter = plot([scatter(x=results_white.year, 
y = hw_hp_white, name="White"); scatter(x=results_black.year, 
y=hw_hp_black, name="Black")],
 Layout(title = "Trend for median housing wealth by race (HP - Filtered)",xaxis_title = "Year"))

# NON HOUSING WEALTH
results_white = combine(g_white, :non_housing_wealth => median)
results_black = combine(g_black, :non_housing_wealth => median)

plot_t3_b= plot([scatter(x=results_white.year, 
y = results_white.non_housing_wealth_median, name="White"); scatter(x=results_black.year, 
y=results_black.non_housing_wealth_median, name="Black")],
 Layout(title = "Trend for median housing wealth by race ",xaxis_title = "Year"))

hw_hp_white = hpfilter(results_white.non_housing_wealth_median,100)
hw_hp_black = hpfilter(results_black.non_housing_wealth_median,100)

plot_t3_filter= plot([scatter(x=results_white.year, 
y = hw_hp_white, name="White"); scatter(x=results_black.year, 
y=hw_hp_black, name="Black")],
 Layout(title = "Trend for median non-housing wealth by race (HP filtered)",xaxis_title = "Year"))

### Greatest losses in housing wealth
names(results_white)
white_2007 = subset(results_white, :year => ByRow(==(2007)))
white_2007.housing_wealth_median
white_2016 = subset(results_white, :year => ByRow(==(2016)))
#White
# USD
white_2016.housing_wealth_median - white_2007.housing_wealth_median
# percent 
(white_2016.housing_wealth_median - white_2007.housing_wealth_median)/white_2007.housing_wealth_median * 100
# Black
black_2007 = subset(results_black, :year => ByRow(==(2007)))
black_2007.housing_wealth_median
black_2016 = subset(results_black, :year => ByRow(==(2016)))





