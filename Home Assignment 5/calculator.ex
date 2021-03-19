defmodule Calculator do

def calc(word) do
  pom = word
  pom = String.replace(pom,"+"," ")
  pom = String.replace(pom,"-"," ")
  pom = String.replace(pom,"*"," ")
  pom = String.replace(pom,"/"," ")
  myArray = String.split(pom)

    myValue1 = Enum.at(myArray,0)
    myValue2 = Enum.at(myArray,1)
    myValue1 = String.to_integer(myValue1)
    myValue2 = String.to_integer(myValue2)
    cond do
      String.contains?(word,"+") ->  Math.add(myValue1, myValue2)
      String.contains?(word,"-")  -> Math.sub(myValue1, myValue2)
      String.contains?(word,"*")  -> Math.mul(myValue1, myValue2)
      String.contains?(word,"/")  -> Math.div(myValue1, myValue2)

    end




end

end
