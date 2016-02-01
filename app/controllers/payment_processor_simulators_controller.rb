class PaymentProcessorSimulatorsController < ApplicationController
  def new
    session[:credit_card] ||= {}
    @cc_info = PaymentProcessorSimulator.new
  end

  def create
    @cc_info = PaymentProcessorSimulator.new(pps_params)
    respond_to do |format|
      if @cc_info.valid?
        session[:credit_card] = @cc_info
        format.html { render :checkout }
      else
        format.html { render :new }
      end
    end
  end

  def checkout
    customer = Customer.find(session[:customer]["id"])
    cc_info = PaymentProcessorSimulator.new(
      session[:credit_card].except("errors")
    )
    if cc_info.valid_card?
      customer.add_token(cc_info)
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
