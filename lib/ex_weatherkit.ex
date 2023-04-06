defmodule ExWeatherkit do
  @moduledoc """
  ExWeatherkit is an Apple WeatherKit REST API client for Elixir
  """

  @doc """
  Get current weather for a latitude and longitude

  ## Parameters
    - lat: The latitude of the desired location
    - lng: The longitude of the desired location
    - lang: The language tag to use for localizing responses
    - tz: The name of the timezone to use for rolling up weather forecasts into daily forecasts

  ## Example:
      iex> ExWeatherkit.current_weather(39.183608, -96.571669)
  """
  def current_weather(lat, lng, lang \\ "en", tz \\ "GMT/UTC") do
    "#{lang}/#{lat}/#{lng}?timezone=#{tz}&dataSets=currentWeather"
    |> ExWeatherkit.API.fetch()
  end

  @doc """
  Get daily forecast for a latitude and longitude

  ## Parameters
    - lat: The latitude of the desired location
    - lng: The longitude of the desired location
    - lang: The language tag to use for localizing responses
    - tz: The name of the timezone to use for rolling up weather forecasts into daily forecasts

  ## Example:
      iex> ExWeatherkit.forecast_daily(39.183608, -96.571669)
  """
  def forecast_daily(lat, lng, lang \\ "en", tz \\ "GMT/UTC") do
    "#{lang}/#{lat}/#{lng}?timezone=#{tz}&dataSets=forecastDaily"
    |> ExWeatherkit.API.fetch()
  end

  @doc """
  Get hourly forecast for a latitude and longitude

  ## Parameters
    - lat: The latitude of the desired location
    - lng: The longitude of the desired location
    - lang: The language tag to use for localizing responses
    - tz: The name of the timezone to use for rolling up weather forecasts into daily forecasts

  ## Example:
      iex> ExWeatherkit.forecast_hourly(39.183608, -96.571669)
  """
  def forecast_hourly(lat, lng, lang \\ "en", tz \\ "GMT/UTC") do
    "#{lang}/#{lat}/#{lng}?timezone=#{tz}&dataSets=forecastHourly"
    |> ExWeatherkit.API.fetch()
  end

  @doc """
  Get next hour forecast for a latitude and longitude

  ## Parameters
    - lat: The latitude of the desired location
    - lng: The longitude of the desired location
    - lang: The language tag to use for localizing responses
    - tz: The name of the timezone to use for rolling up weather forecasts into daily forecasts

  ## Example:
      iex> ExWeatherkit.forecast_next_hour(39.183608, -96.571669)
  """
  def forecast_next_hour(lat, lng, lang \\ "en", tz \\ "GMT/UTC") do
    "#{lang}/#{lat}/#{lng}?timezone=#{tz}&dataSets=forecastNextHour"
    |> ExWeatherkit.API.fetch()
  end

  @doc """
  Get weather alerts for a latitude and longitude

  ## Parameters
    - lat: The latitude of the desired location
    - lng: The longitude of the desired location
    - lang: The language tag to use for localizing responses
    - tz: The name of the timezone to use for rolling up weather forecasts into daily forecasts
    - country_code: The ISO Alpha-2 country code for the requested location

  ## Example:
      iex> ExWeatherkit.weather_alerts(39.183608, -96.571669)
  """
  def weather_alerts(lat, lng, lang \\ "en", tz \\ "GMT/UTC", country_code \\ "US") do
    "#{lang}/#{lat}/#{lng}?timezone=#{tz}&dataSets=weatherAlerts&countryCode=#{country_code}"
    |> ExWeatherkit.API.fetch()
  end

  @doc """
  Get multiple weather data sets for a latitude and longitude

  ## Parameters
    - lat: The latitude of the desired location
    - lng: The longitude of the desired location
    - lang: The language tag to use for localizing responses
    - tz: The name of the timezone to use for rolling up weather forecasts into daily forecasts
    - data_sets: A list of data sets to include in the response, possible values: currentWeather, forecastDaily, forecastHourly, forecastNextHour, weatherAlerts
    - country_code: The ISO Alpha-2 country code of the requested location

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
