
defmodule Loop do
   def myLoop(n) when n <= 1 do
      IO.puts("Wrong text format")
   end

   def myLoop(n) do
      tekst = IO.gets("Give me a text line ")
      tekst = String.replace(tekst,"\n","")
      try do
        IO.puts Calculator.calc(tekst)
        n = n
        myLoop( n )
    catch kind,value ->
      myLoop( 0 )
    end



   end
end

Loop.myLoop( 10)
