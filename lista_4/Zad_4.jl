b = open("bogurodzica.txt","r")
text = read(b,String)
new_text = replace(text,r" +" => " ")
end_text = replace(new_text,r"\t" => "")
file = open("bogurodzica_new.txt","w")
write(file,end_text)
close(file)
close(b)
