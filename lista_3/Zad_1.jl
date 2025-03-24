using Plots

function f(x)#funkcjia tangens
    check = 0
    for k in -20:20
        if (x > -pi/2+k*pi+0.0001) && (x < pi/2+k*pi-0.0001)
            return tan(x)
            break
        end
    end
    return NaN #Jesli x nie nalezy do dziedziny tan(x) to zwraca NaN
end

function main()
    x=LinRange(-5/2*pi,5/2*pi,100000)
    plot(x,f.(x),
        framestyle = :origin,
        ylims = (-10,10),
        yticks = [i for i =-10:10],
        xticks = ([-5/2*pi+k*pi/2 for k =0:11],["$(i-5)\\pi/2" for i=0:11]),
        title = "Wykres funkcji tangens",
        label =  "tan(x)"
        )
end

main()
