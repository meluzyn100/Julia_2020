ex=Expr(:if,
    Expr(:call,:>,:x,0),
    :x,
    Expr(:call,:-,:x)
    )

ex |> dump
@show ex
x=-2
eval(ex)|>display
