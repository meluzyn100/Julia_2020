using Plots
ys = LinRange(-10,10,1000)
xs = LinRange(-10,10,1000)
zs = @. log(xs + ys'*im)

function filtr()
    XS=[]
    for i in 1:length(xs)
        if ((round(xs[i],digits = 1) == 0) && (ys[i]<0))
            append!(XS,NaN)
        else
            append!(XS,xs[i])
        end
    end
    return XS
end
XS = filtr()#wstawiam NaN dal x bardzo bliskich 0


p1 = surface(xs,ys,real.(zs),title = "Wykres powierzchniowe \n czesci rzeczywistej")
p2 = contourf(xs,ys,real.(zs),title = "Wykres konturowy \n czesci rzeczywistej")
p3 = surface(XS,ys,imag.(zs),title = "Wykres powierzchniowe \n czesci urojonej")
p4 = contourf(xs,ys,imag.(zs),title = "Wykres konturowy \n czesci urojonej")

plot(p1, p2, p3, p4, layout = (2, 2), legend = false,
    xlabel = "x",
    ylabel = "y",
    zlabel = "z",)
