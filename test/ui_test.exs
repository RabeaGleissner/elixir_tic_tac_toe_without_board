defmodule UiTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "asks user for a position" do
    assert capture_io([input: "4"], fn ->
      Ui.ask_for_position
    end) == "Please enter a number: \n"
  end

  test "returns user input for a position" do
    capture_io([input: "4"], fn ->
      send self(), {:result, Ui.ask_for_position}
    end)
    assert_received {:result, 4}
  end

  test "returns false when user input is invalid" do
    assert false == Ui.valid?("n")
  end

  test "returns user input if it is valid" do
    assert 3 == Ui.valid?("3")
  end

  test "prints an error message and asks again on bad input for position" do
    assert capture_io([input: "n\n4"], fn ->
      Ui.ask_for_position
    end) == "Please enter a number: \nSorry, only numbers from 1 - 9 are valid.\nPlease enter a number: \n"
  end

  test "asks the user if they want to play again" do
    assert capture_io([input: "n"], fn ->
      Ui.replay?
    end) == "Would you like to start again? (y/n)\n"
  end

  test "gets user input for replay choice" do
    capture_io([input: "n"], fn ->
      send self(), {:result, Ui.replay?}
    end)
    assert_received {:result, false}
  end

  test "asks the user for replay again on bad input" do
    assert capture_io([input: "4\nn"], fn ->
      Ui.replay?
    end) == "Would you like to start again? (y/n)\nWould you like to start again? (y/n)\n"
  end
end
