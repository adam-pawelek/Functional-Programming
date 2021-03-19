multthree = fn a, b,c -> a * b * c end

conntactList = fn list1,list2 -> list1 ++ list2 end

#number1
num1 = IO.gets("Give me  first number ")
num1 = String.replace(num1,"\n","")
num1 = String.to_integer(num1)

#number2

num2 = IO.gets("Give me second number ")
num2 = String.replace(num2,"\n","")
num2 = String.to_integer(num2)

#number3

num3 = IO.gets("Give me a third number ")
num3 = String.replace(num3,"\n","")
num3 = String.to_integer(num3)

#end of loading data

IO.puts multthree.(num1,num2,num3)


#call contact list function and print the results

IO.puts conntactList.(["1 "," 2 "," 3 "],[" 4 "," 5 "," 6 "])


tupp = {:ok,:fail}

tupp = Tuple.append(tupp, :canceled)

IO.inspect( tupp, label: "My tuple ")
