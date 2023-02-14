defmodule HelloPtrTest do
  use ExUnit.Case

  test "Hello PTR" do
    assert HelloPtr.print_hello_ptr() == "Hello PTR"
  end

end
