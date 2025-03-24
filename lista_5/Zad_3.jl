function f(T::Type)
    super_list::Array{Type,1}=[T]
    while true
        parent = supertype(T)
        push!(super_list,parent)
        #Jesli dojdziemy do Any pentla sie kaczy
        if parent == Any
            break
        end
        T = parent
    end
    return super_list
end

f(Array{Int,2}) |> display
