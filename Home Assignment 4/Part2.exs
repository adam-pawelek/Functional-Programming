defmodule Loop do
   def print_multiple_times(map, n) when n <= 1 do

   end

   def print_multiple_times(map, n) do
    tekst = IO.gets("Give me a text line ")
    tekst = String.replace(tekst,"\n","")

     n = if String.contains?(tekst,"quit") do #dziala
      n =0
     else
      n = n
    end
    if String.contains?(tekst,"list") do #dziala
      print_list(map)
    end
    if String.contains?(tekst,"search") do #dziala
      print_search(map,String.slice(tekst,7..String.length(tekst)))
    end

    map = if String.contains?(tekst,"remove") do #dziala
       map =remove_ISBN(map,String.slice(tekst,7..String.length(tekst)))
       map
    else
      map
    end

    map = if String.contains?(tekst,"add") do  #dziala
      cos = :binary.match tekst , ","
      numer = elem(cos,0)

      isbn = String.slice(tekst,4..numer - 1)
      word =String.slice(tekst,numer+1..String.length(tekst))
      map =add_ISBN(map,isbn,word)
      map
    else
      map
    end

    print_multiple_times(map, n)
   end



   def print_list(map) do
    cos =  Map.values(map)
   # IO.inspect  cos
    print_me(cos,0)
   end

   def print_me(mylist,n) do
      n = if n == length(mylist) do
        n = n
      else
        IO.puts Enum.at(mylist,n)
        n = n + 1
        print_me(mylist,n)
      end
   end

   def print_search(map,isbn) do #dziala
    IO.puts map[isbn]
   end

   def add_ISBN(map,isbn,word) do #dziala
      Map.put(map,isbn,word)
   end

   def remove_ISBN(map,isbn) do # dziala
    Map.delete(map, isbn)
   end
end




map = %{
  "3-8266-8201-7" => "Linux Server mit Debian 7 GNU/Linux",
  "1-281-22245-3" => "Ubuntu Linux toolbox 1000+ commands for Ubuntu and Debian power users / Christopher Negus, François Caen.",
  "1-887-94242-4" => "Whacky Jack",
  "0-141-39707-1" => "The Beautifull Cassandra",
  "0-596-10209-7" => "Learning C# 2005: Get Started with C# 2.0 and .NET Programming (2nd Edition)",
}

'''
IO.puts map["3-8266-8201-7"]

cos =  Map.values(map)

map =  Loop.add_ISBN(map,"0596102012","coos")

Loop.print_list(map)

map = Loop.remove_ISBN(map,"3-8266-8201-7")
IO.inspect(map)

tekst = "add 321123,123"
cos = :binary.match tekst , ","
numer = elem(cos,0)

IO.puts(String.slice(tekst,4..numer - 1))

IO.puts(String.slice(tekst,numer+1..String.length(tekst)))

'''



Loop.print_multiple_times(map,10)
