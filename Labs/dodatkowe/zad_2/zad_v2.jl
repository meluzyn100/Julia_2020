using Plots
# import Base.Cartesian.lreplace
my_cg = ColorGradient(:thermal)

function df_x(xo,yo,f::Function,dx)
    """Funkcja oblicza ∂f/∂x"""
    return (f(xo+dx,yo)-f(xo,yo))/(dx)
end

function df_y(xo,yo,f::Function,dy)
    """Funkcja oblicza ∂f/∂y"""
    return (f(xo,yo+dy)-f(xo,yo))/(dy)
end

function tangent_expr(xo,yo,f::Function,h,X,Y)
    """Funkcja oblicz wartość płaszczyzny stycznej w punkcie (X,Y)"""
    z = df_x(xo,yo,f,h)*(X-xo)+df_y(xo,yo,f,h)*(Y-yo)+f(xo,yo)
    return z
end

function main(f,r,So::Tuple,XoYo::Tuple=(NaN,NaN),dx=NaN)
    """
    Główna funkcja
    f- funkcja, która chcemy narysowac
    r- promień obszaru
    Sₒ- punkt środka okręgu
    XₒYₒ-punkt dla ktorego szukamy płaszczyzny
    dx- przyjmowane "h" w brzozę na pochodna

    Nie podanie 2 ostatnich argumentów
    wyrysuje sam wykres funkcji bez stycznej.
    """
    if sqrt((XoYo[1]-So[1])^2+(XoYo[2]-So[2])^2)>r
        #Sprawdzanie czy punk (x₀,y₀) ∈ D
        throw(error("Punkt poza dziedziną"))
    end

    xs = collect(range(-r,r,length=300))
    ys = collect(range(-r,r,length=300))

    function foo(x,y)
        """Funkcja zwraca pary (x,y) ∈ D """
        if sqrt((x-So[1])^2+(y-So[2])^2)<=r
            return f(x,y)
        else
            return NaN
        end
    end

    function tangent(a,b)
        return tangent_expr(XoYo[1],XoYo[2],f,dx,a,b)
    end

    function foo2(x,y)
        """Funkcja zwraca pary (x,y) ∈ D tym razem dla plaszczyzny"""
        if sqrt((x-So[1])^2+(y-So[2])^2)<=r
            return tangent(x,y)
        else
            return NaN
        end
    end
    if df_y(XoYo[1],XoYo[2],f,dx)>0
        surface(xs, ys, foo2, c = my_cg, colorbar_entry=false,xlims = (So[1]-r, So[1]+r))
        surface!(xs, ys, foo, c = my_cg, colorbar_entry=false,xlims = (So[1]-r, So[1]+r))
    else
        surface(xs, ys, foo, c = my_cg, colorbar_entry=false)
        surface!(xs, ys, foo2, c = my_cg, colorbar_entry=false)
    end
    plot!([XoYo[1]], [XoYo[2]], [foo(XoYo[1],XoYo[2])],
          markershape = :o, markersize = 3, markercolor = :red,
          label = false, xlabel = "x", ylabel = "y", zlabel = "z",
          title = "Funkcja i styczna",xlims = (So[1]-r, So[1]+r),
          ylims = (So[2]-r, So[2]+r))|>display

end
##########Druga metoda dla funkcji glownej
function main(f,AB::Array,CD::Array, XoYo::Tuple=(NaN,NaN),dx=NaN)
    """
    Główna funkcja
    f- funkcja, która chcemy narysowac
    AB- [A,B]
    CD- [C,D] Zbiory wchodzące w skład iloczynu kartezjańskiego
    XₒYₒ- punkt, dla którego szukamy płaszczyzny
    dx- przyjmowane "h" we wzorze na pochodną

    Nie podanie 2 ostatnich argumentów
    wyrysuje sam wykres funkcji.
    """
    if XoYo[1]<AB[1] || XoYo[1]>AB[2] || XoYo[2]<CD[1] || XoYo[2]>CD[2]
        #Sprawdzanie czy punk (x₀,y₀) ∈ D
        throw(error("Punkt poza dziedziną"))
    end

    xs = collect(range(AB[1], AB[2], length=300))
    ys = collect(range(CD[1], CD[2], length=300))

    function foo(x,y)
        if XoYo[1]<AB[1] || XoYo[1]>AB[2] || XoYo[2]<CD[1] || XoYo[2]>CD[2]
            return NaN
        else
            return f(x,y)
        end
    end

    function tangent(a,b)
        return tangent_expr(XoYo[1],XoYo[2],f,dx,a,b)
    end

    function foo2(x,y)
        if XoYo[1]<AB[1] || XoYo[1]>AB[2] || XoYo[2]<CD[1] || XoYo[2]>CD[2]
            return NaN
        else#Jesli płaszczyzna styzcna nie przesunela sie nalezy wywołac wzor jeszcze raz
            return tangent(x,y)
        end
    end

    if df_y(XoYo[1],XoYo[2],f,dx)>0
        surface(xs, ys, foo2, c=my_cg, colorbar_entry=false)
        surface!(xs, ys, foo, c=my_cg, colorbar_entry=false)
    else
        surface(xs, ys,foo, c = my_cg,colorbar_entry=false)
        surface!(xs, ys,foo2, c = my_cg, colorbar_entry=false)
    end
    plot!([XoYo[1]],[XoYo[2]],[foo(XoYo[1],XoYo[2])],
          markershape = :o, markersize = 3, markercolor = :red,
          label=false,xlabel = "x", ylabel = "y", zlabel = "z",
          title="Funkcja i styczna")|>display
end


function main(flag::Symbol,a,b,c,d=(NaN,NaN),e=NaN)
    """
    Dodanie flagi :c dla okręgu,
    oraz  :re dla prostokąta
    """
    if flag == :c
        return main(a,b,c::Tuple,d::Tuple,e)
    elseif flag == :re
        return main(a,b::Array,c::Array, d::Tuple,e)
    else
        throw(error("Błedne argumenty"))
    end

end

#Program nie potrzebuje flag by zadzialala
#main(:c,f,r,(Ox,Oy),(xₒ,yₒ),h)
#main(:re,f,[A,B],[C,D],(xₒ,yₒ),h)

f(x,y)=x^2+y^2
main(:c,f,20,(1,-1),(-5,2),0.01)
main(:re,f,[-2,4],[-3,2],(1,-1),0.01)
