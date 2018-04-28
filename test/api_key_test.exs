defmodule PubgApiTest.ApiKey do
    use ExUnit.Case
    doctest PubgApi.ApiKey
  
    test "Generate API Key string" do
      assert PubgApi.ApiKey.generate("api_key") == "Bearer api_key"
    end

    test "Add API Key string to header map" do
      api_key = "api_key"
      header_map = %{}
      |> PubgApi.ApiKey.add_to_headers(api_key)
      assert header_map["Authorization"] == "Bearer api_key"
    end
  end
  