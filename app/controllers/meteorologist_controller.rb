require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather_form
    # Nothing to do here.
    render("street_to_weather_form.html.erb")
  end

  def street_to_weather
    @street_address = params[:user_street_address]
    url_safe_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A URL-safe version of the street address, with spaces and other illegal
    #   characters removed, is in the string url_safe_street_address.
    # ==========================================================================


@url_weather = "https://api.forecast.io/forecast/0b529255c0bf79aaa413b086319ddc79/" + @lat + "," + @lng
@parsed = JSON.parse(open(@url_weather).read)


    @current_temperature = @parsed["currently"]["temperature"]

    @current_summary = @parsed["currently"]["summary"]

    @summary_of_next_sixty_minutes = @parsed["minutely"]["summary"]

    @summary_of_next_several_hours = @parsed["hourly"]["summary"]

    @summary_of_next_several_days = @parsed["daily"]["summary"]

    render("street_to_weather.html.erb")
  end
end

