using Plots

function f(x)
    return x.^2
end

function s(x)
    return x+sin(x)
end
function s2(x)
    return x+sin(x)*2
end

function invers(f,y,dx) #funkcja odwrotna
    x=0
    while f.(x) <= y
        x+=dx
    end
    return x-dx
end


function odp(functions,values,dx)
    lista=[]
    for i in 1:size(ys)[1]
        a = invers(functions,values[i],dx)
        push!(lista,a)
    end
    plot(ys,lista,
    label = "Inverse")
    plot!(ys,ys,
    label = "Os symetri")
    plot!(ys,functions.(ys),
    title = "Wykres funkcji i funkcji do niej odwrotnej ",
    label = "Function" )

end



ys = LinRange(0,6,1000) #
dx=10^(-3)
##f(x)=x^2
odp(f,ys,dx)
##f(x)=x+sin(x)
odp(s,ys,dx)
##f(x)=x+2sin(x)
odp(s2,ys,dx)
#funkcja odwrotna w niektoruch x przyjmuje 2 warttosci przez co nie moze byc ona przedstawiona dokładnie
