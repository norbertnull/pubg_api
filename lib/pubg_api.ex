defmodule PubgApi do
  use HTTPoison.Base

  @endpoint "https://api.playbattlegrounds.com/"

  @headers PubgApi.Headers.new(%{
             gzip: Application.get_env(:pubg_api, :gzip),
             api_key: Application.get_env(:pubg_api, :api_key)
           })

  def process_url(endpoint) do
    @endpoint <> endpoint
  end

  def process_headers(headers) do
    Enum.into(headers, %{})
  end

  def request(endpoint, headers \\ %{}) when is_map(headers) do
    case PubgApi.get(endpoint, Map.merge(@headers, headers)) do
      {:ok, res} ->
        case Map.get(res.headers, "Content-Encoding") do
          "gzip" ->
            data =
              res.body
              |> :zlib.gunzip()
              |> PubgApi.Json.decode()

            case data do
              {:ok, data} ->
                headers = res.headers

                {:ok, data, headers}

              {:error, error} ->
                {:error, error}
            end

          _ ->
            data =
              res.body
              |> PubgApi.Json.decode()

            case data do
              {:ok, data} ->
                headers = res.headers

                {:ok, data, headers}

              {:error, error} ->
                {:error, error}
            end
        end

      {:error, error} ->
        {:error, error}
    end
  end
end
