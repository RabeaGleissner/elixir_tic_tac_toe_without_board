defmodule Ui do

  def ask_for_position do
    IO.puts "Please enter a number: "
    ask_user_for_position
  end

  defp ask_user_for_position do
    user_input = IO.gets ""
    input = String.strip(user_input)

    if valid?(input) do
      convert_to_integer(input)
    else
      invalid_position_error
      ask_for_position
    end
  end

  defp invalid_position_error do
    IO.puts "Sorry, only numbers from 1 - 9 are valid."
  end

  def valid?(input) do
    valid_numbers = [1,2,3,4,5,6,7,8,9]
    if is_number?(input) do
      Enum.find(valid_numbers, false, fn(num) ->
        num == convert_to_integer(input)
      end)
    else
      false
    end
  end

  def convert_to_integer(string) do
    String.to_integer(string)
  end

  defp is_number?(input) do
    Integer.parse(input) != :error
  end
end

