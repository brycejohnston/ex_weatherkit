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
{:ok, weather, _status} = ExWeatherkit.current_weather(39.183608, -96.571669)

{:ok,
 %{
   "currentWeather" => %{
     "asOf" => "2023-09-17T13:28:23Z",
     "cloudCover" => 0.13,
     "cloudCoverHighAltPct" => 0.0,
     "cloudCoverLowAltPct" => 0.2,
     "cloudCoverMidAltPct" => 0.0,
     "conditionCode" => "MostlyClear",
     "daylight" => true,
     "humidity" => 0.83,
     "metadata" => %{
       "attributionURL" => "https://developer.apple.com/weatherkit/data-source-attribution/",
       "expireTime" => "2023-09-17T13:33:23Z",
       "latitude" => 39.184,
       "longitude" => -96.572,
       "readTime" => "2023-09-17T13:28:23Z",
       "reportedTime" => "2023-09-17T12:13:09Z",
       "units" => "m",
       "version" => 1
     },
     "name" => "CurrentWeather",
     "precipitationIntensity" => 0.0,
     "pressure" => 1019.47,
     "pressureTrend" => "rising",
     "temperature" => 13.49,
     "temperatureApparent" => 13.08,
     "temperatureDewPoint" => 10.73,
     "uvIndex" => 0,
     "visibility" => 23615.8,
     "windDirection" => 18,
     "windGust" => 10.27,
     "windSpeed" => 5.1
   }
 }, 200}
```

### Daily forecast

```elixir
{:ok, weather, _status} = ExWeatherkit.forecast_daily(39.183608, -96.571669)
```

### Hourly forecast

```elixir
{:ok, weather, _status} = ExWeatherkit.forecast_hourly(39.183608, -96.571669)
```

### Next hour forecast

```elixir
{:ok, weather, _status} = ExWeatherkit.forecast_next_hour(39.183608, -96.571669)
```

### Weather alerts

```elixir
{:ok, weather, _status} = ExWeatherkit.weather_alerts(39.183608, -96.571669)
```

### Multiple weather datasets

```elixir
{:ok, weather, _status} = ExWeatherkit.weather_multi(39.183608, -96.571669, ["currentWeather", "forecastDaily"])
```