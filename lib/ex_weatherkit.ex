defmodule ExWeatherkit do
  @moduledoc """
  ExWeatherkit is an Apple WeatherKit API client for Elixir
  """

  @doc """
  Get current weather for a latitude and longitude.

  ## Parameters
    - lat: The latitude of the location to check the weather.
    - lng: The longitude of the location to check the weather.
    - lang: The language to get a localized response in. Default: English
    - tz: The timezone the server response should use. Default: UTC

  ## Example:
      iex> ExWeatherkit.current_weather(39.183608, -96.571669)
  """
  def current_weather(lat, lng, lang \\ "en", tz \\ "GMT/UTC") do
    "#{lang}/#{lat}/#{lng}?timezone=#{tz}&dataSets=currentWeather"
    |> ExWeatherkit.API.fetch()
  end

  @doc """
  Get daily forecast for a latitude and longitude.

  ## Parameters
    - lat: The latitude of the location to check the weather.
    - lng: The longitude of the location to check the weather.
    - lang: The language to get a localized response in. Default: English
    - tz: The timezone the server response should use. Default: UTC

  ## Example:
      iex> ExWeatherkit.forecast_daily(39.183608, -96.571669)
  """
  def forecast_daily(lat, lng, lang \\ "en", tz \\ "GMT/UTC") do
    "#{lang}/#{lat}/#{lng}?timezone=#{tz}&dataSets=forecastDaily"
    |> ExWeatherkit.API.fetch()
  end

  @doc """
  Get hourly forecast for a latitude and longitude.

  ## Parameters
    - lat: The latitude of the location to check the weather.
    - lng: The longitude of the location to check the weather.
    - lang: The language to get a localized response in. Default: English
    - tz: The timezone the server response should use. Default: UTC

  ## Example:
      iex> ExWeatherkit.forecast_hourly(39.183608, -96.571669)
  """
  def forecast_hourly(lat, lng, lang \\ "en", tz \\ "GMT/UTC") do
    "#{lang}/#{lat}/#{lng}?timezone=#{tz}&dataSets=forecastHourly"
    |> ExWeatherkit.API.fetch()
  end

  @doc """
  Get next hour forecast for a latitude and longitude.

  ## Parameters
    - lat: The latitude of the location to check the weather.
    - lng: The longitude of the location to check the weather.
    - lang: The language to get a localized response in. Default: English
    - tz: The timezone the server response should use. Default: UTC

  ## Example:
      iex> ExWeatherkit.forecast_next_hour(39.183608, -96.571669)
  """
  def forecast_next_hour(lat, lng, lang \\ "en", tz \\ "GMT/UTC") do
    "#{lang}/#{lat}/#{lng}?timezone=#{tz}&dataSets=forecastNextHour"
    |> ExWeatherkit.API.fetch()
  end

  @doc """
  Get weather alerts for a latitude and longitude.

  ## Parameters
    - lat: The latitude of the location to check the weather.
    - lng: The longitude of the location to check the weather.
    - lang: The language to get a localized response in. Default: English
    - tz: The timezone the server response should use. Default: UTC
    - country_code: ISO Alpha-2 country code of the requested location. Default: US

  ## Example:
      iex> ExWeatherkit.weather_alerts(39.183608, -96.571669)
  """
  def weather_alerts(lat, lng, lang \\ "en", tz \\ "GMT/UTC", country_code \\ "US") do
    "#{lang}/#{lat}/#{lng}?timezone=#{tz}&dataSets=weatherAlerts&countryCode=#{country_code}"
    |> ExWeatherkit.API.fetch()
  end

  @doc """
  Get multiple weather data sets for a latitude and longitude.

  ## Parameters
    - lat: The latitude of the location to check the weather.
    - lng: The longitude of the location to check the weather.
    - lang: The language to get a localized response in. Default: English
    - tz: The timezone the server response should use. Default: UTC
    - data_sets: A enumerable of the data you're requesting, supported values are: currentWeather, forecastDaily, forecastHourly, forecastNextHour, weatherAlerts. Default: currentWeather
    - country_code: ISO Alpha-2 country code of the requested location. Default: US

  ## Example:
      iex> ExWeatherkit.weather_multi(39.183608, -96.571669, ["currentWeather", "forecastDaily"])
  """
  def weather_multi(
        lat,
        lng,
        data_sets \\ ["currentWeather"],
        lang \\ "en",
        tz \\ "GMT/UTC",
        country_code \\ "US"
      ) do
    "#{lang}/#{lat}/#{lng}?timezone=#{tz}&dataSets=#{Enum.join(data_sets, ",")}&countryCode=#{country_code}"
    |> ExWeatherkit.API.fetch()
  end
end
