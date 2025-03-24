using .QuantumCircuits
q = Qubit(sqrt(3/4),0.5) #Przykłądowy Qubit
q0 #Qubit |0⟩
q1 #Qubit |1⟩

measure(q,q)  |> display
measure(q,q0) |> display

transform(q,:H,:X,:X,:Z,:S) |> display
