function commonSupertype(T1::Type,T2::Type)
    T1_backup = T1
    T2_backup = T2
    #pentla sprawdzajaca
    while !(T1 <: T2)
        T1 = supertype(T1)
        #kesli dojdziemy do Any znaczy ze pentla bedzie nieskaczona
        #ponizny warunek resetuje pentle i zmienia sprawdzany nadtyp
        if T1 == Any
            T1 = T1_backup
            T2 = supertype(T2)
        end
    end
    #jesli uzyskany nadtyp jest jednym z typow wejsciowych wtedy zwraca jeden z nich
    if T2 in [T2_backup, T1_backup]
        type = T2 == T1_backup ? T1_backup : T2_backup
        return type
    #jesli nie jest on typew wejsciowym po prostu go zwracam
    else
        return T2
    end
end


function commonSupertype(Ts::Type...)
    if length(Ts) == 0
        error(return("Nie podano argumentu"))

    elseif length(Ts) == 1
        return supertype(Ts[1])

    else
        x = commonSupertype(Ts[1], Ts[2])
        #pentla konczy sie kidy znajdzie sie nadtyp dla wszystkich wartosci Ts
        while !all(i -> i <: x, Ts)
            x = supertype(x)#x jest sprawdzanym nadtypem
        end
        return x
    end
end


function commonSupertype(xs...)
    xs = typeof.(xs)
    return commonSupertype(xs...)
end

commonSupertype(BigFloat,Float16) |> display
commonSupertype(Int,Bool,UInt) |> display
commonSupertype(true, 42, 5 + 4im, BigInt(10)^100) |> display
