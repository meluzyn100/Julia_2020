macro switch(x,y)
    return quote
        $y
        $x
    end
end
macro switch(x)
    return x
end
macro switch(x,y,z...)
    throw(error("Za while argumentów"))
end
@switch println(1) 1 2 3
