defmodule PubgApiTest.Headers do
  use ExUnit.Case
  doctest PubgApi.Headers

  test "New header" do
    header = PubgApi.Headers.new()
    assert header["Accept"] == "application/vnd.api+json"

    advanced_header =
      PubgApi.Headers.new(%{
        gzip: :off,
        api_key: "api_key"
      })

    assert advanced_header["Accept-Encoding"] == nil
    assert advanced_header["Authorization"] == "Bearer api_key"
  end

  test "Gzip toggle" do
    header =
      PubgApi.Headers.new()
      |> PubgApi.Headers.gzip(:on)

    assert header["Accept-Encoding"] == "gzip"
    assert PubgApi.Headers.gzip?(header) == true

    header =
      header
      |> PubgApi.Headers.gzip(:off)

    assert header["Accept-Encoding"] == nil
    assert PubgApi.Headers.gzip?(header) == false
  end

  test "Add API Key" do
    header =
      PubgApi.Headers.new()
      |> PubgApi.Headers.add_api_key("api_key")

    assert header["Authorization"] == "Bearer api_key"
    assert PubgApi.Headers.api_key(header) == "Bearer api_key"
  end
end
