defmodule TicTacToe do
  use Application

  def start(_type, _args) do
    Ui.ask_for_position
  end
end
