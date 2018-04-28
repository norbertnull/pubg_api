defmodule PubgApi.Json do
  def decode(data) do
    Jason.decode(data, [{:keys, :atoms}])
  end
end
