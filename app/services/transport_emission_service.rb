class TransportEmissionService
  require "open-uri"
  def initialize(attributes)
    @transport = attributes
  end

  def call
    calculate_emissions
  end

  private

  def calculate_emissions
    # if @transport == "walk/bike"
    #   return 0
    # elsif @transport == "car"
    # byebug
    request = open("https://api.carbonkit.net/3.6/categories/Generic_car_transport/calculation?fuel=average&values.useTypicalDistance=true",
              "Accept" => "application/json",
              http_basic_authentication: ["Maarten", "6E@ex37Sj^7tOy4SWf"]).read
    data = JSON.parse(request)
    # data = open_url("https://api.carbonkit.net/3.6/categories/Generic_car_transport/calculation?fuel=average&values.useTypicalDistance=true")
    data["output"]["amounts"].first["value"]
    # else @transport == "train"
    #   data = open_url("https://api.carbonkit.net/3.6/categories/Generic_train_transport/calculation?type=underground&values.IsReturn=true&values.UseTypicalDistance=true&values.Journeyfrequency=daily&values.Numberofjourneys=5")
    #   data["output"]["amounts"].first["value"]
    # end
  end

  def open_url(url)
    request = open(url,
              "Accept" => "application/json",
              http_basic_authentication: ["Maarten", "6E@ex37Sj^7tOy4SWf"]).read
    JSON.parse(request)
  end
end
