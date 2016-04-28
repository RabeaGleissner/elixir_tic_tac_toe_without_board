defmodule Mix.Tasks.TicTacToe.Start do
  use Mix.Task

  def run(_) do
    Ui.ask_for_position
  end
end
