class BoardingPassesController < ApplicationController
  before_action :set_boarding_pass, only: [:update]

  # GET /boarding_passes/new
  def new
    @boarding_pass = BoardingPass.new
  end

  # POST /boarding_passes
  def create
    @boarding_pass = BoardingPass.new(boarding_pass_params)
    session[:boarding_pass] = @boarding_pass
    respond_to do |format|
      format.html { redirect_to controller: 'payment_processor_simulators', action: 'new' }
    end
  end

  # PATCH/PUT /boarding_passes/1
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
  # Use callbacks to share common setup or constraints between actions.
  def set_boarding_pass
    @boarding_pass = BoardingPass.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
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
