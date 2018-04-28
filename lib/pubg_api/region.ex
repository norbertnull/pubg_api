defmodule PubgApi.Region do
    @allowed_regions [:xbox_as, :xbox_eu, :xbox_na, :xbox_oc,
                      :pc_krjp, :pc_jp, :pc_na, :pc_na, :pc_eu,
                      :pc_oc, :pc_kakao, :pc_sea, :pc_sa, :pc_as]

    def allowed?(region) when is_atom(region) do
        region in @allowed_regions
    end

    def allowed?(region) when is_bitstring(region) do
        region = region
        |> String.replace("-","_", global: true)
        
        PubgApi.Region.allowed?(String.to_atom(region))
    end
end