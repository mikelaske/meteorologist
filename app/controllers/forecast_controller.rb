require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

@url_weather = "https://api.forecast.io/forecast/0b529255c0bf79aaa413b086319ddc79/" + @lat + "," + @lng
@parsed = JSON.parse(open(@url_weather).read)


    @current_temperature = @parsed["currently"]["temperature"]

    @current_summary = @parsed["currently"]["summary"]

    @summary_of_next_sixty_minutes = @parsed["minutely"]["summary"]

    @summary_of_next_several_hours = @parsed["hourly"]["summary"]

    @summary_of_next_several_days = @parsed["daily"]["summary"]

    render("coords_to_weather.html.erb")
  end
end
