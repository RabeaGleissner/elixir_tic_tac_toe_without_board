defmodule UiTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "asks user for a position" do
    assert "Please enter a number: " == capture_io(fn -> Ui.ask_for_position end)
  end

  test "returns user input for a position" do
    capture_io([input: "4"], fn ->
      send self(), {:result, Ui.ask_for_position}
    end)
    assert_received {:result, "4"}
  end
end
