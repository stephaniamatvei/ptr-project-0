defmodule AnagramsGroupingTest do
  use ExUnit.Case

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
