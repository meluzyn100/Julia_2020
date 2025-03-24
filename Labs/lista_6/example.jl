using Plots

# Typ opisujący wielomian 2-go stopnia
struct QPoly
    a::Number
    b::Number
    c::Number
end

# wartość w x
(q::QPoly)(x::Number) = q.a * x^2 + q.b * x + q.c

# delta
delta(q::QPoly) = q.b^2 - 4*q.a*q.c

# pierwiastki rzeczywiste
function roots(q::QPoly)
    d = delta(q::QPoly)
    if d < 0
        return nothing
    elseif d == 0
        return (-q.b/2*q.a)
    else
        return ((-q.b - sqrt(d)) / 2q.a), ((-q.b + sqrt(d)) / 2q.a)
    end
end

# pierwiastki zespolone
function complexRoots(q::QPoly)
    d = delta(q::QPoly)
    if d < 0
        return ((-q.b - sqrt(abs(d))*im) / 2q.a), ((-q.b + sqrt(abs(d))*im) / 2q.a)
    end
end

# minium funkcji
function Base.min(q::QPoly)
    d = delta(q::QPoly)
    if  q.a > 0
        return (-d/4q.a)
    else
        return -Inf
    end
end

# maksimum funkcji
function Base.max(q::QPoly)
    d = delta(q::QPoly)
    if  q.a < 0
        return (-d/4q.a)
    else
        return Inf
    end
end

# wyświetla funkcję
Base.show(io::IO,q::QPoly) = print(io, "f(x) = $(q.a)x^2 + $(q.b)x + $(q.c)")

# tworzy wykres
Plots.plot(x1::Real,x2::Real,q::QPoly) = plot(x->q.a*x^2 + q.b*x + q.c, x1, x2)

# Tablica wielominów
bx = LinRange(-1,2,100)
polynomials = [QPoly(1, b, -1) for b in bx] # lista wielomianów

# minima, delty i pierwiastki dla naszych wielomianów
polynomials_min = min.(polynomials)
polynomials_delta = delta.(popolynomials_minlynomials)
polynomials_roots = [x[i] for x in roots.(polynomials), i in 1:2]

# wykresy
plot()
plot!(bx, polynomials_min, title="Minima jako funkcja b")
plot!(bx, polynomials_delta, title="Delty jako funkcja b")
plot!(bx, polynomials_roots, title="Pierwiastki jako funkcja b") |> display
