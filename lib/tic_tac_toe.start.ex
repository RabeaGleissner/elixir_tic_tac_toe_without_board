defmodule Mix.Tasks.TTT.Start do
  use Mix.Task

  def run(_) do
    TicTacToe.run(Ui)
  end
end
