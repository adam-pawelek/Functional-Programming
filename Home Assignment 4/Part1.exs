defmodule Loop  do
  def print_multiple_times(list, n) when n <= 1 do
     IO.puts ("Program ends")
  end

  def print_multiple_times(list, n) do
    tekst = IO.gets("Give me a text line ")

    tekst = String.replace(tekst,"\n","")

    cos = String.to_atom(tekst)
     n = if list[cos] == nil  do

      n = 0
     else
      IO.puts list[cos]
    end

     print_multiple_times(list, n)
  end
end




list = [
  {:"AliceBlue", "#F0F8FF"}, {:"#F0F8FF", "AliceBlue"}, #color 1
  {:"AntiqueWhite", "#FAEBD7"}, {:"#FAEBD7", "AntiqueWhite"}, #color2
  {:"Aqua","#00FFFF"}, {:"#00FFFF","Aqua"}, #color3
  {:"Aquamarine","#7FFFD4"}, {:"#7FFFD4","Aquamarine"}, #color4
  {:"Azure","#F0FFFF"},{:"#F0FFFF","Azure"}, #color5
  {:"Beige","#F5F5DC"},{:"#F5F5DC","Beige"}, #color6
  {:"Bisque","#FFE4C4"},{:"#FFE4C4","Bisque"}, #color7
  {:"Black","#000000"},{:"#000000","Black"}, #clolr8
  {:"BlanchedAlmond","#FFEBCD"},{:"#FFEBCD","BlanchedAlmond"}, #color9
  {:"Blue","#0000FF"},{:"Blue","#0000FF"},
]





#IO.puts list[cos]

Loop.print_multiple_times(list,2)
