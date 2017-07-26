class ClassificationFundsController < ApplicationController
  before_action :set_classification_fund, only: [:show, :edit, :update, :destroy]

  # GET /classification_funds
  # GET /classification_funds.json
  def index
    @classification_fund_sets = ClassificationFund.fetch_data
  end

  # GET /classification_funds/1
  # GET /classification_funds/1.json
  def show
  end

  # GET /classification_funds/new
  def new
    @classification_fund = ClassificationFund.new
  end

  # GET /classification_funds/1/edit
  def edit
  end

  # POST /classification_funds
  # POST /classification_funds.json
  def create
    @classification_fund = ClassificationFund.new(classification_fund_params)

    respond_to do |format|
      if @classification_fund.save
        format.html { redirect_to @classification_fund, notice: 'Classification fund was successfully created.' }
        format.json { render :show, status: :created, location: @classification_fund }
      else
        format.html { render :new }
        format.json { render json: @classification_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classification_funds/1
  # PATCH/PUT /classification_funds/1.json
  def update
    respond_to do |format|
      if @classification_fund.update(classification_fund_params)
        format.html { redirect_to @classification_fund, notice: 'Classification fund was successfully updated.' }
        format.json { render :show, status: :ok, location: @classification_fund }
      else
        format.html { render :edit }
        format.json { render json: @classification_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classification_funds/1
  # DELETE /classification_funds/1.json
  def destroy
    @classification_fund.destroy
    respond_to do |format|
      format.html { redirect_to classification_funds_url, notice: 'Classification fund was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classification_fund
      @classification_fund = ClassificationFund.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classification_fund_params
      params[:classification_fund]
    end
end
