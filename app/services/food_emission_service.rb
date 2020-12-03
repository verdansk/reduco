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
    # times 1.11 will change from pounds to euro's
    data = open_url("#{@uri}Personal/calculation?type=food_drink_tobacco&values.CurrencyGBP=#{@food_value.to_i * 1.11}")
    data["output"]["amounts"].first["value"] * 12
  end

  def open_url(url)
    request = open(url,
              "Accept" => "application/json",
              http_basic_authentication: ["Maarten", ENV['CARBONKIT_KEY']]).read
    JSON.parse(request)
  end
end
