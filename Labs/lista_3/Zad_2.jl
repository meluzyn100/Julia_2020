using Plots

function W(x)
    w=[1/(2^k)*cos(3^k*pi*x) for k = 0:40]
    w=sum(w,dims = 1)
    return w[1]
end

x=-2:0.01:2

plot(x -> W.(x),-2,2,
    title = "Funkcja Weierstrassa",
    legend = :none,
    framestyle = :origin,
)
lens!([-1.9, 1.9],[-2, 2],
    framestyle = :box,
    inset = (1, bbox(0.15,0,0.25,0.2)),
    )
 
plot!() |> display

