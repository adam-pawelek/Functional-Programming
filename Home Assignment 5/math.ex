defmodule Math do

  def add(par1,par2) do
    _cos = info("+")
    par1+par2

  end

  def mul(par1,par2) do
    _cos = info("*")
    par1*par2
  end

  def div(par1,par2) do
    _cos = info("/")
    par1 / par2
  end

  def sub(par1,par2) do
    _cos = info("-")
    par1 - par2
  end

  defp info(word) do
    pom = cond do
      String.contains?(word,"+") ->  "Adding x and y"
      String.contains?(word,"-")  -> "Subtracting x and y"
      String.contains?(word,"*")  -> "Multiplication x and y"
      String.contains?(word,"/")  -> "Division x by y"
    end
    IO.puts pom
  end
end
