class PaymentProcessorSimulatorsController < ApplicationController
  before_action :find_customer, only: [:create, :checkout]

  def new
    session[:payment] ||= {}
    @payment = PaymentProcessorSimulator.new
  end

  def create
    @boarding_pass = BoardingPass.new(session[:boarding_pass])
    @payment = PaymentProcessorSimulator.new(payment_params: payment_params, customer: @customer )
    respond_to do |format|
      if @payment.valid?
        session[:payment] = @payment
        format.html { render :checkout }
      else
        format.html { render :new }
      end
    end
  end

  def checkout
    payment = PaymentProcessorSimulator.new(
      payment_params: session[:payment].except("errors"),
      customer: @customer
    ).execute

    if payment.success? && boarding_pass = BoardingPass.create(session[:boarding_pass])
      flash[:notice] = 'Purchase Successful! Thanks for using Sky Monkey!'
      boarding_pass.generate_qrcode
      redirect_to confirmation_url and return
    else
      flash[:notice] = 'There was a problem generating your boarding pass. Please call support.'
    end
  end

  def confirmation
    @boarding_pass = BoardingPass.where(
      customer_id:session[:boarding_pass]['customer_id']
    ).last
  end

  private
  def find_customer
    @customer = Customer.find(session[:customer]["id"])
  end

  def payment_params
    params.require(:payment_processor_simulator).permit(
      :cc_number,
      :expiration,
      :cvc
    )
  end
end
