class PaymentProcessorSimulatorsController < ApplicationController

  def new
    session[:credit_card] ||= {}
    @payment = PaymentProcessorSimulator.new
  end

  def create
    @boarding_pass = BoardingPass.new(session[:boarding_pass])
    @payment = PaymentProcessorSimulator.new(pps_params)
    respond_to do |format|
      if @payment.valid?
        session[:credit_card] = @payment
        format.html { render :checkout }
      else
        format.html { render :new }
      end
    end
  end

  def checkout
    customer = Customer.find(session[:customer]["id"])
    payment = PaymentProcessorSimulator.new(
      session[:credit_card].except("errors")
    )
    if payment.valid_card?
      customer.add_token(payment)
      if boarding_pass = BoardingPass.create(session[:boarding_pass])
        flash[:notice] = "Purchase Successful! Thanks for using Sky Monkey!"
        boarding_pass.generate_qrcode
        redirect_to confirmation_url and return
      else
        flash[:notice] = "There was a problem generating your boarding pass. Please call support."
      end
    end
  end

  def confirmation
    @boarding_pass = BoardingPass.where(
      customer_id:session[:boarding_pass]['customer_id']
    ).last
  end

  private
  def pps_params
    params.require(:payment_processor_simulator).permit(
      :cc_number,
      :expiration,
      :cvc
    )
  end
end
