afunction series(q::Real,n::Int)
    x=(q^x for x in 1:n)
    for i in x
        println(i)
    end
end

function c_vector(q::Real,n::Int)
    list = []
    append!(list,q^x for x=0:n)
    return list
end
##a
    println("A")
    x=c_vector(0.5,10)
    println(sum(x))#suma
    println(cumsum(x))#suma czesciowa

##b
println("B")

function series2(g::Real,n::Int)#suma czescioxwa bez potengowania
    result = cumsum(cumprod(fill(g,n)))
    return result
end
println(series2(0.5,10))

##c
println("C.cz.1")

#cz.1
function literator(q::Real,k::Int)
    a=(q^x  for x in 0:k if x%2==0 || x%5==0)
    return a
end

a=literator(0.5,10)
for i in a
    println(i)
end
println("C.cz.2")

#cz.2
function literator(q::Real,k::Int)
    b=(q^x  for x in 0:k if ((x%2==0 && x%5 !=0 ) || (x%2!=0 && x%5==0)))
    return b

end

b=literator(0.5,10)
for i in b
    println(i)
end
##cz.2 zad
println("Cz.2 zadania")

function help(x,y)
    x\(y+1)
end
function chain(q::Real,n::Int)

    w=reduce(help,reverse(c_vector(q,n)))
    return w
end
println(chain(0.5,3))
