defmodule PtrLab1Test do
  use ExUnit.Case
  doctest PtrLab1

  test "greets the world" do
    assert PtrLab1.hello() == :world
  end

  test "Hello PTR" do
    assert HelloPtr.print_hello_ptr() == "Hello PTR"
  end

  test "anagrams grouping" do
    assert AnagramsGrouping.group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"]) ==
             %{
               "abt" => ["bat"],
               "aet" => ["eat", "tea", "ate"],
               "ant" => ["tan", "nat"]
             }

    assert AnagramsGrouping.group_anagrams(["gentleman", "elegant", "tnagele", "nameltneg"]) ==
             %{
               "aeeglmnnt" => ["gentleman", "nameltneg"],
               "aeeglnt" => ["elegant", "tnagele"]
             }
  end

end
