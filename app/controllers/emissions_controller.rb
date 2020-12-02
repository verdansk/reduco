class EmissionsController < ApplicationController

  def new
    @emission = Emission.new()
  end

  def create
    @transport =
    # parse_transports(transport)
  end

  private

  def parse_transports(transport)

  end

end
