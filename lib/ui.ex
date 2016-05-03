defmodule Ui do

  def ask_for_position do
    IO.puts "Please enter a number: "
    ask_user_for_position
  end

  def game_over do
    IO.puts "GAME OVER\n"
  end

  def replay? do
    IO.puts "Would you like to start again? (y/n)"
    get_replay_option
  end

  defp get_replay_option do
    input = String.strip(IO.gets "")
    if input == "y" || input == "n" do
      input == "y"
    else
      replay?
    end
  end

  def say_bye do
    IO.puts "See you next time!"
  end

  defp ask_user_for_position do
    input = String.strip(IO.gets"")

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

  defp convert_to_integer(string) do
    String.to_integer(string)
  end

  defp is_number?(input) do
    Integer.parse(input) != :error
  end
end
