
sum = fn
  word1,word2 when is_bitstring(word1) and is_bitstring(word2) -> word1 <> " " <> word2
  word1,word2 when is_integer(word1) and is_integer(word2) -> word1 + word2
  word1,word2  -> "This is not string and  not intiger"
end


IO.puts sum.("This is","string")
IO.puts sum.(2,1)
