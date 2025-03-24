#zad 5

A = [1,2,3,4]
B = [5,6,7,8]



#Cz.1
nB = B[end:-1:1] #tworzenie wektora B od tyłu
suma = sum(A.*nB') #suma a1*bn+...+an*b1
println(suma)

nM = [A'; nB']
V = vec(reshape(nM,1,8)) #wektora a1,bn,...,an,b1
display(V)

#Cz.2
Warunek = BitArray(x<y^2 && x+y<100 for x = 1:100,y = 1:100) #Stworzenie maciezy ktorej indeksy spelniaja podany warunek

Filtr = reshape(collect(1:10000),100,100) #Tworzenie maciezy z ktorej bedziemy brac indeksy liniowe 
Przefiltrowane = Filtr[Warunek] 
I_index = Przefiltrowane.%100 #Bierzeby reszte prze 100 podanej maciezy aby uzyskac jej index wiersz
J_index = floor.(Przefiltrowane./100).+1 #Aby uzyskac indeksy kolumny wystarczy podzielic przez 100 i uzyc funkcji sufitu

All = [I_index J_index]

print("Wszystkie liczby spełniajace podany warunek to ")
display(All)