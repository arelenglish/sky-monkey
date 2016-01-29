class PaymentProcessorSimulatorsController < ApplicationController
  def new
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
  end

  def confirmation
    # create boarding pass
    boarding_pass = BoardingPass.create(session[:boarding_pass])
    # add token to user
    customer = Customer.find(session[:customer]["id"])
    cc_info = PaymentProcessorSimulator.new(
      session[:credit_card].except("errors")
    )
    cc_info.add_customer_token(customer)
    # show success message

    # Send a confirmation email to the customer with a basic summary of their purchase and their boarding pass.
    # Show a boarding pass (either a QR code or a simple unique code as described below)
    # create transaction if boarding passes doesn't give enough infor for reports
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
