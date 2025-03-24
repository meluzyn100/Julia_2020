using Plots

literary_array = zeros(1000,255)
r=LinRange(2.5,4,1000)

function mein(x0)
    literary_array[:,1].=x0
    for i in 1:254
        literary_array[:,i+1] .= r.*literary_array[:,i].*((-1).*literary_array[:,i].+1)
    end
end


plot(label= "")
for xo in 0:0.1:1
    mein(x0)
    plot!(r,literary_array[:,235:255],linestyle = :dot,label = "" , linecolor = :black)
end
plot!(title= "Wykres bifurkacyjny")|> display
