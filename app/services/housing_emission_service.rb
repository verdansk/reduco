class HousingEmissionService
  require "open-uri"
  def initialize(attributes)
    @housing = attributes
    @uri = "https://api.carbonkit.net/3.6/categories/"
  end

  def call
    calculate_emissions
  end

  private

  def calculate_emissions
    case @housing
    when "flat"
      data = open_url("#{@uri}Heating_uk/calculation?homeType=flat&fuel=gas&values.Age=1930-1995&values.numberOfBedrooms=2
                      &values.heatingType=boiler+(condensing)")
      data["output"]["amounts"].first["value"]
    when "mid-terrace-house"
      data = open_url("#{@uri}Heating_uk/calculation?homeType=mid-terrace+house&fuel=gas&values.Age=1930-1995
                      &values.numberOfBedrooms=3&values.heatingType=boiler+(condensing)")
      data["output"]["amounts"].first["value"]
    when "detached-house"
      data = open_url("#{@uri}Heating_uk/calculation?homeType=detached+house&fuel=gas&values.Age=1930-1995&values.numberOfBedrooms=4
                      &values.heatingType=boiler+(condensing)")
      data["output"]["amounts"].first["value"]
    else puts "Error - No housetype selected"
    end
  end

  def open_url(url)
    request = open(url,
              "Accept" => "application/json",
              http_basic_authentication: ["Maarten", "6E@ex37Sj^7tOy4SWf"]).read
    JSON.parse(request)
  end
end
