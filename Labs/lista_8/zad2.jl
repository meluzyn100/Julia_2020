typs = [String,Int,Char]
bool = [true,false,true]

for (i,l) in zip(typs,bool)
    if l== false
        fun = :(pickyFun(x::$i) = throw(ArgumentError("Zmienna $x to bezguście.")))
        eval(fun)
    else
        fun = :(pickyFun(x::$i)= println("$x to wyborna zmienna."))
        eval(fun)
    end
end
pickyFun(1)
pickyFun("I'm the best")
