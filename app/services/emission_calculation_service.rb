class EmissionCalculationService
  def initialize(transport, housing, food)
    @transport = transport
    @housing = housing
    @food = food
  end

  def call
    sum_emissions
  end

  private

  def sum_emissions
    @emission = @transport + @housing + @food
    @emission
  end
end
