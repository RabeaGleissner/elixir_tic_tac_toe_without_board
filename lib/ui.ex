defmodule Ui do

  def ask_for_position do
    IO.gets "Please enter a number: "
  end

  def valid?(input) do
    valid_numbers = [1,2,3,4,5,6,7,8,9]
    if is_number?(input) do
      Enum.find(valid_numbers, false, fn(num) ->
        num == String.to_integer(input)
      end)
    else
      false
    end
  end

  defp is_number?(input) do
    Integer.parse(input) != :error
  end
end

