defmodule TrebuchetTest do
  use ExUnit.Case
  doctest Trebuchet

  describe "part_one/1" do
    test "returns the sum of the first and last digits of each line of a calibration document" do
      input = ~S"""
      1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet
      """
      assert Trebuchet.part_one(input) == 142
    end
  end

  describe "part_two/1" do
    test "returns the sum of the first and last digits (including strings that spell numbers) of each line of a calibration document" do
      input = ~S"""
      two1nine
      eightwothree
      abcone2threexyz
      xtwone3four
      4nineeightseven2
      zoneight234
      7pqrstsixteen
      """
      assert Trebuchet.part_two(input) == 281
    end
  end
end
