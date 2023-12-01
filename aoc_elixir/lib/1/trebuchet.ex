defmodule Trebuchet do
  @non_number_filter_regex ~r/[\d]|(?=(one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|thirteen|fourteen|fifteen|sixteen|seventeen|eighteen|nineteen|twenty|thirty|forty|fifty|sixty|seventy|eighty|ninety))/
  @number_replacements %{
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9,
    "ten" => 10,
    "eleven" => 11,
    "twelve" => 12,
    "thirteen" => 13,
    "fourteen" => 14,
    "fifteen" => 15,
    "sixteen" => 16,
    "seventeen" => 17,
    "eighteen" => 18,
    "nineteen" => 19,
    "twenty" => 20,
    "thirty" => 30,
    "forty" => 40,
    "fifty" => 50,
    "sixty" => 60,
    "seventy" => 70,
    "eighty" => 80,
    "ninety" => 90
  }

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
      @non_number_filter_regex,
      line
    )
    |> List.flatten()
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(&look_up_number/1)
    |> Enum.join("")
  end

  defp look_up_number(match), do: Map.get(@number_replacements, match, match)

  defp get_sum_of_first_and_last_digits(line) do
    digits = line
    |> String.trim()
    |> String.replace(~r/[^\d]/, "")
    |> String.split("")
    |> Enum.reject(&(&1 == ""))

    if length(digits) == 0 do
      0
    else
      String.to_integer("#{List.first(digits)}#{List.last(digits)}")
    end
  end
end
