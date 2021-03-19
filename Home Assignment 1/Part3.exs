

tekst = IO.gets("Give me a text line ")

tekst = String.replace(tekst,"\n","")

IO.puts String.length(tekst)

IO.puts String.reverse(tekst)

tekst = String.replace(tekst,"foo","bar")

IO.puts tekst
