defmodule Loop do
  def print_multiple_times(myList, myListResult,n) when n < 0 do
    IO.puts("\nSentence Result\n")
    myListResult
 end

 def print_multiple_times(myList, myListResult,n) do
    slowo = Enum.at(myList,n)
   # IO.puts(String.slice(slowo,(String.length(slowo)-1)..(String.length(slowo)-1)))
    slowo = if String.slice(slowo,(String.length(slowo)-1)..(String.length(slowo)-1)) =="." do
      slowo  = changeWord(String.slice(slowo,0..(String.length(slowo)-2)))
      slowo= slowo <> "."
    else
      slowo = if String.slice(slowo,(String.length(slowo)-1)..(String.length(slowo)-1)) =="," do
        slowo  = changeWord(String.slice(slowo,0..(String.length(slowo)-2)))
        slowo= slowo <> ","
      else
        slowo  = changeWord(slowo)
      end
    end

    myListResult = slowo <> " " <> myListResult
    IO.puts(slowo)
    print_multiple_times(myList,myListResult, n - 1)
 end

  def changeWord (word) do
    word = cond do
      Enum.member?(["a","e","i","o","u","A","E","I","O","U"], String.slice(word,0..0)) -> word = String.slice(word,0..String.length(word)) <>    "ay" # vowel
      Enum.member?(["yt","xr"], String.slice(word,0..1)) -> word = String.slice(word,0..String.length(word)) <>  "ay" #vowel
      Enum.member?(["thr","sch","squ","Thr","Sch","Squ"], String.slice(word,0..2)) -> word = String.slice(word,3..String.length(word)) <>  String.slice(word,0..2) <>   "ay" #consonant
      Enum.member?(["ch","qu","th","Ch","Qu","Th"], String.slice(word,0..1)) -> word = String.slice(word,2..String.length(word)) <>  String.slice(word,0..1) <>   "ay" #consonant

      1 + 1 == 2 -> word = String.slice(word,1..String.length(word)) <>  String.slice(word,0..0) <>   "ay" #if conndiction above are false that means it is consonant
    end
    String.downcase(word)
  end

end













mySentence = "Pattern Matching with Elixir. Remember that equals sign is a match operator, not an assignment"
myList = String.split(mySentence)
IO.puts("Result")
IO.puts Loop.print_multiple_times(myList,"", Enum.count(myList) - 1)
