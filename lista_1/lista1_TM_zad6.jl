#zad 6


function goblin()#fukcja podaje procentowa szanse na zabicie jednego goblina
    
    wyniki = rand([1,2,3,4],1000,3) #generowanie 1000 rzutow 1d4
    wyniki_z_modywikaorem = [wyniki ones(1000,1)*3] #dodanie modywikatora +1 trzy krotnie
    wartosci = sum(wyniki_z_modywikaorem, dims=2) #suma seri rzutow z danego wiersza
    kill_sum=sum(wartosci.>6) #ilosc pokonanych goblinow
    println("Goblin kill chance: ",kill_sum/1000*100,"%")
end


function kobolts() #fukcja podaje procentowa szanse na zabicie dwoch koboltow
    kobolt_1_dead = 0 #liczniki smierci
    kobolt_2_dead = 0

    wyniki = rand([2,3,4,5],1000,3) #wyniki kostek w poszczegulnych rzutach
    
    rzut_kill_1 = wyniki[:,1] .== 5 
    tura_1 = sum(rzut_kill_1) #ilosc zabitych koboltow nr.1 w pierwszym rzucie

    rzut_kill_2 = wyniki[:,1] + wyniki[:,2].>=5 
    tura_2=sum(rzut_kill_2) - tura_1 #ilosc zabitych koboltow nr.1 ktore nie zginely w 1 turze

    rzut_kill_3 = wyniki[:,1] + wyniki[:,2] + wyniki[:,3].>=5
    tura_3=sum(rzut_kill_3) - tura_2 -tura_1#jesli w turze 1 i 2 nie zginal kobolt to w turze 3 na pewno zginie  

    #jesi w 1 turze wylosowano 5
    kobolt_1_dead += sum(tura_1) #dodajeby ilosc smierci kobotow nr.1

    tree_1 = wyniki.*rzut_kill_1
    tree_1_kololt_drugi_kill = tree_1[:,2]+tree_1[:,3].>=5 #sprawdzamy ile koboltow nr.2 zgineło w turze 2 lub 3
    ilosc_zabitych_2_koboltow = sum(tree_1_kololt_drugi_kill)
    kobolt_2_dead += ilosc_zabitych_2_koboltow

    #jesli w 2 turze zginol kobolty nr.1
    kobolt_1_dead += sum(tura_2) #dodajeby ilosc smierci kobotow nr.1

    tree_2 = wyniki.*(rzut_kill_2.*.!rzut_kill_1)
    tree_2_kololt_drugi_kill = tree_2[:,3].>=5  #sprawdzamy ile goboltow nr.2 zginelo w ostatniej turze    
    kobolt_2_dead += sum(tree_2_kololt_drugi_kill)
    
    #jesli w 3 turze zginal 1. kobolty
    kobolt_1_dead += sum(tura_3) #dodajeby ilosc smierci kobotow nr.1

    println("Szansa na zabicie 1 kobolta: ",kobolt_1_dead/1000*100,"%")
    println("szansa na zabicie obu koboltow: ",kobolt_2_dead/1000*100,"%")

end

goblin()
kobolts()
