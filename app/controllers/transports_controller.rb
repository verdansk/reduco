class TransportsController < ApplicationController
  def new
    @transport = Transport.new
  end

  def create
    @transport = Transport.new(strong_params_transports)
    @user = current_user
    @transport.user = @user
    if @transport.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def strong_params_transports
    params.require(:transport).permit(:category, :fuel, :distance, :fuel_consumption, :happened_at)
  end

end
