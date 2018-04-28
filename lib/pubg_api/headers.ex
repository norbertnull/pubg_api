defmodule PubgApi.Headers do
    def new() do
        %{
            "Accept" => "application/vnd.api+json"
        }
        |> PubgApi.Headers.gzip(:on)
    end

    def new(%{:gzip => gzip, :api_key => api_key}) do
        PubgApi.Headers.new()
        |> PubgApi.Headers.gzip(gzip)
        |> PubgApi.Headers.add_api_key(api_key)
    end

    def gzip(header_map, :on) when is_map(header_map) do
        header_map
        |> Map.put("Accept-Encoding", "gzip")
    end

    def gzip(header_map, :off) when is_map(header_map) do
        header_map
        |> Map.delete("Accept-Encoding")
    end

    def gzip?(header_map) when is_map(header_map) do
        case Map.get(header_map, "Accept-Encoding") do
            nil -> false
            x -> x == "gzip"
        end
    end

    def add_api_key(header_map, api_key) when is_map(header_map) and is_bitstring(api_key) do
        header_map
        |> PubgApi.ApiKey.add_to_headers(api_key)
    end

    def api_key(header_map) when is_map(header_map) do
        Map.get(header_map, "Authorization")
    end
end