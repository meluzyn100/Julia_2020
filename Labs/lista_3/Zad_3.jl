using Plots

function r(x)
    r =  exp(sin(x)) - 2*cos(4*x) + (sin((2*x-pi)/24))^5
    return r
end

xs = LinRange(0,12*pi,350)
ys = r.(xs)
function BF()
    plot([xs],[ys],
        proj = :polar,
        color = :red,
        linewidth = 2,
        legend = :none,
        title = "Butterfly")
        display(plot())
end

function AnimeBF()
    plot(legend = :none,
    title = "Butterfly")

    a = @animate for i in 1:349
    plot!([xs[i:i+1]],[ys[i:i+1]],
    proj = :polar,
    color = :red,
    linewidth = 2
    )
    end
    gif(a,"animacja.gif",fps = 30)
end

BF()
AnimeBF()
