defmodule PubgApiTest do
  use ExUnit.Case
  doctest PubgApi

  test "greets the world" do
    assert PubgApi.hello() == :world
  end
end
