class CustomersController < ApplicationController

  def new
    session[:customer] ||= {}
    @customer = Customer.new
  end

  def create
    @customer = Customer.find_or_initialize_by(email: customer_params[:email])

    respond_to do |format|
      if @customer.update_attributes(customer_params)
        session[:customer] = @customer
        format.html { redirect_to controller: 'boarding_passes', action: 'new' }
      else
        format.html { render 'new' }
      end
    end
  end

  def update
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :email)
    end
end
