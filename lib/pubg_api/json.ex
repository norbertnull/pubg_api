defmodule PubgApi.Json do
    def decode(data) when is_bitstring(data) do
        Jason.decode(data, [{:keys, :atoms}])
    end
end