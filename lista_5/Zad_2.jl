function f(T)
    n=1
    for i in subtypes(T)
        n += f(i)
    end
    
    return n
end

function countSubtypes(T::Type)
    return f(T::Type)
end

countSubtypes(Number) |> display
