defmodule UiStub do

  def ask_for_position do
    IO.puts "Position?"
  end

  def replay? do
    false
  end

  def say_bye do
    IO.puts "Bye"
  end
end
