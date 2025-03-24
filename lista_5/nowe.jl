function f(T::Type)
    n=0 #licznik subtypow
    types = copy(subtypes(T))
    n+=size(types,1)#dodaje poczatkowa subtypow

    while true
        control = n#dzieki temu sprawdzam kiedy pentla ma sie skaczyc
        list::Array{Type,1} =[]#lista do ktorej bede wprowadzac znalezione subtypty
        #pentla dzieki kttorej dostaje liste "dzieci" z wczesniej podanej listy "rodzicow"
        for i in types
            for k in subtypes(i)
                    n+=1
                    push!(list,k)
            end
        end
        types = list #teraz lista "dzieci" bedzie traktowana jako lista "rodzicow"

        if control - n == 0#jesl liczbe subtypow sie nie zmienia pentla while sie kaczy
            break
        end
    end

    return n
end

f(Number) |> display

#Wersja 2
