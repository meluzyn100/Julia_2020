macro not42(f::Function)
    if 42 in f.args
        error("Thu! 42")
    else
        return quote
            println("42 tu nie ma")
            $f
        end
    end
end
f(x...)=sum(x)

@not42 f(1,2,3,4)
@not42 f(42)
