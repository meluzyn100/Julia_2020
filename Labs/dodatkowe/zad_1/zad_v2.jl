using Plots

function f(z, root, n)#x: liczba zespolona, root: stopień pierwiastka np. dla √ root =2, n: ilość pierwiastków jakie chcemy znaleść
    #np. f(1+im,3,2) to podanie 2 pierwiastków (1+im)^(1/3)
    if typeof(z) != Complex{Int64}
        error(display("$z nie jest typu Complex"))
    end
    #aby obliczycz pierwiastki licz zespolonych skozysam ze wzoru (a+bi)^(n)=re^(im*θ)
    #gdzie r=|z|ⁿ, θ=(Arg(z)+2kπ)/n), k∈N
    r = abs(z)^(1/root)
    alpha = angle(z)

    if n <= root#każda liczba zespolona ma n-równych pierwiastków gdzie n-stopień pierwiastka
        valiu =map(k -> r*exp(im*(alpha+2*k*pi)/root), collect(1:n))
    else
        valiu =map(k -> r*exp(im*(alpha+2*k*pi)/root), collect(1:root))
    end

    plot(framestyle = :origin,
        xlim = (-r-1,r+1),
        ylim = (-r-1,r+1),
        xlab = "Re(z)",
        ylab = "Im(z)",
        aspect_ratio = :equal,
        legend = :none,
        title = "Pierwiastki ($z)^(1/$root)"
        )


    controller = div(root,8)+1 #jest to potrzebne aby automatycznie regulować ilość wyświetlanych etykiet
    #dla root ∈(1:8) wyswietla się wszystkie etykiety, dla root ∈(8,16) wyświetli się co druga, ...
    #jeśli chcemy gęstrzego/rzadszego występowania etykiet wystarczy zmienic "8" na inną liczbę
    list = 1:controller:n

    a =@animate for i in 1:length(valiu)
        x = real(valiu[i])
        y = imag(valiu[i])
        scatter!([x],[y])

        if i <= root && in(i,list)
            plot!(annotations = (x,y,string("\n z$i=",round(valiu[i],digits=2))))
            #zaokronglam wyświetlane etykiete do 2 miejsc po porzecinku aby nie zajmowały zbyt wiele miejsca
        end
    end

    gif(a,"animacja.gif",fps = 5)
    return valiu
end

v=f(-27+0im,150,150)
display(v)
