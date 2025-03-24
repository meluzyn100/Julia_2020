formula = "Preheat the oven to 350 degrees F (175 degrees C).

 Step 2
Add pecans to a food processor and chop very finely. Add sweetener, cinnamon, and nutmeg and process for a few more seconds. Pour mixture into a bowl and add melted butter. Stir together and press crust mixture into the bottom of a divided brownie pan with the divider removed.

 Step 3
Beat egg until fluffy in a large bowl with an electric mixer. Mix in cream cheese 1 ounce at a time. Beat mixture until cream cheese is smooth. Add sweetener, sour cream, vanilla extract, and almond milk. Beat together until filling is smooth. Stir in melted butter. Pour filling over the crust in the brownie pan. Insert divider into the pan.

 Step 4
Bake in the preheated oven for about 35 minutes.

 Step 5
Meanwhile, heat a small pot over medium heat. Add mixed berries and sweetener and bring to a simmer, about 5 minutes. Stir berries and crush some with a spoon so that a liquid starts to form. Cook for about 10 minutes more.

 Step 6
Allow cheesecake bars to cool in the brownie pan, about 1 hour. Pour berry sauce on top of bars."

function The_an_a()

    check_1=eachmatch(r"\sthe\s(\w+)",formula)
    the_list=[]
    for i in check_1
        a=i.captures
        push!(the_list,a[1])
    end

    check_2=eachmatch(r"\sa\s(\w+)|\san\s(\w+)",formula)
    a_an_list=[]
    for i in check_2
        a = i.captures
        a[1] != nothing ? push!(a_an_list,a[1]) : push!(a_an_list,a[2])
    end

    println("Lista The \n",the_list)
    println("\nLista An,A \n",a_an_list)
end

The_an_a()
