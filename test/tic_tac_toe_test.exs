defmodule TicTacToeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  setup do
    Code.require_file("test/ui_stub.ex")
    Code.require_file("test/kernel_dummy.ex")
    :ok
  end

  test "ends game if user doesn't want to replay" do
    assert capture_io(fn ->
      TicTacToe.play(10, UiStub, KernelDummy)
    end) == "Bye\n"
  end

  test "asks for position 3 more times when counter is at 7" do
    assert capture_io(fn ->
      TicTacToe.play(7, UiStub, KernelDummy)
    end) == "Position?\nPosition?\nPosition?\nBye\n"
  end
end
