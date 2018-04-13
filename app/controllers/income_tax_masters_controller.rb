class IncomeTaxMastersController < ApplicationController
  before_action :set_income_tax_master, only: [:show, :edit, :update, :destroy]

  # GET /income_tax_masters
  # GET /income_tax_masters.json
  def index
    @income_tax_masters = IncomeTaxMaster.all
  end

  # GET /income_tax_masters/1
  # GET /income_tax_masters/1.json
  def show
  end

  # GET /income_tax_masters/new
  def new
    @income_tax_master = IncomeTaxMaster.new
    @income_tax_masters = IncomeTaxMaster.all
  end

  # GET /income_tax_masters/1/edit
  def edit
  end

  # POST /income_tax_masters
  # POST /income_tax_masters.json
  def create
    @income_tax_master = IncomeTaxMaster.new(income_tax_master_params)
    @income_tax_masters = IncomeTaxMaster.all

    respond_to do |format|
      if @income_tax_master.save
        @income_tax_master = IncomeTaxMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Income Tax Master Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /income_tax_masters/1
  # PATCH/PUT /income_tax_masters/1.json
  def update
    @income_tax_master.update(income_tax_master_params)
    @income_tax_master = IncomeTaxMaster.new
    @income_tax_masters = IncomeTaxMaster.all
  end

  # DELETE /income_tax_masters/1
  # DELETE /income_tax_masters/1.json
  def destroy
    @income_tax_master.destroy
    @income_tax_masters = IncomeTaxMaster.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income_tax_master
      @income_tax_master = IncomeTaxMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_tax_master_params
      params.require(:income_tax_master).permit(:name, :relation, :second_name, :designation, :status)
    end
end
