
defmodule Loop do
   def print_multiple_times(num, n) when n <= 1 do
      #IO.puts n
   end

   def print_multiple_times(num, n) do
      n = if rem(num,n) == 0 do
         IO.puts("Divisible by ")
         IO.puts n
         n = 0
      else
         n = n + 1
       end
      print_multiple_times(num, n)
   end
end

num = IO.gets("Give me a third number ")
num = String.replace(num,"\n","")
num = String.to_integer(num)
if rem(num,3) == 0 do
  IO.puts "Divisible by 3"
end


if rem(num,5) == 0 do
  IO.puts "Divisible by 5"
end


if rem(num,7) == 0  do
  IO.puts "Divisible by 7"
end

if   rem(num,7) != 0  and rem(num,5) != 0 and rem(num,3) != 0  do
   Loop.print_multiple_times(num, 2)
 end



#I assumed that we don't count 1 in Divisible becouse if we count from 1 i could always return 1
