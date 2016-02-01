class OvertimesController < ApplicationController
  before_action :set_overtime, only: [:show, :edit, :update, :destroy]

  # GET /overtimes
  # GET /overtimes.json
  def index
    @overtimes = Overtime.all
  end

  # GET /overtimes/1
  # GET /overtimes/1.json
  def show
  end

  # GET /overtimes/new
  def new
    @overtime = Overtime.new
  end

  # GET /overtimes/1/edit
  def edit
  end

  # POST /overtimes
  # POST /overtimes.json
  def create
    @overtime = Overtime.new(overtime_params)

    respond_to do |format|
      if @overtime.save
        format.html { redirect_to @overtime, notice: 'Overtime was successfully created.' }
        format.json { render :show, status: :created, location: @overtime }
      else
        format.html { render :new }
        format.json { render json: @overtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /overtimes/1
  # PATCH/PUT /overtimes/1.json
  def update
    respond_to do |format|
      if @overtime.update(overtime_params)
        format.html { redirect_to @overtime, notice: 'Overtime was successfully updated.' }
        format.json { render :show, status: :ok, location: @overtime }
      else
        format.html { render :edit }
        format.json { render json: @overtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /overtimes/1
  # DELETE /overtimes/1.json
  def destroy
    @overtime.destroy
    respond_to do |format|
      format.html { redirect_to overtimes_url, notice: 'Overtime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_overtime
      @overtime = Overtime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def overtime_params
      params.require(:overtime).permit(:employee_id, :ot_date, :ot_type, :ot_total_hrs, :total_production, :normal_wages_rate, :ot_wages_rate, :ot_earning, :paid_on_date, :remarks)
    end
end
