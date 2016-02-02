class BoardingPassesController < ApplicationController
  before_action :set_boarding_pass, only: [:update]

  def new
    @boarding_pass = BoardingPass.new
  end

  def create
    @boarding_pass = BoardingPass.new(boarding_pass_params)
    session[:boarding_pass] = @boarding_pass
    respond_to do |format|
      format.html { redirect_to controller: 'payment_processor_simulators', action: 'new' }
    end
  end

  def update
    respond_to do |format|
      if @boarding_pass.update(boarding_pass_params)
        session[:boarding_pass] = @boarding_pass
        format.html { redirect_to @boarding_pass, notice: 'Boarding pass was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
  def set_boarding_pass
    @boarding_pass = BoardingPass.find(params[:id])
  end

  def boarding_pass_params
    params.require(:boarding_pass).permit(
      :price,
      :quantity,
      :tax_paid,
      :expiration,
      :is_valid,
      :customer_id
    )
  end
end
