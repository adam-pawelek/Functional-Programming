defmodule ChangeIDLoop do
   def changeID(n,myList) when n == length(myList) do
      myList
   end
   def changeID(n,myList) do
      storeEmployee =Employee.changeid(Enum.at(myList,n),n)
      myList = List.replace_at(myList,n,storeEmployee)
      myList = changeID(n+1,myList)
      myList
   end

end






defmodule Loop do
   def print_multiple_times(n, myList,id) when n <= 1 do

   end

   def print_multiple_times(n, myList,id) do
      try do
      IO.puts("If you want to create new Employee write new and then I will ask you to put necessery informations")
      IO.puts("If you want delete Employee write delete and id")
      IO.puts("If you want promote Employee write promote and id")
      IO.puts("If you want to demote Employee write demote and id")
      IO.puts("If you want to quit write quit")

      tekst = IO.gets("Give me a text line ")
      tekst = String.replace(tekst,"\n","")

      myList = if String.contains?(tekst,"add") do
         # name
         name = IO.gets("Give me name ")
         name = String.replace(name,"\n","")

         #last name
         lastName = IO.gets("Give me last name ")
         lastName = String.replace(lastName,"\n","")

         helpList = [ %Employee{first_name: name, last_name: lastName, id_number: id, salary: 0, job: :none}]
         myList = myList ++ helpList
         IO.puts("List after change")
         IO.inspect myList
         myList
      else
         myList
      end
      id = if String.contains?(tekst,"add") do
         id = id + 1
         id
      else
         id
      end

      myList = if String.contains?(tekst,"promote") do
         number = String.split(tekst)
         number = Enum.at(number,1)
         number = String.to_integer(number)
      #   IO.inspect Enum.at(myList,number)
         storeEmployee = Employee.promote(Enum.at(myList,number))
      #   IO.inspect(storeEmployee)
         myList = List.replace_at(myList,number,storeEmployee)
         IO.puts("List affter change")
         IO.inspect myList
         myList
      else
         myList
      end

      myList = if String.contains?(tekst,"demote") do
         number = String.split(tekst)
         number = Enum.at(number,1)
         number = String.to_integer(number)
       #  IO.inspect Enum.at(myList,number)
         storeEmployee = Employee.demote(Enum.at(myList,number))
       #  IO.inspect(storeEmployee)
         myList = List.replace_at(myList,number,storeEmployee)
         IO.puts("List after change")
         IO.inspect myList
         myList
      else
         myList
      end


      myList = if String.contains?(tekst,"delete") do
         number = String.split(tekst)
         number = Enum.at(number,1)
         number = String.to_integer(number)
         myList = List.delete_at(myList,number)
         myList = ChangeIDLoop.changeID(0,myList)
         IO.puts("List after change")
         IO.inspect myList
         myList
      else
         myList
      end

      id = if String.contains?(tekst,"delete") do
         id = id - 1
      else
         id
      end

      n = if String.contains?(tekst,"quit") do
         n = 0
      end




      print_multiple_times(n, myList,id)

   catch kind,value ->
      IO.puts("Wrong format or index out of range ")
    end





   end
end


Loop.print_multiple_times(10,[],0)
