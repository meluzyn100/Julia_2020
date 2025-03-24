using Plots
my_cg = ColorGradient(:thermal, alpha=0.6)

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

    wyrysuje sam wykres funkcji bez stycznej.
    Nie podanie 2 ostatnich argumentów
    """
    pyplot()

    if sqrt((XoYo[1]-So[1])^2+(XoYo[2]-So[2])^2)>r
        #Sprawdzanie czy punk (x₀,y₀) ∈ D
        throw(error("Punkt poza dziedziną"))
    end
    #Przygotowywanie danych
    theta=range(0,stop=2*pi,length=80)
    r=range(0,stop=r,length=80)
    T=repeat(theta',80)
    R=repeat(r,1,80)
    xs=R.*cos.(T).+So[1]
    ys= R.*sin.(T).+So[2]
    zs=f.(xs,ys)

    function tangent(a,b)
        return tangent_expr(XoYo[1],XoYo[2],f,dx,a,b)
    end

    zsS=tangent.(xs,ys)

    if df_y(XoYo[1],XoYo[2],f,dx)>0
        surface(xs, ys, zsS,c=my_cg, colorbar_entry=false)
        surface!(xs, ys, zs,c=my_cg, colorbar_entry=false)
    else
        surface(xs, ys, zs,c=my_cg, colorbar_entry=false)
        surface!(xs, ys, zsS,c=my_cg, colorbar_entry=false)
    end
    scatter!([XoYo[1]], [XoYo[2]], [f(XoYo[1],XoYo[2])],
          markersize = 4, markercolor = :red,
          label = false, xlabel = "x", ylabel = "y", zlabel = "z",
          title = "Funkcja i styczna",alpha=1)
    @show plot!()
end
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
    pyplot()

    if XoYo[1]<AB[1] || XoYo[1]>AB[2] || XoYo[2]<CD[1] || XoYo[2]>CD[2]
        #Sprawdzanie czy punk (x₀,y₀) ∈ D
        throw(error("Punkt poza dziedziną"))
    end

    xs = collect(range(AB[1], AB[2], length=100))
    ys = collect(range(CD[1], CD[2], length=100))


    function tangent(a,b)
        return tangent_expr(XoYo[1],XoYo[2],f,dx,a,b)
    end

    if df_y(XoYo[1],XoYo[2],f,dx)>0
        surface(xs, ys, tangent, c=my_cg, colorbar_entry=false)
        surface!(xs, ys, f, c=my_cg, colorbar_entry=false)
    else
        surface(xs, ys,f, c = my_cg,colorbar_entry=false)
        surface!(xs, ys,tangent, c = my_cg, colorbar_entry=false)
    end
    scatter!([XoYo[1]],[XoYo[2]],[f(XoYo[1],XoYo[2])],
          markersize = 4, markercolor = :red, markeralpha = 1,
          label = false,xlabel = "x", ylabel = "y", zlabel = "z",
          title = "Funkcja i styczna")

    @show plot!()
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

#main(:c,f,r,(Ox,Oy),(xₒ,yₒ),h)
#main(:re,f,[A,B],[C,D],(xₒ,yₒ),h)

##Przykłady:
f(x,y)=x^2+y^2
# main(:c,f,10,(1,3),(-3,3),0.01)
main(:re,f,[1,4],[-4,3],(3,-3),0.01)
