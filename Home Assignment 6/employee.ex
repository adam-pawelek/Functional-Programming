defmodule Employee  do
  @enforce_keys [:salary]
  defstruct [first_name: "", last_name: "",id_number: 0, salary: 0, job: :none]
  @tag os: 123
  def promote(myEmployee) do

    myEmployee = if myEmployee.job == :ceo do
      myEmployee
    else
      myEmployee
    end

    myEmployee = if myEmployee.job == :manager do
      myEmployee = %Employee{myEmployee | job: :ceo}
      %Employee{myEmployee | salary: myEmployee.salary +  2000}
    else
      myEmployee
    end



    myEmployee = if myEmployee.job == :designer do
      myEmployee = %Employee{myEmployee | job: :manager}
      %Employee{myEmployee | salary: myEmployee.salary +  2000}
    else
      myEmployee
    end


    myEmployee = if myEmployee.job == :coder do
      myEmployee = %Employee{myEmployee | job: :designer}
      %Employee{myEmployee | salary: myEmployee.salary +  2000}
    else
      myEmployee
    end

    myEmployee = if myEmployee.job == :none do
      myEmployee =%Employee{myEmployee | job: :coder}
      %Employee{myEmployee | salary: myEmployee.salary +  2000}
    else
      myEmployee
    end

  end


  def changeid(myEmployee,id) do
     %Employee{myEmployee | id_number: id}
  end



  def demote (myEmployee) do
    myEmployee = if myEmployee.job == :none do
      myEmployee
    else
      myEmployee
    end

    myEmployee = if myEmployee.job == :coder do
      myEmployee = %Employee{myEmployee | job: :none}
      %Employee{myEmployee | salary: myEmployee.salary -  2000}
    else
      myEmployee
    end

    myEmployee = if myEmployee.job == :designer do
      myEmployee = %Employee{myEmployee | job: :coder}
      %Employee{myEmployee | salary: myEmployee.salary -  2000}
    else
      myEmployee
    end

    myEmployee = if myEmployee.job == :manager do
      myEmployee = %Employee{myEmployee | job: :designer}
      %Employee{myEmployee | salary: myEmployee.salary -  2000}
    else
      myEmployee
    end


    myEmployee = if myEmployee.job == :ceo do
      myEmployee = %Employee{myEmployee | job: :manager}
      %Employee{myEmployee | salary: myEmployee.salary -  2000}
    else
      myEmployee
    end

  end



end
