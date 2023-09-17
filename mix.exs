defmodule ExWeatherkit.MixProject do
  use Mix.Project

  @source_url "https://github.com/brycejohnston/ex_weatherkit"
  @version "0.1.1"

  def project do
    [
      app: :ex_weatherkit,
      name: "ExWeatherkit",
      version: @version,
      elixir: "~> 1.14",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: "An Apple WeatherKit REST API client for Elixir",
      deps: deps(),
      package: package(),
      docs: docs(),
      preferred_cli_env: [docs: :docs]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:req, "~> 0.4.3"},
      {:jason, "~> 1.4"},
      {:joken, "~> 2.6"},
      {:ex_doc, "~> 0.29", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      name: "ex_weatherkit",
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      maintainers: ["Bryce Johnston"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs() do
    [
      main: "readme",
      name: "ExWeatherkit",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/ex_weatherkit",
      source_url: @source_url,
      extras: ["README.md", "LICENSE.md"]
    ]
  end
end
