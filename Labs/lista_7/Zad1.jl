module QuantumCircuits

    export Qubit, q0, q1, measure, transform

    struct Qubit
        a1 :: Complex
        a2 :: Complex

        Qubit(a1,a2) = if !isapprox(abs(a1)^2+abs(a2)^2,1)
                throw(error("|q⟩ nie spełnia warunku |α₀|² + |α₁|² = 1 "))
            else
                 new(a1,a2)
            end
    end

    Base.show(io::IO,x::Qubit) = print(io,"Nasz qubit to [$(x.a1), $(x.a2)]")

    Qubit(a1) = Qubit(a1,0)
    Qubit() = Qubit(0,0)

    q0=Qubit(1,0)
    q1=Qubit(0,1)

    measure(x::Qubit, stan::Qubit) = round(abs(x.a1*conj(stan.a1) + x.a2*conj(stan.a2))^2,digits = 14)

    Base.getproperty(l::Qubit, name::Symbol) =
        if name === :X
            return [0 1;1 0]*[l.a1, l.a2]
        elseif name === :Y
            return [0 -im;im 0]*[l.a1, l.a2]
        elseif name === :Z
            return [1 0;0 -1]*[l.a1, l.a2]
        elseif name == :H
            return (1/sqrt(2))*[1 1;1 -1]*[l.a1, l.a2]
        elseif name === :S
            return [1 0;0 im]*[l.a1, l.a2]
        elseif name === :T
            return [1 0;0 exp(im*pi/4)]*[l.a1, l.a2]
        else
            return getfield(l,name)
        end

    function transform(x::Qubit,s::Symbol)
        return getproperty(x,s)
    end

    function transform(x::Qubit,s::Symbol...)
        for i in s
            y = getproperty(x,i)
            x = Qubit(y[1],y[2])
        end
        return x
    end

end   # modulQuantumCircuits

##Sprawdzanie czy dziala
using .QuantumCircuits
q = Qubit(sqrt(3/4),0.5) #Przykłądowy Qubit
q0 #Qubit |0⟩
q1 #Qubit |1⟩

measure(q,q)  |> display
measure(q,q0) |> display

transform(q,:H,:X,:X,:Z,:S) |> display
