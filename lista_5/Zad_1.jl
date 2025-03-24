function siblingList(T::Type)
    Parent = supertype(T)
    Children::Array{Type,1} = subtypes(Parent)
    return Children
end

siblingList(Union) |> print
