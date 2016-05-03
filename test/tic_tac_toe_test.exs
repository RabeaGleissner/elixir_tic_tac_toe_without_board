defmodule TicTacToeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  setup do
    Code.require_file("test/ui_stub.ex")
    Code.require_file("test/kernel_dummy.ex")
    :ok
  end

  test "plays again if user wants to replay" do
    replay = "y\n"
    numbers = "1\n2\n3\n4\n5\n6\n7\n8\n9\n"
    no_replay = "n\n"
    input = replay <> numbers <> no_replay
    result = capture_io([input: input], fn ->
      TicTacToe.play(10, Ui, KernelDummy)
    end)
    assert String.contains?(result, "See you next time")
  end

  test "ends game if user doesn't want to replay" do
    no_replay = "n\n"
    result = capture_io([input: no_replay], fn ->
      TicTacToe.play(10, Ui, KernelDummy)
    end)
    assert String.contains?(result, "See you next time")
  end

  test "asks for position 3 more times when counter is at 7" do
    result = capture_io(fn ->
      TicTacToe.play(7, UiStub, KernelDummy)
    end)
    assert String.contains?(result, "Position?\nPosition?\nPosition?\n")
  end
end
