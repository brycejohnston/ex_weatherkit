defmodule ExWeatherkit.MixProject do
  use Mix.Project

  @source_url "https://github.com/brycejohnston/ex_weatherkit"
  @version "0.1.0"

  def project do
    [
      app: :ex_weatherkit,
      name: "ExWeatherKit",
      version: @version,
      elixir: "~> 1.14",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      source_url: "https://github.com/brycejohnston/ex_weatherkit",
      homepage_url: "https://github.com/brycejohnston/ex_weatherkit",
      description: "An Apple WeatherKit API client for Elixir",
      deps: deps(),
      package: package(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:req, "~> 0.3.6"},
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
