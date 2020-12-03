class TransportEmissionService
  require "open-uri"
  def initialize(attributes)
    @transport = attributes
    @uri = "https://api.carbonkit.net/3.6/categories/"
  end

  def call
    calculate_emissions
  end

  private

  def calculate_emissions
    case @transport
    when "car"
      data = open_url("#{@uri}Generic_car_transport/calculation?fuel=average&values.useTypicalDistance=true")
      data["output"]["amounts"].first["value"]
    when "train"
      data = open_url("#{@uri}Generic_train_transport/calculation?type=underground&values.IsReturn=true
                      &values.UseTypicalDistance=true&values.Journeyfrequency=daily&values.Numberofjourneys=5")
      data["output"]["amounts"].first["value"]
    else 0
    end
  end

  def open_url(url)
    request = open(url,
              "Accept" => "application/json",
              http_basic_authentication: ["Maarten", ENV['CARBONKIT_KEY']]).read
    JSON.parse(request)
  end
end
