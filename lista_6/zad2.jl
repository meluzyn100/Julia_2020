abstract type Shape{T <: Real} end

struct Rectangle{T} <: Shape{T}
    a::T
    b::T
end

struct Triangle{T} <: Shape{T}
    a::T
    b::T
    c::T
end

struct Circle{T} <: Shape{T}
    r::T
end
area(valiue::Rectangle) = valiue.a * valiue.b
perimeter(valiu::Rectangle) = 2valiu.a+2valiu.b

function area(valiue::Triangle)
    p=1/2*(valiue.a+valiue.b+valiue.c)
    return sqrt(p*(p-valiue.a)*(p-valiue.b)*(p-valiue.c))
end
perimeter(valiue::Triangle) = +(valiue.a,valiue.b,valiue.c)

area(valiue::Circle)  = pi*valiue.r^2
perimeter(valiue::Circle) = 2pi*valiue.r

R=Rectangle{Int64}(3,4)
println("Obwód prostokątu $(area(R))")
println("Pole prostokątu $(perimeter(R))")

T=Triangle{Int64}(3,4,5)
println("Obwód trójkątu $(area(T))")
println("Pole trójkątu $(perimeter(T))")

println("Obwód koła $(area(C))")
println("Pole koła $(perimeter(C))")
