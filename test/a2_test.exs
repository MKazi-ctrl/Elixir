defmodule A2Test do
  use ExUnit.Case
  doctest A2

  def solarSystem do
"Sun 57909227 Mercury
Earth 384400 Moon
Sun 149598262 Earth
Moon 1757 LROrbiter
Mars 9376 Phobos
Mars 23458 Deimos
Sun 227943824 Mars
Sun 778340821 Jupiter
Sun 1426666422 Saturn
Sun 2870658186 Uranus
Sun 4498396441 Neptune
"
  end

  test "default example" do
    assert solarSystem() <>
  "Sun Moon
Deimos Moon
Deimos
Deimos Phobos
Moon
LROrbiter
" |> A2.process() == "From Sun to Moon is 149982662km
From Deimos to Moon is 377949944km
Deimos orbits Mars Sun
From Deimos to Phobos is 32834km
Moon orbits Earth Sun
LROrbiter orbits Moon Earth Sun
"
  end

  test "test2" do
    assert solarSystem() <>
  "Sun Moon
  Moon Sun
  Deimos Mars
  Mars Deimos
  Earth Earth
  Sun LROrbiter
  Mars Earth
  Mars Moon
" |> A2.process() == "From Sun to Moon is 149982662km
From Moon to Sun is 149982662km
From Deimos to Mars is 23458km
From Mars to Deimos is 23458km
From Earth to Earth is 0km
From Sun to LROrbiter is 149984419km
From Mars to Earth is 377542086km
From Mars to Moon is 377926486km
"
  end

  test "test3" do
    assert solarSystem() <>
  "Uranus Deimos
  Neptune LROrbiter
  Phobos Jupiter
  Jupiter Phobos
" |> A2.process() == "From Uranus to Deimos is 3098625468km
From Neptune to LROrbiter is 4648380860km
From Phobos to Jupiter is 1006294021km
From Jupiter to Phobos is 1006294021km
"
  end

  test "test4" do
    assert solarSystem() <>
  "Saturn
Moon
Phobos
Sun LROrbiter
" |> A2.process() == "Saturn orbits Sun
Moon orbits Earth Sun
Phobos orbits Mars Sun
From Sun to LROrbiter is 149984419km
"
  end

end
