defmodule ExWeatherkit.API do
  @moduledoc false

  @version ExWeatherkit.MixProject.project()[:version]

  def fetch(query) do
    get(query)
  end

  defp get(query) do
    headers = build_headers()
    req = Req.new(base_url: "https://weatherkit.apple.com/api/v1/weather", headers: headers)
    {:ok, res} = Req.get(req, url: query)
  end

  defp build_headers() do
    [
      {"Authorization", "Bearer #{generate_token()}"},
      {"User-Agent", "ExWeatherkit v#{@version}"}
    ]
  end

  defp generate_token do
    {:ok, token, _} =
      ExWeatherkit.Token.generate_and_sign(
        %{"sub" => Application.fetch_env!(:ex_weatherkit, :service_id)},
        Joken.Signer.create(
          "ES256",
          %{"pem" => Application.fetch_env!(:ex_weatherkit, :private_key)},
          %{
            "kid" => Application.fetch_env!(:ex_weatherkit, :key_id),
            "id" =>
              "#{Application.fetch_env!(:ex_weatherkit, :team_id)}.#{Application.fetch_env!(:ex_weatherkit, :service_id)}"
          }
        )
      )

    token
  end
end
