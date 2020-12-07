class ShowerEmissionService
  require "open-uri"
  def initialize(attributes)
    @shower_value = attributes
    @uri = "https://api.carbonkit.net/3.6/categories/"
  end

  def call
    calculate_emissions
  end

  private

  def calculate_emissions
    # times 1.11 will change from pounds to euro's
    data = open_url("#{@uri}Water_Defra/calculation?type=treatment
                    &values.quantity=#{((@shower_value.to_i * 7) * 365) / 1000}")
    data["output"]["amounts"].first["value"]
  end

  def open_url(url)
    request = open(url,
              "Accept" => "application/json",
              http_basic_authentication: ["Maarten", ENV['CARBONKIT_KEY']]).read
    JSON.parse(request)
  end
end
