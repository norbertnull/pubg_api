defmodule PubgApi.ApiKey do
  def generate(api_key) when is_bitstring(api_key) do
    "Bearer " <> api_key
  end

  def add_to_headers(header_map, api_key) when is_bitstring(api_key) and is_map(header_map) do
    header_map
    |> Map.put("Authorization", PubgApi.ApiKey.generate(api_key))
  end
end
