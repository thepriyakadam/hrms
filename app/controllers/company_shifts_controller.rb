class CompanyShiftsController < ApplicationController
  before_action :set_company_shift, only: [:show, :edit, :update, :destroy]

  # GET /company_shifts
  # GET /company_shifts.json
  def index
    @company_shifts = CompanyShift.all
  end

  # GET /company_shifts/1
  # GET /company_shifts/1.json
  def show
  end

  # GET /company_shifts/new
  def new
    @company_shift = CompanyShift.new
  end

  # GET /company_shifts/1/edit
  def edit
  end

  # POST /company_shifts
  # POST /company_shifts.json
  def create
    @company_shift = CompanyShift.new(company_shift_params)

    respond_to do |format|
      if @company_shift.save
        format.html { redirect_to @company_shift, notice: 'Company shift was successfully created.' }
        format.json { render :show, status: :created, location: @company_shift }
      else
        format.html { render :new }
        format.json { render json: @company_shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_shifts/1
  # PATCH/PUT /company_shifts/1.json
  def update
    respond_to do |format|
      if @company_shift.update(company_shift_params)
        format.html { redirect_to @company_shift, notice: 'Company shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_shift }
      else
        format.html { render :edit }
        format.json { render json: @company_shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_shifts/1
  # DELETE /company_shifts/1.json
  def destroy
    @company_shift.destroy
    respond_to do |format|
      format.html { redirect_to company_shifts_url, notice: 'Company shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_shift
      @company_shift = CompanyShift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_shift_params
      params.require(:company_shift).permit(:name, :in_time, :out_time)
    end
end
