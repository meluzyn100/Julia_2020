using Plots
using LaTeXStrings


struct QPoly
    a::Number
    b::Number
    c::Number
end

(q::QPoly)(x::Number) = q.a*x^2 + q.b*x + q.c

delta(q::QPoly) = q.b^2 - 4*q.a*q.c
 #uwaga na pierwiastki
roots(q::QPoly) = delta(q) < 0 ? nothing      :
                  delta(q) == 0 ? (-q.b/(2*q.a),-q.b/(2*q.a)) :
                  ( (-q.b-sqrt(delta(q)))/(2*q.a), (-q.b+sqrt(delta(q)))/(2*q.a))
complexRoots(q::QPoly) = delta(q) < 0 ? ((-q.b-sqrt(complex(delta(q))))/(2*q.a),(-q.b+sqrt(complex(delta(q))))/(2*q.a)) : roots(q)

Base.min(q::QPoly) = q.a>0 ? q(-q.b/(2*q.a)) : -Inf
Base.max(q::QPoly) = q.a<0 ? q(-q.b/(2*q.a)) : Inf

Base.show(io::IO,q::QPoly) = print(io,"$(q.a)x²+$(q.b)x+$(q.c)")

Plots.plot(x1::Real,x2::Real,q::QPoly) = plot(x->q(x),x1,x2,title="Wykres wielomianu $(q)")

n = QPoly(1,0,-1)

plot(-10,10,n)

bs = LinRange(-1,2,100)
tablica = [QPoly(1,i,-1) for i in bs]

min_list = [min.(tablica)]
plot(title="Funkcje Kwadratowe")
plot!(bs,min_list,label="Min")

delta_list=[delta.(tablica)]
plot!(bs,delta_list,label=L"\Delta")

pierwiastki = [x[i] for x in roots.(tablica), i in 1:2]
plot!(bs,pierwiastki,label=[L"x_1" L"x_2"])

plot!()|>display
