
using Plots

function f(x)
    if x < 0
        return 1
    elseif ((x > 0) && (x < 1))
        return 2*x
    elseif ((x == 0) || (x == 1))
        return NaN
    else
        return x^2
    end
end

args = -2:0.001:2
plot(args,f.(args),
    linecolor = :black,
    title = "functi",
    label = "f(x)",
    xlabel = "x",
    ylabel = "y")

plot!()|>display
