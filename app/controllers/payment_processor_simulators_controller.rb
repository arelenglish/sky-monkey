class PaymentProcessorSimulatorsController < ApplicationController
  def new
    @cc_info = PaymentProcessorSimulator.new
  end

  def create
    @cc_info = PaymentProcessorSimulator.new(pps_params)
    respond_to do |format|
      if @cc_info.valid?
        format.html { redirect_to controller: 'boarding_passes', action: 'new' }
      else
        format.html { render :new }
        # format.html { render controller: 'payment_processor_simulators', action: 'new' }
      end
    end
  end

  private
  def pps_params
    params.require(:payment_processor_simulator).permit(
      :cc_number,
      :expiration,
      :cvc
    )
    # p = params[:payment_processor_simulator]
    # expiration = Date.new(p["expiration(1i)"].to_i, p["expiration(2i)"].to_i, p["expiration(3i)"].to_i)
    # {cc_number: p[:cc_number], expiration: expiration, cvc: p[:cvc]}
  end
end
