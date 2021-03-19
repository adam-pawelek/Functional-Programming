'''
wordd = "99 bottles of beer on the wall"

len1 = String.length(wordd)

wordd = String.replace(wordd," ","")

len2  = String.length(wordd)

#Io.puts wordd
IO.puts len1 - len2 + 1
My first version which count number of spaces
'''

# My second version to submit
myWord = "99 bottles of beer on the wall"
coos = String.split(myWord)

IO.inspect coos
IO.puts("There are")
IO.puts Enum.count(coos)
IO.puts("words in this text")



# I assumed that 99 is also word.
