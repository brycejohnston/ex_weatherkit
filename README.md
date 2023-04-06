# ExWeatherkit

An Apple WeatherKit API client for Elixir

## Installation

The package can be installed by adding `ex_weatherkit` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_weatherkit, "~> 0.1.0"}
  ]
end
```

Add the required values to your config file

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

### Weather Alerts

```elixir
ExWeatherkit.weather_alerts(39.183608, -96.571669)
```

### Multiple weather datasets

```elixir
ExWeatherkit.weather_multi(39.183608, -96.571669, ["currentWeather", "forecastDaily"])
```

