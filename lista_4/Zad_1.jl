using JLD2

function Metoda_Brounckera(x)
    global n = copy(x)
    global w = 2
    while n >= 0
         w = (2*n+1)^2/(2+w)
         n -= 1
    end

    valiu = 4/(1+w)
    println("przyblizenie wynosi ",abs(pi-valiu))
    @save "pi.jld" valiu
    return valiu
end

Metoda_Brounckera(1000000) |> display
@load "pi.jld" valiu
println("Wczytana wartosc pi ",valiu)
