# ExWeatherkit

[![hex.pm](https://img.shields.io/hexpm/v/ex_weatherkit.svg)](https://hex.pm/packages/ex_weatherkit)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/ex_weatherkit/)
[![hex.pm](https://img.shields.io/hexpm/dt/ex_weatherkit.svg)](https://hex.pm/packages/ex_weatherkit)
[![hex.pm](https://img.shields.io/hexpm/l/ex_weatherkit.svg)](https://hex.pm/packages/ex_weatherkit)

An Apple WeatherKit REST API client for Elixir

## Installation

The package can be installed by adding `ex_weatherkit` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_weatherkit, "~> 0.1.0"}
  ]
end
```

You will need an Apple Developer Program membership to [create a private key for WeatherKit access and a Service ID](https://developer.apple.com/documentation/weatherkitrestapi/request_authentication_for_weatherkit_rest_api) to access the WeatherKit REST API.

Once you have those along with your ADP membership Team ID, add the required values to your config file (preferable to load values from env variables)

```elixir
config :ex_weatherkit,
  key_id: "ABCDEF1234"
  service_id: "com.example.weatherkitclient"
  team_id: "ZYXWVU8765"
  private_key: """-----BEGIN PRIVATE KEY-----...."""
```

## Usage

### Current weather

```elixir
ExWeatherkit.current_weather(39.183608, -96.571669)
```

### Daily forecast

```elixir
ExWeatherkit.forecast_daily(39.183608, -96.571669)
```

### Hourly forecast

```elixir
ExWeatherkit.forecast_hourly(39.183608, -96.571669)
```

### Next hour forecast

```elixir
ExWeatherkit.forecast_next_hour(39.183608, -96.571669)
```

### Weather alerts

```elixir
ExWeatherkit.weather_alerts(39.183608, -96.571669)
```

### Multiple weather datasets

```elixir
ExWeatherkit.weather_multi(39.183608, -96.571669, ["currentWeather", "forecastDaily"])
```