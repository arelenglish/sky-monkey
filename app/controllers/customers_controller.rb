class CustomersController < ApplicationController
  before_action :set_customer, only: [:update]

  # GET /customers/new
  def new
    session[:customer] ||= {}
    @customer = Customer.new
  end

  # POST /customers
  def create
    @customer = Customer.find_or_initialize_by(email: customer_params[:email])

    respond_to do |format|
      if @customer.update_attributes(customer_params)
        session[:customer] = @customer
        format.html { redirect_to controller: 'boarding_passes', action: 'new' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /customers/1
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to controller: 'boarding_passes', action: 'new'}
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :email)
    end
end
