defmodule A2 do
  @moduledoc """
  Documentation for `A2`.
  """

  @doc """
  Assignment 2 - Orbits

  """










def commands([head | tail],acc) do

  cond do
    Enum.count(String.split(head)) == 2 or Enum.count(String.split(head)) == 1 -> commands(tail,acc ++ [head])
    true -> commands(tail,acc)
  end

end

def commands([],acc) do
  acc
end

def three([head | tail], acc) do

  cond do
    Enum.count(String.split(head)) == 2 or Enum.count(String.split(head)) == 1 -> three(tail,acc)
    true -> three(tail,acc ++ [head])
  end
end

def three([],acc) do
  acc
end

def distance(two,data) do

  planet1 = Enum.at(String.split(two),0)
  planet2 = Enum.at(String.split(two),1)

  methodOne(planet1,planet2,data,0,data)


end



def methodOne(planet1,planet2,[head | tail],value,data) do


  planet3 = Enum.at(String.split(head),0)
  planet4 = Enum.at(String.split(head),2)
  distance = Enum.at(String.split(head),1)
  cond do
    planet1 == planet2 -> methodOne(planet1,planet2,[],value,data)
    (planet1 == planet3 and planet2 == planet4) or (planet1 == planet4 and planet2 == planet3) -> methodOne(planet1,planet2,[],value + String.to_integer(distance),data)
    planet4 == planet2 -> methodOne(planet1,planet3,data,value + String.to_integer(distance),data)
    planet4 == planet1 -> methodOne(planet2,planet3,data,value + String.to_integer(distance),data)
    true -> methodOne(planet1,planet2,tail,value,data)
  end


end

def methodOne(planet1,planet2,[],value,data)do
  value
end

def orbit(one,data) do

  methodTwo(one,data,[],data)
end


def methodTwo(planet1,[head | tail],value,data) do


  planet2 = Enum.at(String.split(head),0)
  planet3 = Enum.at(String.split(head),2)
  cond do
    planet1 == planet3 -> methodTwo(planet2,data,value ++ [planet2], data)
    true -> methodTwo(planet1,tail,value,data)
  end

end

def methodTwo(planet1,[],value,data) do
  value
end


def work([head | tail], data,result) do

  cond do
    Enum.count(String.split(head)) == 2 -> work(tail,data,result <> sentence(head,distance(head,data)))
    true -> work(tail,data,result <> sentence2(head,orbit(head,data),""))
  end

end

def sentence(two,value) do
  planet1 = Enum.at(String.split(two),0)
  planet2 = Enum.at(String.split(two),1)
  string = "From " <> planet1 <> " to " <> planet2 <> " is " <> Integer.to_string(value) <> "km" <> "\n"
  string
end

def sentence2(one,[head | tail],value) do

  sentence2(one,tail,value <> " " <> head)
end

def sentence2(one,[],value) do
  one <> " orbits" <> value <> "\n"
end


def work([],data,result) do
   result
end



  def process(input) do
    a = String.split(input, "\n")
    work(commands(a,[]),three(a,[]),"")


  end

  def main() do
    File.read!("../sample-input")|>A2.process()
  end
end
