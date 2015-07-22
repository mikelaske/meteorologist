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


  def temp
          require 'uri'
          url = "https://api.forecast.io/forecast/5fa7d55c02984ea9bcad2898c1e155c4/#{@lat},#{@lng}"


               parsed_data = JSON.parse(open(url).read)
               temperature = parsed_data["currently"]["temperature"]
    end

    @current_temperature = "currently.temperature"

    @current_summary = "currently.summary"

    @summary_of_next_sixty_minutes = "minutely.data[60].time"

    @summary_of_next_several_hours = "minutely.data[180].time"

    @summary_of_next_several_days = "minutely.data[7200].time"

    render("street_to_weather.html.erb")
  end
end

