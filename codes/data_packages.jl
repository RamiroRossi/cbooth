# Import data and packages 
using CSV, DataFrames, PlotlyJS, Pkg, TypedTables, Statistics

df = CSV.read("C:/Users/rross/OneDrive/Documentos/julia/open_macro/Codigo-julia/chicago_project/RA_21_22.csv",DataFrame)


# Defininf relevant variables

df.housing_wealth = df.asset_housing .- df.debt_housing;
# Non housing weath = non housing assets - non housing debt
df.non_housing_wealth = (df.asset_total .- df.asset_housing) .- (df.debt_total .- df.debt_housing);
# Total wealth = total assets - total debt 
df.tot_wealth = df.asset_total .- df.debt_total;

function hpfilter(y, w)
    t = size(y)[1]
    Q = zeros(t, t+2)
    H = zeros(t, t+2)
    for i in 1:t
            global
            Q[i, i] = 1
            Q[i, i+1] = -2
            Q[i, i+2] = 1
            H[i,i] = 1
    end
    output = (H'H + w * Q'Q)^(-1)*H'y
    output[1:t]
end

