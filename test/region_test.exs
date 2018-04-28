defmodule PubgApiTest.Region do
    use ExUnit.Case
    doctest PubgApi.Region
  
    test "Check region (atom)" do
      assert PubgApi.Region.allowed?(:xbox_na) == true
    end

    test "Check region (bitstring)" do
        assert PubgApi.Region.allowed?("xbox-na") == true
    end

  end
  