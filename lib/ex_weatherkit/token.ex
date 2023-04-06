defmodule ExWeatherkit.Token do
  @moduledoc false

  use Joken.Config

  @impl true
  def token_config do
    default_claims(
      iss: Application.fetch_env!(:ex_weatherkit, :team_id),
      default_exp: 60,
      aud: "ExWeatherkit"
    )
  end
end
