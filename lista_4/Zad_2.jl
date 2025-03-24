function Anagram(check::String)
    controller = reverse(check)
    if check == controller
        println("Jest to anagram")
        return check
    else
        return check*controller
    end
end
Anagram("Hello") |> display
