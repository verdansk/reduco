class FoodEmissionService
  require "open-uri"
  def initialize(attributes)
    @food_value = attributes
    @uri = "https://api.carbonkit.net/3.6/categories/"
  end

  def call
    calculate_emissions
  end

  private

  def calculate_emissions
      data = open_url("#{@uri}Personal/calculation?type=food_drink_tobacco&values.CurrencyGBP=#{@food_value}")
      data["output"]["amounts"].first["value"]
  end

  def open_url(url)
    request = open(url,
              "Accept" => "application/json",
              http_basic_authentication: ["Maarten", "6E@ex37Sj^7tOy4SWf"]).read
    JSON.parse(request)
  end
end
