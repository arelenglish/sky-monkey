class RatesController < ApplicationController
  before_action :set_rate, only: [:show, :edit, :update, :destroy]

  def index
    @rates = Rate.all
  end

  def show
  end

  def new
    @rate = Rate.new
  end

  def edit
  end

  def create
    @rate = Rate.new(rate_params)
    respond_to do |format|
      if @rate.save
        format.html { redirect_to @rate, notice: 'Rate was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @rate.update(rate_params)
        format.html { redirect_to @rate, notice: 'Rate was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @rate.destroy
    respond_to do |format|
      format.html { redirect_to rates_url, notice: 'Rate was successfully destroyed.' }
    end
  end

  private
    def set_rate
      @rate = Rate.find(params[:id])
    end

    def rate_params
      params.require(:rate).permit(:price, :tax_rate, :active_date)
    end
end
