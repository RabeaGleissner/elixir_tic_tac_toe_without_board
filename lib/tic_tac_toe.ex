defmodule TicTacToe do

  def run(ui) do
    play(1, ui, Kernel)
  end

  def play(10, ui, kernel), do: play_again?(ui, kernel)
  def play(counter, ui, kernel) do
    ui.ask_for_position
    play(counter + 1, ui, kernel)
  end

  def play_again?(ui, kernel) do
    ui.game_over
    if ui.replay? do
      play(1, ui, kernel)
    else
      end_game(ui, kernel)
    end
  end

  defp end_game(ui, kernel) do
    ui.say_bye
    kernel.exit(:normal)
  end
end
