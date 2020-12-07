class EmissionCalculationService
  def initialize(transport, housing, food, shower)
    @transport = transport
    @housing = housing
    @food = food
    @shower = shower
  end

  def call
    sum_emissions
  end

  private

  def sum_emissions
    @emission = @transport + @housing + @food + @shower
    @emission
  end
end
