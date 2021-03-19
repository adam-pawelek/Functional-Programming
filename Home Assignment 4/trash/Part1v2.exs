defmodule Loop  do
  def print_multiple_times(list, n) when n <= 1 do
     IO.puts ("Program ends")
  end

  def print_multiple_times(list, n) do
    tekst = IO.gets("Give me a text line ")

    tekst = String.replace(tekst,"\n","")
    myText = "#" <> tekst
    cos = String.to_atom(tekst)
     n = if list[cos] == nil  do
      cos = String.to_atom(myText)
      n = if list[cos] == nil  do
        n = 0
      else
        IO.puts list[cos]
      end
     else
      IO.puts list[cos]
    end

     print_multiple_times(list, n)
  end
end




list = [
  {:"#F0F8FF", "AliceBlue"}, #color 1
   {:"#FAEBD7", "AntiqueWhite"}, #color2
   {:"#00FFFF","Aqua"}, #color3
  {:"#7FFFD4","Aquamarine"}, #color4
 {:"#F0FFFF","Azure"}, #color5
  {:"#F5F5DC","Beige"}, #color6
  {:"#FFE4C4","Bisque"}, #color7
  {:"#000000","Black"}, #clolr8
  {:"#FFEBCD","BlanchedAlmond"}, #color9
  {:"Blue","#0000FF"},
]





#IO.puts list[cos]

Loop.print_multiple_times(list,2)
