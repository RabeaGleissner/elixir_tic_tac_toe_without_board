defmodule UiTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "asks user for a position" do
    assert "Please enter a number:\n" == capture_io(fn -> Ui.ask_for_position end)
  end
end
