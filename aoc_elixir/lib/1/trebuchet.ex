defmodule Trebuchet do
  @non_number_filter_regex ~r/[\d]|(?=(one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|thirteen|fourteen|fifteen|sixteen|seventeen|eighteen|nineteen|twenty|thirty|forty|fifty|sixty|seventy|eighty|ninety))/

  def part_one(input \\ nil) do
    if input do
      input
    else
      read_input()
    end
    |> String.split("\n")
    |> Enum.map(&get_sum_of_first_and_last_digits/1)
    |> Enum.sum()
  end

  def part_two(input \\ nil) do
    if input do
      input
    else
      read_input()
    end
    |> String.split("\n")
    |> Enum.map(&filter_non_numbers/1)
    |> Enum.map(&replace_strings_with_numbers/1)
    |> Enum.map(&get_sum_of_first_and_last_digits/1)
    |> Enum.sum()
  end

  defp read_input() do
    case File.read("lib/1/input.txt") do
      {:ok, content} ->
        content
      {:error, reason} ->
        IO.puts("Failed to read input file: #{reason}")
        nil
    end
  end

  defp filter_non_numbers(line) do
    Regex.scan(
      # lol
      @non_number_filter_regex,
      line
    )
    |> List.flatten()
    |> Enum.reject(&(&1 == ""))
    |> Enum.join("")
  end

  defp replace_strings_with_numbers(line) do
    line
    |> String.replace(~r/one/, "1")
    |> String.replace(~r/two/, "2")
    |> String.replace(~r/three/, "3")
    |> String.replace(~r/four/, "4")
    |> String.replace(~r/five/, "5")
    |> String.replace(~r/six/, "6")
    |> String.replace(~r/seven/, "7")
    |> String.replace(~r/eight/, "8")
    |> String.replace(~r/nine/, "9")
    |> String.replace(~r/ten/, "10")
    |> String.replace(~r/eleven/, "11")
    |> String.replace(~r/twelve/, "12")
    |> String.replace(~r/thirteen/, "13")
    |> String.replace(~r/fourteen/, "14")
    |> String.replace(~r/fifteen/, "15")
    |> String.replace(~r/sixteen/, "16")
    |> String.replace(~r/seventeen/, "17")
    |> String.replace(~r/eighteen/, "18")
    |> String.replace(~r/nineteen/, "19")
    |> String.replace(~r/twenty/, "20")
    |> String.replace(~r/thirty/, "30")
    |> String.replace(~r/forty/, "40")
    |> String.replace(~r/fifty/, "50")
    |> String.replace(~r/sixty/, "60")
    |> String.replace(~r/seventy/, "70")
    |> String.replace(~r/eighty/, "80")
    |> String.replace(~r/ninety/, "90")
  end

  defp get_sum_of_first_and_last_digits(line) do
    digits = line
    |> String.trim()
    |> String.replace(~r/[^\d]/, "")
    |> String.split("")
    |> Enum.reject(&(&1 == ""))

    if length(digits) == 0 do
      0
    else
      String.to_integer("#{List.first(digits)}#{List.last(digits)}") |> IO.inspect(label: "SUM")
    end
  end
end
