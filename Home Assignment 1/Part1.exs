#Part 1

#Write an Elixir script that declares a variable and sets its value to 123.
#Print the value of the variable to the console.
#Add code that asks a text line from the user (use IO.gets).
varr = 123

IO.puts varr

tekst = IO.gets("Give me a text line ")

tekst = String.replace(tekst,"\n","")
tekst = tekst <> " You said that"


IO.puts tekst


#Part 1 done
